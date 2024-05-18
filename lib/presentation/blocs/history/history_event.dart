part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class LoadHistoryMovieEvent extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class DeleteHistoryMovieEvent extends HistoryEvent {
  final int movieId2;

  DeleteHistoryMovieEvent(this.movieId2);

  @override
  List<Object> get props => [movieId2];
}


class ToggleHistoryMovieEvent extends HistoryEvent {
  final MovieEntity movieEntity;
  final bool isHistory;

  ToggleHistoryMovieEvent(this.movieEntity, this.isHistory);

  @override
  List<Object> get props => [movieEntity, isHistory];
}

class CheckIfHistoryMovieEvent extends HistoryEvent {
  final int movieId2;

  CheckIfHistoryMovieEvent(this.movieId2);

  @override
  List<Object> get props => [movieId2];
}