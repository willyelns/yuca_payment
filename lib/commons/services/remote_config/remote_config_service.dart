import 'models/remote_app_config_model.dart';

abstract class RemoteConfigService {
  Future<void> init();
  Future<void> fetchData();
  Future<RemoteAppConfigModel> get appConfigModel;
}
