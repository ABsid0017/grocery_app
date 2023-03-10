import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/google.png',
                width: 40,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextWidget(
              text: "Sign in with google",
              color: Colors.white,
              textSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
