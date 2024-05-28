import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  const SettingsRepository(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  // synchronous read
  bool onboardingComplete() {
    return sharedPreferences.getBool('onboardingComplete') ?? false;
  }

  // asynchronous write
  Future<void> setOnboardingComplete(bool complete) {
    return sharedPreferences.setBool('onboardingComplete', complete);
  }
}
