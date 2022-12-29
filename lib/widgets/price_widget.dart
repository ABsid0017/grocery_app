import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isOnSale})
      : super(key: key);

  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    double userPrice = isOnSale ? salePrice : price;

    Utils utils = Utils(context);
    Color textColor = utils.myTextColor;
    return FittedBox(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            color: textColor,
            textSize: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2),
            ),
          ),
        ],
      ),
    );
  }
}
