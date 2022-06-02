import 'package:flutter/material.dart';
import 'package:material_design_component/resource/app_colors.dart';

class CustomTheme {
  static final CustomTheme _theme = CustomTheme._internal();

  factory CustomTheme() {
    return _theme;
  }

  CustomTheme._internal();

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      toggleableActiveColor: shrinePink400,
      primaryColor: shrinePink100,
      primaryColorLight: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      errorColor: shrineErrorRed,
      buttonTheme: ButtonThemeData(
        colorScheme: _shrineColorScheme.copyWith(primary: shrinePink400),
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: shrineBrown900);
  }

//Set theme
  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
      caption: base.caption?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: defaultLetterSpacing,
      ),
      button: base.button?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: defaultLetterSpacing,
      ),
    )
        .apply(
      fontFamily: 'Rubik',
      displayColor: shrineBrown900,
      bodyColor: shrineBrown900,
    );
  }

//ColorScheme
  static const ColorScheme _shrineColorScheme = ColorScheme(
    primary: shrinePink100,
    secondary: shrinePink50,
    surface: shrineSurfaceWhite,
    background: shrineBackgroundWhite,
    error: shrineErrorRed,
    onPrimary: shrineBrown900,
    onSecondary: shrineBrown900,
    onSurface: shrineBrown900,
    onBackground: shrineBrown900,
    onError: shrineSurfaceWhite,
    brightness: Brightness.light,
  );

//Khai báo màu

  static const ColorScheme darkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: darkPurple200,
      onPrimary: Colors.black,
      secondary: darkTeal200,
      onSecondary: Colors.black,
      error: darkError,
      onError: Colors.black,
      background: darkBlack2c,
      onBackground: Colors.white,
      surface: darkBlack2c,
      onSurface: Colors.white
  );

  ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      colorScheme: darkScheme,
      toggleableActiveColor: darkPurple200,
      primaryColor: darkPurple200,
      primaryColorLight: darkPurple200,
      scaffoldBackgroundColor: Colors.black,
      cardColor: darkBlack2c,
      errorColor: darkError,
      buttonTheme: const ButtonThemeData(
        colorScheme: darkScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customDarkIconTheme(base.iconTheme),
      textTheme: _buildDarkTextTheme(base.textTheme),
      primaryTextTheme: _buildDarkTextTheme(base.primaryTextTheme),
      iconTheme: _customDarkIconTheme(base.iconTheme),
    );
  }

  TextTheme _buildDarkTextTheme(TextTheme base) {
    return base
        .copyWith(
      caption: base.caption?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: defaultLetterSpacing,
      ),
      button: base.button?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: defaultLetterSpacing,
      ),
    )
        .apply(
      fontFamily: 'Rubik',
      displayColor: Colors.white,
      bodyColor: Colors.white,
    );
  }

  IconThemeData _customDarkIconTheme(IconThemeData original) {
    return original.copyWith(color: Colors.white);
  }

}



