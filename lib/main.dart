import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:yuca_payment/commons/services/remote_config/firebase_remote_config.dart';

import './injection_container.dart' as injection_container;

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection_container.init();
  await _initFirebase();
  _i18nInit();
  runApp(const App());
}

void _i18nInit() {
  initializeDateFormatting('pt_BR');
  Intl.defaultLocale = 'pt_BR';
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();
  final remoteConfig =
      injection_container.serviceLocator.get<FirebaseRemoteConfigService>();
  await remoteConfig.init();
}
