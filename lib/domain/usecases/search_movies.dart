import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/entities/movie_search_params.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';
import 'package:movie_mixer/domain/usecases/usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams>{
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieSearchParams searchParams) async{
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}