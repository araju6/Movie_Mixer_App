import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_mixer/data/data_sources/movie_history_local_data_source.dart';
import 'package:movie_mixer/data/data_sources/movie_local_data_source.dart';
import 'package:movie_mixer/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_mixer/data/data_sources/movie_watchlist_local_data_source.dart';
import 'package:movie_mixer/data/models/movie_detail_model.dart';
import 'package:movie_mixer/data/models/movie_model.dart';
import 'package:movie_mixer/data/tables/movie_history_table.dart';
import 'package:movie_mixer/data/tables/movie_table.dart';
import 'package:movie_mixer/data/tables/movie_watchlist_table.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;
  final MovieWatchlistLocalDataSource watchlistLocalDataSource;
  final MovieHistoryLocalDataSource historyLocalDataSource;


  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource, this.watchlistLocalDataSource, this.historyLocalDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchedMovies(String searchTerm) async{
    try {
      final movies = await remoteDataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId) async {
    try {
      final response = await localDataSource.checkIfMovieFavorite(movieId);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteMovie(int movieId) async{
    try {
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getMovies() async{
    try {
      final response = await localDataSource.getMovies();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async{
    try{
      final response = await localDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception{
      return Left(AppError(AppErrorType.database));
    }

  }
  @override
  Future<Either<AppError, bool>> checkIfMovieWatchlist(int movieId1) async {
    try {
      final response = await watchlistLocalDataSource.checkIfMovieWatchlist(movieId1);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteWatchlistMovie(int movieId1) async{
    try {
      final response = await watchlistLocalDataSource.deleteWatchlistMovie(movieId1);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getWatchlistMovies() async{
    try {
      final response = await watchlistLocalDataSource.getWatchlistMovies();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveWatchlistMovie(MovieEntity movieEntity) async{
    try{
      final response = await watchlistLocalDataSource.saveWatchlistMovie(MovieWatchlistTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception{
      return Left(AppError(AppErrorType.database));
    }

  }

  @override
  Future<Either<AppError, bool>> checkIfMovieHistory(int movieId2) async {
    try {
      final response = await historyLocalDataSource.checkIfMovieHistory(movieId2);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteHistoryMovie(int movieId2) async{
    try {
      final response = await historyLocalDataSource.deleteHistoryMovie(movieId2);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getHistoryMovies() async{
    try {
      final response = await historyLocalDataSource.getHistoryMovies();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveHistoryMovie(MovieEntity movieEntity) async{
    try{
      final response = await historyLocalDataSource.saveHistoryMovie(MovieHistoryTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception{
      return Left(AppError(AppErrorType.database));
    }

  }

  @override
  Future<Either<AppError, List<MovieModel>>> getRecommendations() async {
    try {
      final movies = await remoteDataSource.getRecommendations();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
  @override
  Future<Either<AppError, List<MovieModel>>> getRecommendations2() async {
    try {
      final movies = await remoteDataSource.getRecommendations2();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
  @override
  Future<Either<AppError, List<MovieModel>>> getRecommendations3() async {
    try {
      final movies = await remoteDataSource.getRecommendations3();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  
}