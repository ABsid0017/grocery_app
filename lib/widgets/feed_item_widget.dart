import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/inner_screen/product_detail_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/heart_btn_widget.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: ProductDetails.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.asset(
                'assets/images/landing/PDaisy.png',
                width: 80,
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: textColor,
                      textSize: 20,
                      isTitle: true,
                    ),
                    const HeartBTN(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                          salePrice: 2.99,
                          price: 5.9,
                          textPrice: _quantityTextController.text,
                          isOnSale: true),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          FittedBox(
                            child: TextWidget(
                              text: 'PCs',
                              color: textColor,
                              textSize: 16,
                              isTitle: true,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _quantityTextController,
                              key: const ValueKey('10'),
                              style: TextStyle(color: textColor, fontSize: 16),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              enabled: true,
                              onChanged: (valueee) {
                                if (valueee.isNotEmpty) {
                                  setState(() {});
                                } else {
                                  // setState(() {});
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.]'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'Add To Cart',
                    color: textColor,
                    textSize: 18,
                    maxLine: 1,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).cardColor,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
