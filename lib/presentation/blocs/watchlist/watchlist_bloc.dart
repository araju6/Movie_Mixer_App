import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/entities/movie_params.dart';
import 'package:movie_mixer/domain/entities/no_params.dart';
import 'package:movie_mixer/domain/usecases/check_if_movie_watchlist.dart';
import 'package:movie_mixer/domain/usecases/delete_watchlist_movie.dart';
import 'package:movie_mixer/domain/usecases/get_watchlist.dart';
import 'package:movie_mixer/domain/usecases/save_watchlist_movie.dart';


part 'watchlist_state.dart';
part 'watchlist_event.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final SaveWatchlistMovie saveWatchlistMovie;
  final GetWatchlistMovies getWatchlistMovies;
  final DeleteWatchlistMovie deleteWatchlistMovie;
  final CheckIfWatchlistMovie checkIfWatchlistMovie;

  WatchlistBloc({
    @required this.getWatchlistMovies,
    @required this.saveWatchlistMovie,
    @required this.deleteWatchlistMovie,
    @required this.checkIfWatchlistMovie,
  }) : super(WatchlistInitial());

  @override
  Stream<WatchlistState> mapEventToState(
      WatchlistEvent event,
      ) async* {
    if (event is ToggleWatchlistMovieEvent) {
      if (event.isWatchlist) {
        await deleteWatchlistMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveWatchlistMovie(event.movieEntity);
      }
      final response =
      await checkIfWatchlistMovie(MovieParams(event.movieEntity.id));
      yield response.fold(
            (l) => WatchlistMoviesError(),
            (r) => IsWatchlistMovie(r),
      );
    } else if (event is LoadWatchlistMovieEvent) {
      yield* _fetchLoadWatchlistMovies();
    } else if (event is DeleteWatchlistMovieEvent) {
      await deleteWatchlistMovie(MovieParams(event.movieId1));
      yield* _fetchLoadWatchlistMovies();
    } else if (event is CheckIfWatchlistMovieEvent) {
      final response = await checkIfWatchlistMovie(MovieParams(event.movieId));
      yield response.fold(
            (l) => WatchlistMoviesError(),
            (r) => IsWatchlistMovie(r),
      );
    }
  }

  Stream<WatchlistState> _fetchLoadWatchlistMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
    await getWatchlistMovies(NoParams());

    yield response.fold(
          (l) => WatchlistMoviesError(),
          (r) => WatchlistMoviesLoaded(r),
    );
  }
}