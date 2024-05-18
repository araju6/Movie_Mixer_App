import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/di/get_it.dart';
import 'package:movie_mixer/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_mixer/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_mixer/presentation/blocs/recommendations/recommendations_bloc.dart';
import 'package:movie_mixer/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_mixer/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movie_mixer/presentation/journeys/recommendations/movie_recommendations_widget.dart';
import 'package:movie_mixer/presentation/widgets/separator.dart';


class RecommendationsScreen extends StatefulWidget {
  @override
  _RecommendationsScreenState createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  RecommendationsBloc recommendationsBloc;
  SearchMovieBloc searchMovieBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    recommendationsBloc = getItInstance<RecommendationsBloc>();
    searchMovieBloc = getItInstance<SearchMovieBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    recommendationsBloc?.close();
    searchMovieBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselBloc,),
        BlocProvider(create: (context) => movieBackdropBloc,),
        BlocProvider(create: (context) => recommendationsBloc,),
        BlocProvider(create: (context) => searchMovieBloc,),

      ],
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Recommendations'),
        ),
        drawer: NavigationDrawer(),
        body: Column(
          children: [
            Text("Based off your", style: TextStyle(fontSize: 20),),
            Margin(),
            Expanded(child: MovieRecommendationsWidget()),
          ],
        )
      ),
    );
  }
}