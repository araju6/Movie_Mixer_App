import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_mixer/domain/usecases/get_recommendations.dart';
import 'package:movie_mixer/domain/usecases/get_recommendations2.dart';
import 'package:movie_mixer/domain/usecases/get_recommendations3.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';

part 'recommendations_state.dart';
part 'recommendations_event.dart';

class RecommendationsBloc extends Bloc<RecommendationsEvent, RecommendationsState> {
  final GetRecommendations2 getRecommendations2;
  final GetRecommendations3 getRecommendations3;
  final GetRecommendations getRecommendations;

  RecommendationsBloc({
    @required this.getRecommendations2,
    @required this.getRecommendations3,
    @required this.getRecommendations,
  }) : super(RecommendationsInitial());

  @override
  Stream<RecommendationsState> mapEventToState(
      RecommendationsEvent event,
      ) async* {
    if (event is RecommendationsEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getRecommendations(NoParams());
          break;
        case 1:
          moviesEither = await getRecommendations2(NoParams());
          break;
        case 2:
          moviesEither = await getRecommendations3(NoParams());
          break;
      }
      yield moviesEither.fold(
            (l) => RecommendationsLoadError(currentTabIndex: event.currentTabIndex, errorType: l.appErrorType),
            (movies) {
          return RecommendationsChanged(
            currentTabIndex: event.currentTabIndex,
            movies: movies,
          );
        },
      );

    }
  }
}