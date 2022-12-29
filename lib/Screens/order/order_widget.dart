import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/inner_screen/product_detail_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/utils.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: ProductDetails.routeName);
      },
      leading: FancyShimmerImage(
        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
        width: size.width * 0.2,
        boxFit: BoxFit.fill,
      ),
      title: TextWidget(text: 'Title  x12', color: textColor, textSize: 18),
      trailing: TextWidget(text: '25/07/2022', color: textColor, textSize: 18),
    );
  }
}
