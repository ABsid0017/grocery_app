import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key? key,
      required this.fct,
      required this.btnText,
      this.btnColor = Colors.white38})
      : super(key: key);

  final Function fct;
  final String btnText;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: btnColor,
        ),
        onPressed: () {
          fct();
        },
        child: Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
