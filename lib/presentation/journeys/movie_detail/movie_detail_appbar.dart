import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/domain/entities/movie_detail_entity.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie_mixer/presentation/blocs/history/history_bloc.dart';
import 'package:movie_mixer/presentation/blocs/watchlist/watchlist_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({Key key, this.movieDetailEntity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: MediaQuery.of(context).size.width/8,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () { BlocProvider.of<FavoriteBloc>(context).add(
                    ToggleFavoriteMovieEvent(MovieEntity.fromMovieDetailEntity(movieDetailEntity), state.isMovieFavorite));
                if(state.isMovieFavorite == false) {
                  BlocProvider.of<HistoryBloc>(context).add(
                      ToggleHistoryMovieEvent(
                          MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                          state.isMovieFavorite));
                }
    },
                child: Icon(
                  state.isMovieFavorite ? Icons.favorite: Icons.favorite_border,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width/8,
                ),
              );
            }
              else{
              return Icon(
                Icons.favorite,
                color: Colors.white,
                size:MediaQuery.of(context).size.width/8,
              );

            }
            }

          ),
        BlocBuilder<WatchlistBloc, WatchlistState>(
            builder: (context, state) {
              if (state is IsWatchlistMovie) {
                return GestureDetector(
                  onTap: () => BlocProvider.of<WatchlistBloc>(context).add(
                      ToggleWatchlistMovieEvent(MovieEntity.fromMovieDetailEntity(movieDetailEntity), state.isMovieWatchlist)),

                  child: Icon(
                    state.isMovieWatchlist ? Icons.view_list: Icons.list,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width/8,
                  ),
                );
              }
              else{
                return Icon(
                  Icons.list,
                  color: Colors.white,
                  size:MediaQuery.of(context).size.width/8,
                );

              }
            }

        ),
        BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is IsHistoryMovie) {
                return GestureDetector(
                  onTap: () => BlocProvider.of<HistoryBloc>(context).add(
                      ToggleHistoryMovieEvent(MovieEntity.fromMovieDetailEntity(movieDetailEntity), state.isMovieHistory)),
                  child: Icon(
                    state.isMovieHistory ? Icons.history: Icons.history_toggle_off,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width/8,
                  ),
                );
              }
              else{
                return Icon(
                  Icons.history_toggle_off,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width/8,
                );

              }
            }

        )
      ],
    );
  }
}