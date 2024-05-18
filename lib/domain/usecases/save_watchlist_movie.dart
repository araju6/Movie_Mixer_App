import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/usecase.dart';

class SaveWatchlistMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveWatchlistMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepository.saveWatchlistMovie(params);
  }
}