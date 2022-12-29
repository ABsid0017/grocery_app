import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function function,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                text: 'Cancel',
                textSize: 18,
                color: Colors.cyan,
              ),
            ),
            TextButton(
              onPressed: () {
                function();
              },
              child: TextWidget(
                text: 'OK',
                textSize: 18,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}
