class TMDBMovieBasic {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  TMDBMovieBasic({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  // Factory method to create an instance from a JSON object
  factory TMDBMovieBasic.fromJson(Map<String, dynamic> json) {
    return TMDBMovieBasic(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}
