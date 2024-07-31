import 'package:bank_app/src/models/bank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/bank.dart';

class ProductListItem extends ConsumerWidget {
  const ProductListItem({super.key, required this.bank});

  final BankModel bank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider.notifier);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Text(
              bank.bankName.length > 1 ? bank.bankName.substring(0, 2) : 'AA',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  bank.bankName,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  bank.bankCode,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              bank.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              productController.toggleIsFavourite(bank);
            },
          )
        ],
      ),
    );
  }
}
