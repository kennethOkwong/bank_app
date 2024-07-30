import 'package:bank_app/src/utils/config.dart';

class BasePaths {
  const BasePaths._();

  static const baseImagePath = "assets/images";
  static const baseAnimationPath = "assets/animations";
  static const baseIconPath = "assets/icons";
  static const basePlaceholderPath = "assets/placeholders";
  static const baseProdUrl = "";
  static const baseTestUrl = "https://percentpay-backend-service.onrender.com";
  static const baseUrl = AppConfig.devMode ? baseTestUrl : baseProdUrl;
}
