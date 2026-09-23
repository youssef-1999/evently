import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_application/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  //login
  static Future <UserModel?> login(UserModel user) async{
    //singelton
    try {
    UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user.email,
      password: user.password
  );
UserModel? userData=await getUser(userCredential.user!.uid);
log("---> Login success");
return userData;
    } catch (e) {
      log("---> Login Firebase $e");
      return null;
    }
  }
  //register

   static Future <String?> register(UserModel user) async{
    //singelton
    try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password
  );
  user.uid=userCredential.user!.uid;
  await createUser(user);
  return null;
    } on FirebaseAuthException catch (e) {
      log("---> Register Firebase ${e.code}: ${e.message}");
      return e.message ?? e.code;
    } catch (e) {
      log("---> Register Firebase $e");
      return e.toString();
    }
  }

  static CollectionReference<UserModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
      fromFirestore: (snapshot, options) => UserModel.fromJson(snapshot.data() ?? {}),
      toFirestore: (value, options) => value.toJson(),
    );
  }

  static Future<UserModel?> getUser(String uid)async{
    DocumentSnapshot<UserModel> doc = await getUsersCollection().doc(uid).get();
    return doc.data();
  }
  static Future createUser(UserModel user)async {
    CollectionReference<UserModel> collection = getUsersCollection();
    //create new doc
    DocumentReference doc = collection.doc(user.uid);
   await doc.set(user);
  }

  static String (String code) {

    if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  } else {
    print('Error: ${e.message}');
  }
  }
  //logout
}