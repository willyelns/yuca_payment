import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import './injection_container.dart' as injection_container;

import 'app.dart';

Future<void> main() async {
  await injection_container.init();
  _i18nInit();
  runApp(const App());
}

void _i18nInit() {
  initializeDateFormatting('pt_BR');
  Intl.defaultLocale = 'pt_BR';
}
