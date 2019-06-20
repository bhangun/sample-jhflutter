import 'dart:ui';

import 'package:flutter/material.dart';

class MatThemeColors {
  MatThemeColors._(); // this basically makes it so you can instantiate this class
  static const _greyPrimaryValue = 0xFF93c47d;
  static const _amberPrimaryValue = 0xFFFFC107;
  static const _indigoPrimaryValue = 0xFF3F51B5;
  static const _bluePrimaryValue = 0xFF2196F3;
  static const _deepPurplePrimaryValue = 0xFF673AB7;


  static const Map<int, Color> green = const <int, Color>{
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

  static const MaterialColor grey = MaterialColor( _greyPrimaryValue,
  <int, Color>{
     50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    350: Color(0xFFD6D6D6), // only for raised button while pressed in light theme
    400: Color(0xFFBDBDBD),
    500: Color(_greyPrimaryValue),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    850: Color(0xFF303030), // only for background color in dark theme
    900: Color(0xFF212121),
  });

static const MaterialColor amber = MaterialColor(_amberPrimaryValue,
  <int, Color>{
     50: Color(0xFFFFF8E1),
    100: Color(0xFFFFECB3),
    200: Color(0xFFFFE082),
    300: Color(0xFFFFD54F),
    400: Color(0xFFFFCA28),
    500: Color(_amberPrimaryValue),
    600: Color(0xFFFFB300),
    700: Color(0xFFFFA000),
    800: Color(0xFFFF8F00),
    900: Color(0xFFFF6F00),
  });

  static const MaterialColor blue = MaterialColor(_bluePrimaryValue,
  <int, Color>{
     50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  }
);

static const MaterialColor indigo = MaterialColor(_indigoPrimaryValue,
<int, Color>{
     50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(_indigoPrimaryValue),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  });

  static const MaterialColor deepPurple = MaterialColor(_deepPurplePrimaryValue,
  <int, Color>{
     50: Color(0xFFEDE7F6),
    100: Color(0xFFD1C4E9),
    200: Color(0xFFB39DDB),
    300: Color(0xFF9575CD),
    400: Color(0xFF7E57C2),
    500: Color(_deepPurplePrimaryValue),
    600: Color(0xFF5E35B1),
    700: Color(0xFF512DA8),
    800: Color(0xFF4527A0),
    900: Color(0xFF311B92),
  });
}