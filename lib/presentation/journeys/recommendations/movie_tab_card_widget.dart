import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_mixer/data/core/api_constants.dart';
import 'package:movie_mixer/common/extensions/string_extensions.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_mixer/presentation/journeys/movie_detail/movie_detail_screen.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget({
    Key key,
    @required this.movieId,
    @required this.title,
    @required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieId),
            ),
          ),
        );
      },
      child: SingleChildScrollView(
        child: SizedBox(
          height:  MediaQuery. of(context). size. height/1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                child: Text(
                  title.textTrim(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}