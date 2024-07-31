import 'package:bank_app/src/res/base.dart';

class EndPoints {
  static const _base = BasePaths.baseUrl;
  static const upload = "$_base/storage/upload";
  static const getProducts = "$_base/v1/wallet/banks/bank-list";
}
