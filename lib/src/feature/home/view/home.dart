import 'package:bank_app/src/feature/product/view/products.dart';
import 'package:bank_app/src/res/strings.dart';
import 'package:bank_app/src/utils/text_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  Widget build(BuildContext context) {
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
                  // controller: model.query,
                  onChanged: (value) {
                    // if (value.trim().isEmpty) {
                    //   model.toggleisSearching(false);
                    // }
                    // model.searchFaqs();
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
