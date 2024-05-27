// auth_controller.dart
import 'package:flutter/material.dart';
import 'user.dart';

class AuthController extends ChangeNotifier {
  // mutable state
  User? user;

  // computed state
  bool get isSignedIn => user != null;

  Future<void> signIn(String uid, String email) async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // update state
    user = User(uid: uid, email: email);
    // and notify any listeners
    notifyListeners();
  }

  Future<void> signOut() async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // update state
    user = null;
    // and notify any listeners
    notifyListeners();
  }
}
