import 'package:flutter/material.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';

import 'history_movie_card_widget.dart';



class HistoryMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const HistoryMovieGridView({
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
          return HistoryMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}