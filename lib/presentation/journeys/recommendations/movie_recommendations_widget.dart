import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/presentation/blocs/recommendations/recommendations_bloc.dart';
import 'package:movie_mixer/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:movie_mixer/presentation/journeys/recommendations/movie_recommendations_constants.dart';
import 'package:movie_mixer/presentation/widgets/movie_carousel_load_error_widget.dart';

import 'movie_list_view_builder.dart';

class MovieRecommendationsWidget extends StatefulWidget {
  @override
  _MovieRecommendationsWidgetState createState() => _MovieRecommendationsWidgetState();
}

class _MovieRecommendationsWidgetState extends State<MovieRecommendationsWidget>
    with SingleTickerProviderStateMixin {
  RecommendationsBloc get movieTabbedBloc =>
      BlocProvider.of<RecommendationsBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(RecommendationsChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsBloc, RecommendationsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 4),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i = 0;
                      i < MovieRecommendationsConstants.movieTabs.length;
                      i++)
                        TabTitleWidget(
                          title: MovieRecommendationsConstants.movieTabs[i].title,
                          onTap: () => _onTabTapped(i),
                          isSelected: MovieRecommendationsConstants.movieTabs[i].index ==
                              state.currentTabIndex,
                        )
                    ],
                  ),
                  if (state is RecommendationsChanged)
                    state.movies?.isEmpty ?? true ?
                        Expanded(child: Center(
                          child: Text("Sorry no movies available"),
                        )):
                    Expanded(
                      child: MovieListViewBuilder(movies: state.movies),
                    ),
                  if (state is RecommendationsLoadError)
                    Expanded(
                      child: AppErrorWidget(errorType: state.errorType, onPressed: () => movieTabbedBloc.add(RecommendationsChangedEvent(
                        currentTabIndex: state.currentTabIndex,

                      ))),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(RecommendationsChangedEvent(currentTabIndex: index));
  }
}