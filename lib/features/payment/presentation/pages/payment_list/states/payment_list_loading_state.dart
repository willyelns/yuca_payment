import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PaymentListLoadingState extends StatelessWidget {
  const PaymentListLoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: 300,
            height: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[300]!,
            ),
          ),
        );
      },
    );
  }
}
