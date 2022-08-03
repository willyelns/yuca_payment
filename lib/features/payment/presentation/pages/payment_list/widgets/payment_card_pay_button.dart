import 'package:flutter/material.dart';

import '../../../../../../commons/extensions/theme/theme_context.dart';

class PaymentCardPayButton extends StatelessWidget {
  const PaymentCardPayButton({
    required this.onPressed,
    required this.primaryColor,
    this.title = 'Pagar',
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color primaryColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        textStyle: context.button!.copyWith(
          color: context.surfaceColor,
        ),
      ),
      child: Text(
        title.toUpperCase(),
      ),
    );
  }
}
