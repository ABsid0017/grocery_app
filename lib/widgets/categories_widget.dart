import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key, required this.catText, required this.imgPath})
      : super(key: key);

  final String catText, imgPath;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Color myColor = themeState.getDarkTheme ? Colors.white : Colors.black87;

    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        //height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade200.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.blueAccent.shade200.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: screenWidth * 0.3,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.fill)),
              ),
            ),
            TextWidget(
              text: catText,
              color: myColor,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
