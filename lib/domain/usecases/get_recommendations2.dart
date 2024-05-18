import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/entities/no_params.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/usecase.dart';

class GetRecommendations2 extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository repository;

  GetRecommendations2(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async{
    return await repository.getRecommendations2();
  }
}