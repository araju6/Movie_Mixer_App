part of 'recommendations_bloc.dart';

abstract class RecommendationsState extends Equatable {
  final int currentTabIndex;

  const RecommendationsState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];

  get movies => [];
}

class RecommendationsInitial extends RecommendationsState {}

class RecommendationsChanged extends RecommendationsState {
  final List<MovieEntity> movies;

  const RecommendationsChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class RecommendationsLoadError extends RecommendationsState {
  final AppErrorType errorType;
  const RecommendationsLoadError({int currentTabIndex, @required this.errorType, })
      : super(currentTabIndex: currentTabIndex);
}