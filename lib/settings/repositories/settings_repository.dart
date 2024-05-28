import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/shared_preferences_provider.dart';

class SettingsRepository {
  const SettingsRepository(this.ref);
  final Ref ref;

  // synchronous read
  bool onboardingComplete() {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    return sharedPreferences.getBool('onboardingComplete') ?? false;
  }

  // asynchronous write
  Future<void> setOnboardingComplete(bool complete) {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    return sharedPreferences.setBool('onboardingComplete', complete);
  }
}
