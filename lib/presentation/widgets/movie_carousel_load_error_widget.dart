import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_mixer/domain/entities/app_error.dart';

class AppErrorWidget extends StatelessWidget{
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget({
    Key key,
    @required this.errorType,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Please check your network connection and try again.",
        textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1,),
        RaisedButton(onPressed: onPressed,
        child: Text("Retry"),
        textColor: Colors.black,
        ),
      ],

    );
  }
}