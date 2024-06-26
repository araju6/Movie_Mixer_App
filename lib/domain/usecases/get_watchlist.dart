import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/entities/no_params.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/usecase.dart';

class GetWatchlistMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetWatchlistMovies(this.movieRepository);


  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getWatchlistMovies();
  }
}