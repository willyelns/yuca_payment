part of 'theme.dart';

const _kDefaultTextTheme = TextTheme(
  headline1: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 24,
  ),
  headline2: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16,
  ),
  headline3: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  ),
  headline4: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  ),
  headline5: TextStyle(),
  subtitle1: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  ),
  subtitle2: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
  ),
  bodyText1: TextStyle(
    color: _kMediumBlack,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  ),
  bodyText2: TextStyle(
    color: _kBaseBlack,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  ),
  button: TextStyle(
    color: _kOnSurface,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  ),
);

const TextStyle _kLabel = TextStyle(
  color: _kBaseBlack,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

extension TextThemeExtension on TextTheme {
  TextStyle get label => _kLabel;
}
