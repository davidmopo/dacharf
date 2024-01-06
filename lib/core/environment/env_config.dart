import 'base_env_config.dart';
import 'pay_env_config.dart';

enum Environment { pay }

class EnvConfig {
  late BaseEnvConfig config;

  initConfig({Environment? environment}) {
    config = _getConfig(environment ?? null);
  }

  _getConfig([Environment? environment]) {
    switch (environment) {
      case Environment.pay:
        return PayEnvConfig();
      default:
        return PayEnvConfig();
    }
  }
}
