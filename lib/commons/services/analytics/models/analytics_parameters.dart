import 'package:flutter/foundation.dart';

import '../../../mixins/mappable.dart';

class AnalyticsParameters with Mappable {
  DateTime? triggeredAt;

  AnalyticsParameters({this.triggeredAt}) {
    triggeredAt = DateTime.now();
  }

  /// This method must be overrided with the extra data
  /// but the annotation: `@subClassMustOverride`  doesn't exist.
  /// For now, we can track this issue for more information [https://github.com/dart-lang/sdk/issues/30175]
  @override
  @mustCallSuper
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'triggered_at': triggeredAt?.toIso8601String()};
  }
}
