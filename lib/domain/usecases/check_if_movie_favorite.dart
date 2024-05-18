import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_params.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/usecase.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavorite(movieParams.id);

  }
}