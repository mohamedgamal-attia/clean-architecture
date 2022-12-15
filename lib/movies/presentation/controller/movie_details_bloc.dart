import 'dart:async';

import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase,this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailUseCase(MovieDetailsParameters(
      movieId: event.id,
    ));

    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: ReqestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailsState: ReqestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(
    GetMovieRecommendationEvent event,
    Emitter<MovieDetailsState> emit,
  )async {
    final result = await getRecommendationUseCase(
        RecommendationParameters(
       event.id,
    ));

    result.fold(
            (l) => emit(state.copyWith(
          recommendationState: ReqestState.error,
              recommendationMessage: l.message,
        )),
            (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: ReqestState.loaded,
        )));
  }
}
