import '../../../mixins/mappable.dart';

class FirebaseAnalyticsData<T> with Mappable {
  const FirebaseAnalyticsData({
    required this.userId,
    this.extraParameters,
  });

  final String userId;
  final T? extraParameters;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'extra_parameters': extraParameters is Mappable
          ? (extraParameters as Mappable).toMap()
          : extraParameters
    };
  }
}
