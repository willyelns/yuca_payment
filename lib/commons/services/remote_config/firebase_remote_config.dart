import 'dart:convert';

import 'package:yuca_payment/commons/services/remote_config/remote_config_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'models/remote_app_config_model.dart';

const _kRemoteAppConfigKey = 'remoteAppConfig';

class FirebaseRemoteConfigService implements RemoteConfigService {
  FirebaseRemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  final FirebaseRemoteConfig _remoteConfig;

  @override
  Future<void> init() async {
    await fetchData();
  }

  @override
  Future<void> fetchData() async {
    await _remoteConfig.fetch();
  }

  @override
  Future<RemoteAppConfigModel> get appConfigModel async {
    final json = await _retrieveConfigRemoteListJson();
    return RemoteAppConfigModel.fromJson(json);
  }

  Future<Map<String, dynamic>> _retrieveConfigRemoteListJson() async {
    Map<String, dynamic> json = <String, dynamic>{};
    await fetchData();
    final jsonString = _remoteConfig.getString(_kRemoteAppConfigKey);
    json = jsonDecode(jsonString);
    return json;
  }
}
