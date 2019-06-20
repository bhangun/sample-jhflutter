import 'package:flutter/material.dart';



final ThemeData lightTheme = _buildTheme();

const kShrinePink50 = Color(0xFFFEEAE6);
const kShrinePink100 =  Color(0xFFFEDBD0);
const kShrinePink300 =  Color(0xFFFBB8AC);
const kShrinePink400 =  Color(0xFFEAA4A4);
const kShrineBrown900 =  Color(0xFF442B2D);
const kShrineErrorRed =  Color(0xFFC5032B);
const kShrineSurfaceWhite =  Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;

 const Map<int, Color> green = const <int, Color>{
    50: const Color(0xFFf2f8ef),
    100: const Color(0xFFdfedd8),
    200: const Color(0xFFc9e2be),
    300: const Color(0xFFb3d6a4),
    400: const Color(0xFFa3cd91),
    500: const Color(0xFF93c47d),
    600: const Color(0xFF8bbe75),
    700: const Color(0xFF80b66a),
    800: const Color(0xFF76af60),
    900: const Color(0xFF64a24d)
  };

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}