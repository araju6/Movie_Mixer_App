import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/di/get_it.dart';
import 'package:movie_mixer/presentation/blocs/watchlist/watchlist_bloc.dart';
import 'package:movie_mixer/presentation/journeys/watchlist/watchlist_movie_grid_view.dart';


class WatchlistScreen extends StatefulWidget {
  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  WatchlistBloc _watchlistBloc;

  @override
  void initState() {
    super.initState();
    _watchlistBloc = getItInstance<WatchlistBloc>();
    _watchlistBloc.add(LoadWatchlistMovieEvent());
  }

  @override
  void dispose() {
    _watchlistBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Watchlist",
        ),
      ),
      body: BlocProvider.value(
        value: _watchlistBloc,
        child: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    "No Watchlist Movies",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
            }
            return WatchlistMovieGridView(
              movies: state.movies,
            );
          },
        ),
      ),
    );
  }
}