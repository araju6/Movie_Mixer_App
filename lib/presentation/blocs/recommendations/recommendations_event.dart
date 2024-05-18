part of 'recommendations_bloc.dart';

abstract class RecommendationsEvent extends Equatable {
  const RecommendationsEvent();

  @override
  List<Object> get props => [];

  get currentTabIndex => null;
}

class RecommendationsChangedEvent extends RecommendationsEvent {
  final int currentTabIndex;

  const RecommendationsChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}