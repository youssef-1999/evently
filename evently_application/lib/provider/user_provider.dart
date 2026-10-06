import 'package:evently_application/models/user_model.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? user;

  // called after login
  void setUser(UserModel? newUser) {
    user = newUser;
    notifyListeners();
  }

  // called on app start when the user is already logged in
  Future<void> loadUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    user = await FirebaseAuthService.getUser(uid);
    print('User loaded: ${user?.name}');
    notifyListeners();
  }

  // called on logout
  void clearUser() {
    user = null;
    notifyListeners();
  }
}
