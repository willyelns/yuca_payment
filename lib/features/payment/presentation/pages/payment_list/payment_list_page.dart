import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../commons/extensions/theme/theme_context.dart';
import '../../../../../commons/services/analytics/firebase_analytics_service.dart';
import '../../../../../commons/services/analytics/models/open_payment_parameters.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/payment.dart';
import '../../stores/payment_store.dart';
import '../../widgets/custom_app_bar.dart';
import 'states/payment_list_empty_state.dart';
import 'states/payment_list_error_state.dart';
import 'states/payment_list_loaded_state.dart';
import 'states/payment_list_loading_state.dart';

class PaymentListPage extends StatefulWidget {
  const PaymentListPage({Key? key}) : super(key: key);

  @override
  State<PaymentListPage> createState() => _PaymentListPageState();
}

class _PaymentListPageState extends State<PaymentListPage> {
  final paymentStore = serviceLocator<PaymentStore>();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    paymentStore.init();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(context.width, 80.0),
        child: const CustomAppBar(
          title: 'Pagamentos',
        ),
      ),
      body: Container(
        // width: context.width,
        height: context.height,
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (context) {
          final currentState = paymentStore.currentState;

          switch (currentState) {
            case PaymentPageState.init:
            case PaymentPageState.loading:
              return const PaymentListLoadingState();
            case PaymentPageState.empty:
              return const PaymentListEmptyState();
            case PaymentPageState.error:
              return const PaymentListErrorState();
            case PaymentPageState.loaded:
              final payments = paymentStore.paymentList!;
              return PaymentListLoadedState(
                payments: payments,
                onTapDetails: _goToDetails,
                onTapPay: _goToPay,
                paymentStore: paymentStore,
              );
          }
        }),
      ),
    );
  }

  void _goToDetails(Payment payment, VoidCallback openContainer) {
    paymentStore.selectPayment = payment;
    final analytics = serviceLocator.get<FirebaseAnalyticsService>();
    final paymentValue = payment.value.toString();
    analytics.logOpenPaymentDetailsEvent(OpenPaymentParameters(
        paymentId: paymentValue, paymentValue: paymentValue));
    openContainer();
  }

  void _goToPay(Payment payment) {
    const snackBar = SnackBar(
        content:
            Text('Ops, não foi possível gerar o pagamento no momento. :('));
    context.showSnackBar(snackBar);
  }
}
