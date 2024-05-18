import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mixer/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_mixer/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:movie_mixer/presentation/themes/theme_color.dart';
import 'package:movie_mixer/presentation/themes/theme_text.dart';
import 'package:movie_mixer/presentation/widgets/movie_carousel_load_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate{
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      )
    );
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: (){
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: MediaQuery.of(context).size.width/8
        ,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(query),
    );
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state){
        if (state is SearchMovieError){
          return AppErrorWidget(errorType: state.errorType, onPressed: () =>
          searchMovieBloc?.add(SearchTermChangedEvent(query)),
          );
        } else if (state is SearchMovieLoaded){
          final movies = state.movies;

          if (movies.isEmpty){
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal : 80),
                child: Text(
                  "No Movies Found Please Search For Another Word"
                ),
              )
            );
          }
          return ListView.builder(
              itemBuilder: (context, index) => SearchMovieCard(
                  movie: movies[index],

              ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );

        } else{
          return Container();
        }
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();

  }



}