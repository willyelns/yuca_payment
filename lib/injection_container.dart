import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:yuca_payment/commons/services/remote_config/firebase_remote_config.dart';

import 'commons/formatters/currency_formatter.dart';
import 'commons/formatters/date_formatter.dart';
import 'commons/services/analytics/firebase_analytics_service.dart';
import 'commons/services/http_config/http_config.dart';
import 'features/payment/data/datasources/payment_datasource.dart';
import 'features/payment/data/repositories/payment_repository_impl.dart';
import 'features/payment/domain/repositories/payment_repository.dart';
import 'features/payment/domain/usecases/retrieve_payment_list.dart';
import 'features/payment/presentation/stores/payment_store.dart';
import 'features/payment/remote/payment_remote_datasource.dart';
import 'features/payment/remote/payment_retrofit_datasource.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //* Commons
  final logger = Logger();
  final httpConfigService = HttpConfigService(
    baseUrl: 'https://private-42e99d-yuca1.apiary-mock.com',
    logger: logger,
  );
  serviceLocator.registerLazySingleton(() => httpConfigService);
  serviceLocator.registerLazySingleton(() => logger);
  serviceLocator.registerLazySingleton(() => httpConfigService.appDioInstance);

  //* Services

  serviceLocator.registerLazySingleton(() => FirebaseAnalytics.instance);
  serviceLocator.registerLazySingleton(
    () => FirebaseAnalyticsObserver(
      analytics: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(() => FirebaseAnalyticsService(
        analytics: serviceLocator(),
        observer: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton(() => FirebaseRemoteConfig.instance);
  serviceLocator.registerLazySingleton(
    () => FirebaseRemoteConfigService(
      remoteConfig: serviceLocator(),
    ),
  );

  //* Formatters
  serviceLocator
      .registerLazySingleton<DateFormatter>(() => DateFormatterImpl());
  serviceLocator
      .registerLazySingleton<CurrencyFormatter>(() => CurrencyFormatterImpl());

  //* Domain
  serviceLocator.registerLazySingleton<RetrievePaymentList>(
    () => RetrievePaymentListImpl(serviceLocator()),
  );

  //* Data
  serviceLocator.registerLazySingleton<PaymentRetrofitDataSource>(
    () => PaymentRetrofitDataSource(
      serviceLocator(),
      baseUrl: 'https://private-42e99d-yuca1.apiary-mock.com',
    ),
  );
  serviceLocator.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(
      paymentRetrofitDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );

  //* Presentation
  serviceLocator.registerLazySingleton<PaymentStore>(
    () => PaymentStore(
      retrievePaymentList: serviceLocator(),
      dateFormatter: serviceLocator(),
      currencyFormatter: serviceLocator(),
    ),
  );
}
