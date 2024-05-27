import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/fake_firebase_auth.dart';
import '../auth/user.dart';

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  // get FirebaseAuth from the provider below
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  // call a method that returns a Stream<User?>
  return firebaseAuth.authStateChanges();
});

// provider to access the FirebaseAuth instance
final firebaseAuthProvider = Provider<FakeFirebaseAuth>((ref) {
  final auth = FakeFirebaseAuth();
  ref.onDispose(() => auth.dispose());
  return auth;
});
