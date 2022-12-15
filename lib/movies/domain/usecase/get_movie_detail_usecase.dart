import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failue.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters>{
 final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);



  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable{
final int movieId;
 MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];


}