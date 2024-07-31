import 'package:bank_app/src/res/messages.dart';
import 'package:bank_app/src/feature/bank/repository/bank.dart';
import 'package:bank_app/src/models/bank.dart';
import 'package:bank_app/src/utils/config.dart';
import 'package:bank_app/src/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final productControllerProvider =
    StateNotifierProvider<ProductController, List<BankModel>>((ref) {
  final repo = ref.watch(productRepoProvider);
  return ProductController(repo);
});

class ProductController extends StateNotifier<List<BankModel>> {
  final ProductRepo _repo;
  ProductController(this._repo) : super([]) {
    getProducts();
  }

  List<BankModel> allBanks = [];

  Future<List<BankModel>?> getProducts({BuildContext? context}) async {
    final result = await _repo.getProducts();
    return result.fold(
      (failure) {
        if (AppConfig.devMode && context != null) {
          SnackBarService.showSnackBar(
              context: context, message: FailureMessage.banksFetched);
        }
        return null;
      },
      (banks) {
        if (AppConfig.devMode && context != null) {
          SnackBarService.showSnackBar(
              context: context, message: SuccessMessage.banksFetched);
        }
        allBanks.clear();
        allBanks.addAll(banks);
        state = allBanks;
        return banks;
      },
    );
  }

  void filterList(String searchTerm) {
    if (searchTerm.isEmpty) {
      state = allBanks;
    } else {
      state = allBanks
          .where((bank) => bank.bankName.toLowerCase().contains(searchTerm))
          .toList();
    }
  }

  void toggleIsFavourite(BankModel bank) {
    final List<BankModel> banks = state;
    final index = banks.indexOf(bank);
    banks.remove(bank);
    bank.isFavourite = !bank.isFavourite;
    banks.insert(index, bank);

    state = [...banks];
  }
}
