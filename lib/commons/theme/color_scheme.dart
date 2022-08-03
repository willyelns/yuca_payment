part of 'theme.dart';

const Color _kBaseBlack = Color(0xFF000000);
const Color _kMediumBlack = Color(0xFF4F4F4F);
const Color _kSurface = Color(0xFFFFFFFF);
const Color _kOnSurface = Color(0xFF242424);
const Color _kBackground = Color(0xFFE5E5E5);
const Color _kOnBackground = Color(0xFFE5E5E5);
const Color _kOnError = Color(0xFFFFFFFF);
const Color _kOnPaid = Color(0xFF13C081);
const Color _kOnClosed = Color(0xFF7864C8);
const Color _kOnOpen = Color(0xFF20B1DF);
const Color _kBorder = Color(0xFFF2F2F2);

const kDefaultColorScheme = ColorScheme(
  primary: _kBaseBlack,
  primaryContainer: _kMediumBlack,
  secondary: _kBaseBlack,
  secondaryContainer: _kMediumBlack,
  surface: _kSurface,
  background: _kBackground,
  error: _kOnClosed,
  onPrimary: _kSurface,
  onSecondary: _kSurface,
  onSurface: _kOnSurface,
  onBackground: _kOnBackground,
  onError: _kOnError,
  brightness: Brightness.light,
);

extension ColorSchemeExtension on ColorScheme {
  Color get baseBlack => _kBaseBlack;
  Color get mediumBlack => _kMediumBlack;
  Color get paid => _kOnPaid;
  Color get closed => _kOnClosed;
  Color get open => _kOnOpen;
  Color get border => _kBorder;
}
