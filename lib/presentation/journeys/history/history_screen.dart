import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/di/get_it.dart';
import 'package:movie_mixer/presentation/blocs/history/history_bloc.dart';

import 'history_movie_grid_view.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryBloc _historyBloc;

  @override
  void initState() {
    super.initState();
    _historyBloc = getItInstance<HistoryBloc>();
    _historyBloc.add(LoadHistoryMovieEvent());
  }

  @override
  void dispose() {
    _historyBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
        ),
      ),
      body: BlocProvider.value(
        value: _historyBloc,
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is HistoryMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    "No History Movies",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
            }
            return HistoryMovieGridView(
              movies: state.movies,
            );

          },
        ),
      ),
    );
  }
}