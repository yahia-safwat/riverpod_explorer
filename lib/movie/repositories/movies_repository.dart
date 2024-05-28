// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import '../models/tmdb_movie_basic.dart';

class MoviesRepository {
  final Dio _dio;

  MoviesRepository(this._dio);

  Future<TMDBMovieBasic> movie({required int movieId}) async {
    // final response = await _dio
    //     .get('https://api.themoviedb.org/3/movie/$movieId', queryParameters: {
    //   'api_key': 'YOUR_API_KEY',
    // });
    // return TMDBMovieBasic.fromJson(response.data);

    return TMDBMovieBasic.fromJson(fakeResponseData);
  }
}

// Fake response data for testing
final fakeResponseData = {
  'id': 550,
  'title': 'Fight Club',
  'overview':
      'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.',
  'poster_path': '/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg',
};
