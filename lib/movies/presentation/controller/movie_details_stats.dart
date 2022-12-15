import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

import '../../domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = ReqestState.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationState = ReqestState.loading,
    this.recommendationMessage = '',
  });

  final MovieDetail? movieDetail;
  final ReqestState movieDetailsState;
  final String movieDetailsMessage;

  final List<Recommendation> recommendation;
  final ReqestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    ReqestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    ReqestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
