import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModle extends Movie {
  const MovieModle({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genderIds,
    required super.overview,
    required super.voteAverge,
    required super.releaseDate,
  });

  factory MovieModle.fromJson(Map<String, dynamic> json) => MovieModle(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genderIds: List<int>.from((json['genre_ids']).map(((e) => e))),
        overview: json['overview'],
        voteAverge: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
