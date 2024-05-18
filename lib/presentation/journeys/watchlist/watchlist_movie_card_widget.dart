import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/data/core/api_constants.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/presentation/blocs/watchlist/watchlist_bloc.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_screen.dart';

class WatchlistMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;


  const WatchlistMovieCardWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movie.id),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: MediaQuery. of(context). size. width/2.2,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<WatchlistBloc>(context)
                      .add(DeleteWatchlistMovieEvent(movie.id)),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.delete,
                      size: MediaQuery. of(context). size. height/25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}