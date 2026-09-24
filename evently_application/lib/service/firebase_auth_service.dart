import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_application/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // message of the last failed login/register, shown in the SnackBar
  static String? lastError;

  //login
  static Future<UserModel?> login(UserModel user) async {
    lastError = null;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
      String uid = userCredential.user!.uid;
      log("---> Login success");
      // Auth succeeded -> the user is logged in even if Firestore fails
      UserModel fallback = UserModel(uid: uid, email: user.email, password: '');
      try {
        UserModel? userData = await getUser(
          uid,
        ).timeout(const Duration(seconds: 10));
        if (userData == null) {
          // user exists in Auth but has no Firestore doc -> create it
          log("---> No Firestore doc for $uid, creating one");
          await createUser(fallback).timeout(const Duration(seconds: 10));
          return fallback;
        }
        return userData;
      } catch (e) {
        log("---> Login Firestore error (ignored): $e");
        return fallback;
      }
    } on FirebaseAuthException catch (e) {
      lastError = handleError(e.code, e.message);
      log("---> Login Firebase ${e.code}: ${e.message}");
      return null;
    } catch (e) {
      lastError = 'Login failed: $e';
      log("---> Login error: $e");
      return null;
    }
  }

  //register
  static Future<UserModel?> register(UserModel user) async {
    lastError = null;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
      user.uid = userCredential.user!.uid;
      log("---> Register success");
      // Auth account is created -> don't fail registration if Firestore fails
      try {
        await createUser(user).timeout(const Duration(seconds: 10));
      } catch (e) {
        log("---> Register Firestore error (ignored): $e");
      }
      return user;
    } on FirebaseAuthException catch (e) {
      lastError = handleError(e.code, e.message);
      log("---> Register Firebase ${e.code}: ${e.message}");
      return null;
    } catch (e) {
      lastError = 'Register failed: $e';
      log("---> Register error: $e");
      return null;
    }
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot<UserModel> doc = await getUsersCollection().doc(uid).get();
    return doc.data();
  }

  static Future createUser(UserModel user) async {
    CollectionReference<UserModel> collection = getUsersCollection();
    //create new doc
    DocumentReference doc = collection.doc(user.uid);
    await doc.set(user);
  }

  static String handleError(String code, [String? message]) {
    switch (code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Wrong email or password.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'operation-not-allowed':
        return 'Email/Password sign-in is not enabled in Firebase Console.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return message ?? 'Something went wrong ($code).';
    }
  }
  //logout
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
