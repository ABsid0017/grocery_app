import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';

class HeartBTN extends StatelessWidget {
  const HeartBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Color textColor = utils.myTextColor;
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: textColor,
      ),
    );
  }
}
