import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_mixer/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:movie_mixer/presentation/widgets/movie_carousel_load_error_widget.dart';

import 'movie_list_view_builder.dart';
import 'movie_tabbed_constants.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 4),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                  i < MovieTabbedConstants.movieTabs.length;
                  i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                state.movies?.isEmpty ?? true ?
                    Expanded(child: Center(
                      child: Text("Sorry no movies available"),
                    )):
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(errorType: state.errorType, onPressed: () => movieTabbedBloc.add(MovieTabChangedEvent(
                    currentTabIndex: state.currentTabIndex,

                  ))),
                )
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}