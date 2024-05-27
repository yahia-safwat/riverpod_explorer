import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_controller.dart';

final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});
