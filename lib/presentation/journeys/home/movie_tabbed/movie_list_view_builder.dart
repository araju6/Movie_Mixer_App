
import 'package:flutter/material.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';

import 'movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  //1
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key key, @required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14,
          );
        },
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
            movieId: movie.id,
            title: movie.title,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }
}