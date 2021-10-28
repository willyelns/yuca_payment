import 'package:yuca_payment/features/payment/domain/repositories/payment_repository.dart';

import '../entities/payment.dart';
import '../../../../commons/types/use_case_response.dart';

part 'retrieve_payment_list_impl.dart';

abstract class RetrievePaymentList {
  UseCaseResponse<List<Payment>> call();
}
