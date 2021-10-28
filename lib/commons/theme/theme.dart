import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_scheme.dart';
part 'text_theme.dart';

final _defaultTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(
    _kDefaultTextTheme,
  ),
  colorScheme: kDefaultColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      textStyle: _kDefaultTextTheme.button,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      textStyle: _kDefaultTextTheme.button,
      primary: _kBaseBlack,
      backgroundColor: _kOnSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
        side: const BorderSide(color: _kBorder),
      ),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: _kBorder,
    space: 32.0,
  ),
);

ThemeData defaultAppTheme() => _defaultTheme;
