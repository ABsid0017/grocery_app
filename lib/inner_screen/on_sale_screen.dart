import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/feed_item_widget.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({Key? key}) : super(key: key);
  static const routeName = '/OnSaleScreen';

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Utils utils = Utils(context);
    bool isDark = utils.getTheme;
    Color textColor = utils.myTextColor;
    final screenSize = utils.getScreenSize;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black87 : Colors.blueAccent.shade200,
          leading: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              IconlyLight.arrowLeft2,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Product on sale',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: _isEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/box.png'),
                  ),
                  Center(
                    child: TextWidget(
                      text: 'No product on sale !',
                      color: textColor,
                      textSize: 30,
                      isTitle: true,
                    ),
                  ),
                ],
              )
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: screenSize.width / (screenSize.height * 0.45),
                padding: EdgeInsets.zero,
                children: List.generate(16, (index) {
                  return const OnSaleWidget();
                }),
              ));
  }
}
