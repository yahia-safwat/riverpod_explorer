class Weather {
  final String city;
  final String description;
  final double temperature;

  Weather({
    required this.city,
    required this.description,
    required this.temperature,
  });

  @override
  String toString() {
    return 'Weather($city, $description, temperature: $temperature)';
  }
}
