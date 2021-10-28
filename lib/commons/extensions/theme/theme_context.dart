import 'package:flutter/material.dart';

import '../../theme/theme.dart';

extension ContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;
  Color get baseBlackColor => colorScheme.baseBlack;
  Color get primaryColor => colorScheme.primary;
  Color get primaryVariantColor => colorScheme.primaryVariant;
  Color get secondaryColor => colorScheme.secondary;
  Color get secondaryVariantColor => colorScheme.secondaryVariant;
  Color get surfaceColor => colorScheme.surface;
  Color get backgroundColor => colorScheme.background;
  Color get errorColor => colorScheme.error;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onErrorColor => colorScheme.onError;
  Color get paidColor => colorScheme.paid;
  Color get closedColor => colorScheme.closed;
  Color get openColor => colorScheme.open;
  Color get borderColor => colorScheme.border;

  TextTheme get textTheme => theme.textTheme;
  TextStyle? get headline1 => textTheme.headline1;
  TextStyle? get headline2 => textTheme.headline2;
  TextStyle? get headline3 => textTheme.headline3;
  TextStyle? get headline4 => textTheme.headline4;
  TextStyle? get headline5 => textTheme.headline5;
  TextStyle? get subtitle1 => textTheme.subtitle1;
  TextStyle? get subtitle2 => textTheme.subtitle2;
  TextStyle? get label => textTheme.label;
  TextStyle? get bodyText1 => textTheme.bodyText1;
  TextStyle? get bodyText2 => textTheme.bodyText2;
  TextStyle? get button => textTheme.button;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
