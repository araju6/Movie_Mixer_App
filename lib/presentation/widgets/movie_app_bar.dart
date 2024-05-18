import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_mixer/common/screenutil/screenutil.dart';
import 'package:movie_mixer/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_mixer/presentation/journeys/search_movie/custom_search_movie_delegate.dart';

class MovieAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(
      top: ScreenUtil.statusBarHeight + 4,
      left: 16,
      right: 16,

    ),
      child: Row(
        children: <Widget>[
          IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: SvgPicture.asset('assets/svgs/menu.svg',
          height: MediaQuery. of(context). size. height/25,
          ),
          ),
          Expanded(
            child: Center(child: Text("Home", style: Theme.of(context).textTheme.title,))
          ),
          IconButton(onPressed: (){
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(
                BlocProvider.of<SearchMovieBloc>(context),
              ),
            );
          }, icon: Icon(
            Icons.search,
            color: Colors.white,
            size: MediaQuery. of(context). size. height/25,
          ),
          )
        ],
      ),
    );
  }
}