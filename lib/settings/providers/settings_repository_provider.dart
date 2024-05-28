import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/shared_preferences_provider.dart';
import '../repositories/settings_repository.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SettingsRepository(sharedPreferences);
});
