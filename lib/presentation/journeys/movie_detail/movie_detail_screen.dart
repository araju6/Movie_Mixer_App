import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/di/get_it.dart';
import 'package:movie_mixer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_mixer/presentation/blocs/history/history_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_mixer/presentation/blocs/watchlist/watchlist_bloc.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
final MovieDetailArguments movieDetailArguments;

const MovieDetailScreen({
Key key,
@required this.movieDetailArguments,
})  : assert(movieDetailArguments != null, 'arguments must not be null'),
super(key: key);

@override
_MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;
  FavoriteBloc _favoriteBloc;
  WatchlistBloc _watchlistBloc;
  HistoryBloc _historyBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _favoriteBloc = _movieDetailBloc.favoriteBloc;
    _watchlistBloc = _movieDetailBloc.watchlistBloc;
    _historyBloc = _movieDetailBloc.historyBloc;

    _movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _favoriteBloc?.close();
    _watchlistBloc?.close();
    _historyBloc?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _favoriteBloc),
          BlocProvider.value(value: _watchlistBloc),
          BlocProvider.value(value: _historyBloc),

        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}