import 'dart:async';
import 'weather.dart';

class WeatherRepository {
  Future<Weather> getWeather({required String city}) async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));

    // Returning fake weather data
    return Weather(
      city: city,
      description: 'Sunny',
      temperature: 25.0,
    );
  }
}
