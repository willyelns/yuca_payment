import 'package:flutter/material.dart';

import '../features/payment/presentation/pages/payment_details/payment_details_page.dart';
import '../features/payment/presentation/pages/payment_list/payment_list_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => const PaymentListPage(),
  '/details': (context) => const PaymentDetailsPage(),
};
