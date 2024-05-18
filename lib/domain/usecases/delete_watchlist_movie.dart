import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_params.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/usecase.dart';

class DeleteWatchlistMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteWatchlistMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteWatchlistMovie(movieParams.id);
  }
}