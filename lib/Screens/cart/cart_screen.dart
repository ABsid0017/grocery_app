import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/Screens/cart/cart_widget.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/global_methods.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    //Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;
    bool _isEmpty = false;
    return _isEmpty
        ? const EmptyScreen(
            imagePath: 'assets/images/cart.png',
            title: 'Whoops',
            subtitle: 'No item in your cart yet !',
            buttonText: 'Shop Now')
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: 'Empty Cart',
                        subtitle: 'Are you sure?',
                        function: () {},
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: textColor,
                  ),
                )
              ],
              title: TextWidget(
                text: 'Cart (2)',
                color: textColor,
                textSize: 22,
                isTitle: true,
              ),
            ),
            body: Column(
              children: [
                _checkOut(context: context),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const CartWidget();
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget _checkOut({required BuildContext context}) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: 'Order Now', color: Colors.white, textSize: 20),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$0.259',
                color: textColor,
                textSize: 18,
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
