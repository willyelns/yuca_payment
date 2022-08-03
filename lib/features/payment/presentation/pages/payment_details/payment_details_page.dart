import 'package:flutter/material.dart';

import '../../../../../commons/extensions/theme/theme_context.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/payment.dart';
import '../../../domain/entities/payment_details.dart';
import '../../stores/payment_store.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/payment_due_date.dart';
import '../../widgets/payment_effective_date.dart';
import '../../widgets/payment_header.dart';
import '../../widgets/payment_value.dart';
import 'widgets/payment_details_list.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  PaymentStore get paymentStore => serviceLocator<PaymentStore>();

  Payment get payment => paymentStore.selectedPayment!;

  List<PaymentDetails> get paymentDetailsList => payment.details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 80),
        child: const CustomAppBar(title: 'Mensalidades', isDetails: true),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: context.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PaymentHeader(
                backgroundColor: paymentStore.getPrimaryColor(payment),
                icon: paymentStore.getHeaderIcon(payment),
                title: paymentStore.getHeaderTitle(payment),
                isCard: false,
              ),
              const SizedBox(height: 32),
              PaymentEffectiveDate(
                date:
                    paymentStore.formattedEffectiveDate(payment.effectiveDate),
              ),
              const SizedBox(height: 8),
              PaymentDueDate(
                date: paymentStore.formattedDueDate(payment.dueDate),
              ),
              const SizedBox(height: 22),
              PaymentValue(
                color: paymentStore.getPrimaryColor(payment),
                value: paymentStore.getRealValueFormatter(payment.value),
              ),
              const SizedBox(height: 32),
              const CustomDivider(),
              const SizedBox(height: 32),
              PaymentDetailsList(
                paymentDetailsList: paymentDetailsList,
                paymentStore: paymentStore,
              )
            ],
          ),
        ),
      ),
    );
  }
}
