import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/tmdb_movie_basic.dart';

class MovieWidget extends StatelessWidget {
  final TMDBMovieBasic movie;

  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(movie.overview),
            const SizedBox(height: 10),
            Center(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
