import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  User? user;

  // constructor: بيسمع تغيّر حالة Firebase تلقائي
  AuthProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      user = firebaseUser;
      notifyListeners();
    });
  }

  Future<void> login(String email, String password) async {
    try {
      user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      print("USER LOGGED IN: ${user?.email}");
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print("LOGIN ERROR: ${e.code}");
      rethrow;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    user = null;
    notifyListeners();
  }
}
