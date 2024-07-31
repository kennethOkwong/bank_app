import 'package:bank_app/src/feature/bank/controller/bank.dart';
import 'package:bank_app/src/feature/bank/view/bank.dart';
import 'package:bank_app/src/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.read(productControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade900,
                ],
                begin: Alignment.topLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Bank',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 25,
                ),
                CustomInputText(
                  inputType: TextInputType.streetAddress,
                  hintText: '',
                  label: 'Search',
                  prefix: const Icon(Icons.search),
                  bgcolor: Colors.grey.shade100,
                  borderColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  onChanged: (value) {
                    productController.filterList(value);
                  },
                ),
              ],
            ),
          ),
          const ProductsList(),
        ],
      ),
    );
  }
}
