import 'dart:async';
import 'user.dart';

class FakeFirebaseAuth {
  final StreamController<User?> _authStateController =
      StreamController<User?>();

  // Expose the stream
  Stream<User?> authStateChanges() {
    return _authStateController.stream;
  }

  // Simulate a login
  void login(String uid, String email) {
    _authStateController.add(User(uid: uid, email: email));
  }

  // Simulate a logout
  void logout() {
    _authStateController.add(null);
  }

  // Dispose the stream controller
  void dispose() {
    _authStateController.close();
  }
}
