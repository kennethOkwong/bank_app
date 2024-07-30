import 'package:bank_app/src/feature/product/controller/product.dart';
import 'package:bank_app/src/feature/product/view/widgets/product_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider);
    return FutureBuilder(
      future: productController.getProducts(context: context),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null && data.isNotEmpty) {
          // data.sort();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error Loading Data"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (data != null) {
            return Expanded(
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => Divider(
                  height: 0.5,
                  color: Colors.grey.shade200,
                ),
                itemBuilder: (context, index) {
                  return ProductListItem(product: data[index]);
                },
              ),
            );
          } else {
            return const Center(
              child: Text("Error Loading Data"),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
