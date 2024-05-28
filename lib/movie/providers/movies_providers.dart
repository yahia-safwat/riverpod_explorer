import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../repositories/movies_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final fetchMoviesRepositoryProvider = Provider<MoviesRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return MoviesRepository(dio);
});
