import 'package:intl/intl.dart';

abstract class DateFormatter {
  /// returns a date from a string in the format of month / yyyy
  /// in portuguese
  /// ex: "janeiro / 2020"
  /// the [date] argument is a string in the format of dd/mm/yyyy
  String fullMonthNameAndYear(String date);

  /// returns a date from a string in the format of dd/mm
  /// ex: "01/01"
  /// the [date] argument is a string in the format of dd/mm/yyyy
  String shortDayAndMonth(String date);
}

class DateFormatterImpl implements DateFormatter {
  @override
  String fullMonthNameAndYear(String date) {
    final format = DateFormat('MMMM / yyyy');
    return _formatDate(date: date, format: format);
  }

  @override
  String shortDayAndMonth(String date) {
    final format = DateFormat('dd/MM');
    return _formatDate(date: date, format: format);
  }

  String _formatDate({required String date, required DateFormat format}) {
    final dateTime = _initInputDate(date);
    final formattedDate = format.format(dateTime);
    return formattedDate;
  }

  DateTime _initInputDate(String date) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final inputDate = inputFormat.parse(date);
    return inputDate;
  }
}
