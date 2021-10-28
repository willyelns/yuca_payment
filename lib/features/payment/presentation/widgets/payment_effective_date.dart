import 'package:flutter/material.dart';

import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentEffectiveDate extends StatelessWidget {
  const PaymentEffectiveDate({required this.date, Key? key}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: context.headline2,
      textAlign: TextAlign.center,
    );
  }
}
