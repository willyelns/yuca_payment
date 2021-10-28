import '../data/datasources/payment_datasource.dart';
import '../data/models/payment_model.dart';
import 'payment_retrofit_datasource.dart';
import '../../../commons/base/remote_datasouce.dart';

class PaymentRemoteDataSourceImpl extends RemoteDataSource
    implements PaymentRemoteDataSource {
  PaymentRemoteDataSourceImpl({
    required PaymentRetrofitDataSource paymentRetrofitDataSource,
  }) : _paymentRetrofitDataSource = paymentRetrofitDataSource;

  final PaymentRetrofitDataSource _paymentRetrofitDataSource;

  @override
  Future<List<PaymentModel>> retrievePaymentList() async {
    return handleException(
      () async => _paymentRetrofitDataSource.retrievePaymentList(),
      errorMessage: 'Failed to retrieve the payment list',
    );
  }
}
