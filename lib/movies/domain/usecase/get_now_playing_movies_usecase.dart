import 'package:movies_app/core/error/failue.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters)async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}