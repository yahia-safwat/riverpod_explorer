import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tmdb_movie_basic.dart';
import 'movies_providers.dart';

final movieProvider = FutureProvider.autoDispose
    .family<TMDBMovieBasic, int>((ref, movieId) async {
  final moviesRepo = ref.watch(fetchMoviesRepositoryProvider);
  return moviesRepo.movie(movieId: movieId);
});
