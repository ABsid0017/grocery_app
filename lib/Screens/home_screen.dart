import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner_screen/all_product_screen.dart';
import 'package:grocery_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/feed_item_widget.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';

import '../consts/const_imagelink.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    bool isDark = utils.getTheme;
    Color textColor = utils.myTextColor;
    final screenSize = utils.getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    ConstImagesList.offerImage[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: ConstImagesList.offerImage.length,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: isDark
                        ? Colors.lightBlue.shade200
                        : Colors.blueAccent.shade200,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                color: isDark
                    ? Colors.lightBlue.shade200
                    : Colors.blueAccent.shade200,
                textSize: 20,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'ON SALE',
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: screenSize.height * 0.24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return const OnSaleWidget();
                      }),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: textColor,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          context: context,
                          routeName: ProductsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'View all',
                      color: isDark
                          ? Colors.lightBlue.shade200
                          : Colors.blueAccent.shade200,
                      textSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: screenSize.width / (screenSize.height * 0.6),
              padding: EdgeInsets.zero,
              children: List.generate(4, (index) {
                return const FeedWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}
