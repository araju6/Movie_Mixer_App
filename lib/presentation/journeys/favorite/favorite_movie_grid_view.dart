import 'package:flutter/material.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';

import 'favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridView({
    Key key,
    @required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return FavoriteMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}