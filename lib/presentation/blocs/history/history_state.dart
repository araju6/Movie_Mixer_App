part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];

  get movies => [];



}

class HistoryInitial extends HistoryState {}

class HistoryMoviesLoaded extends HistoryState {
  final List<MovieEntity> movies;

  HistoryMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class HistoryMoviesError extends HistoryState {}

class IsHistoryMovie extends HistoryState {
  final bool isMovieHistory;

  IsHistoryMovie(this.isMovieHistory);

  @override
  List<Object> get props => [isMovieHistory];
}