import 'package:yuca_payment/features/payment/domain/entities/payment.dart';

import '../../../../commons/types/use_case_response.dart';

abstract class PaymentRepository {
  /// Retrieves a [List<Payment>] from the data source.
  UseCaseResponse<List<Payment>> retrievePaymentList();
}
