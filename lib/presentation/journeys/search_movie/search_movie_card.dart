import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_mixer/data/core/api_constants.dart';
import 'package:movie_mixer/presentation/themes/theme_text.dart';
import 'package:movie_mixer/domain/entities/movie_entity.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_screen.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                MovieDetailScreen(
                  movieDetailArguments: MovieDetailArguments(movie.id),
                ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 2,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                  width: MediaQuery.of(context).size.height/8,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}