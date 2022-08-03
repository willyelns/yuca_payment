import 'package:firebase_analytics/firebase_analytics.dart';

import '../../errors/exceptions/analytics_exception.dart';
import 'analytics_service.dart';
import 'models/firebase_analytics_data.dart';
import 'models/open_payment_parameters.dart';

class FirebaseAnalyticsService extends AnalyticsService {
  FirebaseAnalyticsService({
    required this.analytics,
    required this.observer,
  });

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Future<void> initAnalytics() {
    // Add extra config to init the analytics service
    throw UnimplementedError();
  }

  @override
  Future<void> registerUserInformation<T>(T userIdentifier) async {
    try {
      final userData = _checkParamatersHandle(userIdentifier);
      await analytics.setUserId(id: 'userID');
      await analytics.setUserProperty(name: 'userId', value: userData.userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOpenPaymentDetailsEvent<T>(T parameters) async {
    final userData = _checkParamatersHandle(parameters);
    await registerUserInformation(userData);
    if (userData.extraParameters is! OpenPaymentParameters) {
      throw const AnalyticsException(
          message: 'the extraParameters must be a OpenPaymentParameters');
    }
    final refuseUpdateParameters =
        userData.extraParameters as OpenPaymentParameters;
    return await analytics.logEvent(
      name: 'open_payment_details',
      parameters: refuseUpdateParameters.toMap(),
    );
  }

  FirebaseAnalyticsData _checkParamatersHandle<T>(T parameters) {
    if (parameters is! FirebaseAnalyticsData) {
      throw const AnalyticsException(
          message:
              'the userIdentifier must be a FirebaseAnalyticsData instance');
    }
    return parameters;
  }
}
