import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../weather/weather.dart';
import '../weather/weather_repository.dart';

final weatherFutureProvider = FutureProvider.autoDispose<Weather>((ref) {
  // get repository from the provider below
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  // call method that returns a Future<Weather>
  return weatherRepository.getWeather(city: 'London');
});

// example weather repository provider
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository(); // declared elsewhere
});
