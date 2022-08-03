import 'package:flutter/material.dart';

import '../../../../domain/entities/payment_details.dart';
import '../../../stores/payment_store.dart';
import '../../../widgets/custom_divider.dart';
import 'payment_details_item.dart';

class PaymentDetailsList extends StatelessWidget {
  const PaymentDetailsList({
    required this.paymentDetailsList,
    required this.paymentStore,
    Key? key,
  }) : super(key: key);

  final List<PaymentDetails> paymentDetailsList;
  final PaymentStore paymentStore;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final paymentDetails = paymentDetailsList[index];
        return PaymentDetailsItem(
          paymentDetails: paymentDetails,
          value: paymentStore.getRealValueFormatter(paymentDetails.value),
        );
      },
      separatorBuilder: (_, __) => const CustomDivider(),
      itemCount: paymentDetailsList.length,
    );
  }
}
