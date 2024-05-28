import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/connection.dart';

final connectionProvider = StateProvider<Connection>((ref) {
  return Connection();
});
