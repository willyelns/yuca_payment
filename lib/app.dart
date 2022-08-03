import 'package:flutter/material.dart';

import 'commons/theme/theme.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment list app',
      theme: defaultAppTheme(),
      routes: routes,
    );
  }
}
