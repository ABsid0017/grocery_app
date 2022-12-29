import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/inner_screen/all_product_screen.dart';
import 'package:grocery_app/services/global_methods.dart';

import '../services/utils.dart';
import 'text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText})
      : super(key: key);

  final String imagePath, title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    bool isDark = utils.getTheme;
    Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: subtitle,
                color: Colors.cyan,
                textSize: 20,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: isDark
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary),
                    ),
                    primary: isDark
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 50,
                    )),
                onPressed: () {
                  GlobalMethods.navigateTo(
                      context: context, routeName: ProductsScreen.routeName);
                },
                child: TextWidget(
                  text: buttonText,
                  color: Colors.white,
                  textSize: 20,
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
