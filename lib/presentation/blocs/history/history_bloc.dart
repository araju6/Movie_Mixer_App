import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/domain/entities/movie_params.dart';
import 'package:movie_mixer/domain/entities/no_params.dart';
import 'package:movie_mixer/domain/usecases/check_if_movie_history.dart';
import 'package:movie_mixer/domain/usecases/delete_history_movie.dart';
import 'package:movie_mixer/domain/usecases/get_history.dart';
import 'package:movie_mixer/domain/usecases/save_history_movie.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final SaveHistoryMovie saveHistoryMovie;
  final GetHistoryMovies getHistoryMovies;
  final DeleteHistoryMovie deleteHistoryMovie;
  final CheckIfHistoryMovie checkIfHistoryMovie;


  HistoryBloc({
    @required this.saveHistoryMovie,
    @required this.getHistoryMovies,
    @required this.deleteHistoryMovie,
    @required this.checkIfHistoryMovie,
  }) : super(HistoryInitial());

  @override
  Stream<HistoryState> mapEventToState(
      HistoryEvent event,
      ) async* {
    if (event is ToggleHistoryMovieEvent) {
      if (event.isHistory) {
        await deleteHistoryMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveHistoryMovie(event.movieEntity);
      }
      final response =
      await checkIfHistoryMovie(MovieParams(event.movieEntity.id));
      yield response.fold(
            (l) => HistoryMoviesError(),
            (r) => IsHistoryMovie(r),
      );
    } else if (event is LoadHistoryMovieEvent) {
      yield* _fetchLoadHistoryMovies();
    } else if (event is DeleteHistoryMovieEvent) {
      await deleteHistoryMovie(MovieParams(event.movieId2));
      yield* _fetchLoadHistoryMovies();

    } else if (event is CheckIfHistoryMovieEvent) {
      final response = await checkIfHistoryMovie(MovieParams(event.movieId2));
      yield response.fold(
            (l) => HistoryMoviesError(),
            (r) => IsHistoryMovie(r),
      );
    }
  }

  Stream<HistoryState> _fetchLoadHistoryMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
    await getHistoryMovies(NoParams());

    yield response.fold(
          (l) => HistoryMoviesError(),
          (r) => HistoryMoviesLoaded(r),
    );
  }
}