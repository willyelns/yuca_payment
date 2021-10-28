part of 'retrieve_payment_list.dart';

class RetrievePaymentListImpl implements RetrievePaymentList {
  const RetrievePaymentListImpl(this._repository);

  final PaymentRepository _repository;

  @override
  UseCaseResponse<List<Payment>> call() async {
    return _repository.retrievePaymentList();
  }
}
