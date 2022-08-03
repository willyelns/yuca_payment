import 'package:flutter/material.dart';

import '../../../../routes/app_pages.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.title,
    this.isDetails = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 20),
            blurRadius: 20,
            spreadRadius: -24,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SafeArea(
        left: false,
        right: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            if (isDetails) const SizedBox(width: 64),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            if (isDetails) ...[
              IconButton(
                icon: const Icon(Icons.close),
                iconSize: 32,
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(width: 16),
            ]
          ],
        ),
      ),
    );
  }
}
