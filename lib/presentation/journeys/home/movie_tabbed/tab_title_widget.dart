import 'package:flutter/material.dart';
import 'package:movie_mixer/presentation/themes/theme_text.dart';
import 'package:movie_mixer/presentation/themes/theme_color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key key,
    @required this.title,
    @required this.onTap,
    this.isSelected = false,
  })  : assert(title != null, 'title should not be null'),
        assert(onTap != null, 'onTap should not be null'),
        assert(isSelected != null, 'isSelected should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}