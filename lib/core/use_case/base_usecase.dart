import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failue.dart';
import 'package:dartz/dartz.dart';


abstract class BaseUseCase<T,Parameters>{
  Future<Either<Failure , T>> call(Parameters parameters);
}

class NoParameters extends Equatable{
  const NoParameters();

  @override
  List<Object?> get props => [];
}