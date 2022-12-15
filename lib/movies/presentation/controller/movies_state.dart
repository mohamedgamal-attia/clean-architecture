import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final ReqestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final ReqestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final ReqestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = ReqestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = ReqestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = ReqestState.loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    ReqestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    ReqestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    ReqestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage
         );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
