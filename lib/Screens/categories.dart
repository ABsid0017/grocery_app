import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'assets/images/landing/pinkrose.png', 'catText': 'Roses'},
    {'imgPath': 'assets/images/landing/Lilly1.png', 'catText': 'Lillys'},
    {'imgPath': 'assets/images/landing/PDaisy.png', 'catText': 'Daisy'},
    {'imgPath': 'assets/images/landing/sun.png', 'catText': 'Sunflowers'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 250 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            catInfo.length,
            ((index) {
              return CategoriesWidget(
                imgPath: catInfo[index]['imgPath'],
                catText: catInfo[index]['catText'],
              );
            }),
          ),
        ),
      ),
    );
  }
}
