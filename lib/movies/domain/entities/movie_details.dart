import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;

  const MovieDetail({
    required this.genres,
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.runtime,
  });

  @override
  List<Object> get props => [
    genres,
    backdropPath,
    id,
    overview,
    releaseDate,
    runtime,
    title,
    voteAverage,
  ];
}
