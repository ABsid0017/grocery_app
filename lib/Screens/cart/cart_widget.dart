import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/heart_btn_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../inner_screen/product_detail_screen.dart';
import '../../services/global_methods.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;

    return GestureDetector(
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: ProductDetails.routeName);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.21,
                      height: size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Image.asset(
                        'assets/images/landing/pinkrose.png',
                        width: 70,
                        height: 80,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Title',
                          color: textColor,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              quantityController(
                                function: () {
                                  if (int.parse(_quantityTextController.text) >
                                      1) {
                                    setState(() {
                                      _quantityTextController.text = (int.parse(
                                                  _quantityTextController
                                                      .text) -
                                              1)
                                          .toString();
                                    });
                                  }
                                },
                                btnIcon: Icons.remove,
                                btnColor: Colors.red,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  style:
                                      TextStyle(color: textColor, fontSize: 16),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide()),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.]'),
                                    ),
                                  ],
                                  onChanged: (valueee) {
                                    if (valueee.isNotEmpty) {
                                      setState(() {});
                                    }
                                  },
                                ),
                              ),
                              quantityController(
                                function: () {
                                  setState(() {
                                    _quantityTextController.text = (int.parse(
                                                _quantityTextController.text) +
                                            1)
                                        .toString();
                                  });
                                },
                                btnIcon: Icons.add,
                                btnColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const HeartBTN(),
                          TextWidget(
                            text: '\$0.29',
                            color: textColor,
                            textSize: 18,
                            maxLine: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityController(
      {required Function function,
      required IconData btnIcon,
      required Color btnColor}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Material(
          color: btnColor,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              function();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                btnIcon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
