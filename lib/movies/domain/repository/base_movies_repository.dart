import 'package:movies_app/core/error/failue.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';

import '../entities/recommendation.dart';

abstract class BaseMoviesRepository{

  Future<Either<Failure, List<Movie>>>  getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getpopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}