import 'package:equatable/equatable.dart';
import 'package:yuca_payment/commons/mixins/mappable.dart';
import 'package:yuca_payment/commons/types/json_data.dart';

class RemoteAppConfigModel extends Equatable with Mappable {
  const RemoteAppConfigModel({required this.appName});

  final String appName;

  factory RemoteAppConfigModel.fromJson(JsonData json) {
    return RemoteAppConfigModel(appName: json['app_name']);
  }

  @override
  List<Object?> get props => [appName];

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'app_name': appName};
  }
}
