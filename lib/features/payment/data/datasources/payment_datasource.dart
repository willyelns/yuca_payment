import 'package:yuca_payment/features/payment/domain/entities/payment.dart';

abstract class PaymentRemoteDataSource {
  Future<List<Payment>> retrievePaymentList();
}
