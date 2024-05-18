import 'package:dartz/dartz.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_detail_entity.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';



abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(String searchTerm);
  Future<Either<AppError, List<MovieEntity>>> getRecommendations();
  Future<Either<AppError, List<MovieEntity>>> getRecommendations2();
  Future<Either<AppError, List<MovieEntity>>> getRecommendations3();


  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getMovies();
  Future<Either<AppError, void>> deleteMovie(int movieId);
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);

  Future<Either<AppError, void>> saveWatchlistMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getWatchlistMovies();
  Future<Either<AppError, void>> deleteWatchlistMovie(int movieId);
  Future<Either<AppError, bool>> checkIfMovieWatchlist(int movieId);

  Future<Either<AppError, void>> saveHistoryMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getHistoryMovies();
  Future<Either<AppError, void>> deleteHistoryMovie(int movieId);
  Future<Either<AppError, bool>> checkIfMovieHistory(int movieId);


}