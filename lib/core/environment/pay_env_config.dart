import 'base_env_config.dart';

class PayEnvConfig extends BaseEnvConfig {
  @override
  String get secretKey => 'sk_test_4d623cd2d4e94d8147157ea4d2e003a913774e1b';
  @override
  String get currency => '{"card" "ussd"}';
}
