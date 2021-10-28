import 'package:flutter/material.dart';
import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentCardDetailsButton extends StatelessWidget {
  const PaymentCardDetailsButton({
    required this.onPressed,
    required this.primaryColor,
    this.title = 'Ver Detalhes',
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color primaryColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 1,
        backgroundColor: Colors.white,
        textStyle: context.button!.copyWith(
          color: primaryColor,
        ),
      ),
      child: Text(
        title.toUpperCase(),
        style: context.button!.copyWith(
          color: primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
