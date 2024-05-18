part of 'watchlist_bloc.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();
}

class LoadWatchlistMovieEvent extends WatchlistEvent {
  @override
  List<Object> get props => [];
}

class DeleteWatchlistMovieEvent extends WatchlistEvent {
  final int movieId1;

  DeleteWatchlistMovieEvent(this.movieId1);

  @override
  List<Object> get props => [movieId1];
}

class ToggleWatchlistMovieEvent extends WatchlistEvent {
  final MovieEntity movieEntity;
  final bool isWatchlist;

  ToggleWatchlistMovieEvent(this.movieEntity, this.isWatchlist);

  @override
  List<Object> get props => [movieEntity, isWatchlist];
}

class CheckIfWatchlistMovieEvent extends WatchlistEvent {
  final int movieId;

  CheckIfWatchlistMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}