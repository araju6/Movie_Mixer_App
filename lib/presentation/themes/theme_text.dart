import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_mixer/presentation/themes/theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6.copyWith(
    fontSize: 20,
    color: Colors.white,
  );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1.copyWith(
    fontSize: 16,
    color: Colors.white,
  );
  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2.copyWith(
    color: Colors.white,
    fontSize: 16,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5,
  );
  static getTextTheme() => TextTheme(
    headline6: _whiteHeadline6,
    subtitle1: whiteSubtitle1,
    bodyText2: whiteBodyText2,
  );
}
extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
    color: AppColor.royalBlue,
    fontWeight: FontWeight.w600,
  );


  TextStyle get greySubtitle1 => subtitle1.copyWith(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  );


  TextStyle get violetHeadline6 => headline6.copyWith(
    color: AppColor.violet,
    fontWeight: FontWeight.w600,
  );

  TextStyle get greyCaption => caption.copyWith(
    color: Colors.grey,
  );


}
