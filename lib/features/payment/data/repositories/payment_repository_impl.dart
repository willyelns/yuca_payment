import 'package:yuca_payment/commons/errors/exceptions/server_exception.dart';
import 'package:yuca_payment/commons/errors/failures/server_failure.dart';
import 'package:yuca_payment/features/payment/data/datasources/payment_datasource.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/repositories/payment_repository.dart';

import '../../../../commons/types/use_case_response.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  const PaymentRepositoryImpl({
    required PaymentRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final PaymentRemoteDataSource _remoteDataSource;

  @override
  UseCaseResponse<List<Payment>> retrievePaymentList() async {
    try {
      final paymentList = await _remoteDataSource.retrievePaymentList();
      return UseCaseResponseExtension.createSuccess<List<Payment>>(paymentList);
    } on ServerException catch (e) {
      return UseCaseResponseExtension.createFailure<List<Payment>>(
        ServerFailure(message: e.message),
      );
    } on Exception catch (_) {
      return UseCaseResponseExtension.createFailure<List<Payment>>(
        const ServerFailure(),
      );
    }
  }
}
