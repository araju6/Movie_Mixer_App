import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_mixer/common/screenutil/screenutil.dart';
import 'package:movie_mixer/presentation/themes/theme_text.dart';
import 'package:movie_mixer/data/core/api_constants.dart';
import 'package:movie_mixer/domain/entities/movie_detail_entity.dart';
import 'movie_detail_appbar.dart';
import 'package:movie_mixer/common/extensions/num_extensions.dart';
class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight/1.2,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline6,

            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentageString(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          left: 12,
          right: 12,
          top: ScreenUtil.statusBarHeight + 2,
          child: MovieDetailAppBar(
            movieDetailEntity: movie,
          ),
        ),
      ],
    );
  }
}