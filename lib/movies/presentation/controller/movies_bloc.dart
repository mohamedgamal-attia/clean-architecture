import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';
import '../../domain/usecase/get_now_playing_movies_usecase.dart';
import '../../domain/usecase/get_popular_movies_usecase.dart';
import '../../domain/usecase/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters() );
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: ReqestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: ReqestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            popularState: ReqestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: ReqestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
          topRatedState: ReqestState.error,
          topRatedMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          topRatedMovies: r,
          topRatedState: ReqestState.loaded,
        ),));
  }
  }
