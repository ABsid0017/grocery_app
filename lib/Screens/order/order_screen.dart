import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/Screens/order/order_widget.dart';
import 'package:grocery_app/services/utils.dart';

import '../../services/global_methods.dart';
import '../../widgets/empty_screen.dart';
import '../../widgets/text_widget.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    //Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;
    bool _isEmpty = true;
    return _isEmpty
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  IconlyLight.arrowLeft2,
                  color: textColor,
                ),
              ),
            ),
            body: const EmptyScreen(
                imagePath: 'assets/images/cart.png',
                title: 'Whoops',
                subtitle: 'You didnt place any order yet',
                buttonText: 'Shop Now'),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  IconlyLight.arrowLeft2,
                  color: textColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: 'Empty Order',
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
                text: 'Your Orders (2)',
                color: textColor,
                textSize: 22,
                isTitle: true,
              ),
            ),
            body: ListView.separated(
                itemBuilder: ((context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 6,
                    ),
                    child: OrderWidget(),
                  );
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: textColor,
                  );
                },
                itemCount: 10),
          );
  }
}
