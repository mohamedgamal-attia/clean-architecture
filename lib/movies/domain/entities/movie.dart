import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderIds;
  final String overview;
  final double voteAverge;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genderIds,
    required this.overview,
    required this.voteAverge,
    required this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    genderIds,
    overview,
    voteAverge,
    releaseDate,
  ];


}
