import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  /// returns a formatted string for the given [value]
  /// [value] is expected to be a integer value
  String parseIntToReal(int value);
}

class CurrencyFormatterImpl extends CurrencyFormatter {
  @override
  String parseIntToReal(int value) {
    final numberFormat = NumberFormat.currency(
      symbol: 'R\$',
    );
    return numberFormat.format(value);
  }
}
