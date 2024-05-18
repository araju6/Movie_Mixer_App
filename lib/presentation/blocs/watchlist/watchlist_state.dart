part of 'watchlist_bloc.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];

  get movies => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistMoviesLoaded extends WatchlistState {
  final List<MovieEntity> movies;

  WatchlistMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class WatchlistMoviesError extends WatchlistState {}

class IsWatchlistMovie extends WatchlistState {
  final bool isMovieWatchlist;

  IsWatchlistMovie(this.isMovieWatchlist);

  @override
  List<Object> get props => [isMovieWatchlist];
}