import 'package:flutter/material.dart';
import 'package:movie_mixer/presentation/themes/theme_color.dart';

class Margin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.height/8
    ,
      padding: EdgeInsets.only(
        top: 2,
        bottom: 6,
      ),
      color: Colors.white,

    );
  }
}