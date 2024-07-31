import 'package:bank_app/src/feature/bank/controller/bank.dart';
import 'package:bank_app/src/feature/bank/view/widgets/product_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider);
    final notifier = ref.watch(productControllerProvider.notifier);

    if (notifier.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemCount: productController.length,
        separatorBuilder: (context, index) => Divider(
          height: 0.5,
          color: Colors.grey.shade200,
        ),
        itemBuilder: (context, index) {
          return ProductListItem(bank: productController[index]);
        },
      ),
    );
  }
}
