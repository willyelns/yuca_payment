import 'package:flutter/material.dart';

import '../../../../commons/extensions/theme/theme_context.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.borderColor,
      height: 0,
      thickness: 1,
    );
  }
}
