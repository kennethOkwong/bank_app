import 'dart:convert';
import 'dart:developer';
import 'package:bank_app/src/core/core.dart';
import 'package:bank_app/src/res/endpoints.dart';
import 'package:bank_app/src/models/bank.dart';
import 'package:bank_app/src/res/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

final productRepoProvider = Provider((ref) {
  final api = ref.watch(networkRepoProvider);
  return ProductRepo(api: api);
});

class ProductRepo {
  final NetworkRepo _api;
  final _name = "PRODUCT_CONTROLLER";
  ProductRepo({required NetworkRepo api}) : _api = api;

  FutureEither<List<BankModel>> getProducts() async {
    final result =
        await _api.getRequest(url: EndPoints.getProducts, requireAuth: false);
    return result.fold(
      (Failure failure) {
        log(failure.message, name: _name);
        return Left(failure);
      },
      (Response response) {
        try {
          final data = jsonDecode(response.body);
          final productJson = data['data']['bankList'];
          log(productJson.toString(), name: _name);
          final List<BankModel> products = [];
          for (dynamic product in productJson) {
            log(product.toString(), name: _name);
            products.add(BankModel.fromMap(product));
          }
          return Right(products);
        } catch (e, stktrc) {
          log(FailureMessage.jsonParsingFailed, name: _name);
          return Left(Failure(
            message: FailureMessage.jsonParsingFailed,
            stackTrace: stktrc,
          ));
        }
      },
    );
  }
}
