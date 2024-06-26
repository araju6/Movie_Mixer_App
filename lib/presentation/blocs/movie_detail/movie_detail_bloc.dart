import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';
import 'package:movie_mixer/domain/entities/movie_detail_entity.dart';
import 'package:movie_mixer/domain/entities/movie_params.dart';
import 'package:movie_mixer/domain/usecases/get_movie_detail.dart';
import 'package:movie_mixer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_mixer/presentation/blocs/history/history_bloc.dart';
import 'package:movie_mixer/presentation/blocs/watchlist/watchlist_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final FavoriteBloc favoriteBloc;
  final WatchlistBloc watchlistBloc;
  final HistoryBloc historyBloc;

  MovieDetailBloc({
    @required this.getMovieDetail,
    @required this.favoriteBloc,
    @required this.watchlistBloc,
    @required this.historyBloc,

  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
      MovieDetailEvent event,
      ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
      await getMovieDetail(
        MovieParams(event.movieId),
      );

      yield eitherResponse.fold(
            (l) => MovieDetailError(),
            (r) => MovieDetailLoaded(r),
      );
      favoriteBloc.add(CheckIfFavoriteMovieEvent(event.movieId));
      watchlistBloc.add(CheckIfWatchlistMovieEvent(event.movieId));
      historyBloc.add(CheckIfHistoryMovieEvent(event.movieId));


    }
  }
}