import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/Screens/wishlist/wishlist_widget.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/global_methods.dart';
import '../../widgets/empty_screen.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = '/WishlistScreen';
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color textColor = utils.myTextColor;
    bool _isEmpty = true;
    return _isEmpty
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  IconlyLight.arrowLeft2,
                  color: textColor,
                ),
              ),
            ),
            body: const EmptyScreen(
                imagePath: 'assets/images/wishlist.png',
                title: 'Whoops',
                subtitle: 'Your wishlist is empty !',
                buttonText: 'Explore'),
          )
        : Scaffold(
            appBar: AppBar(
              leading: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  IconlyLight.arrowLeft2,
                  color: textColor,
                ),
              ),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: 'Empty Wishlist',
                        subtitle: 'Are you sure?',
                        function: () {},
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: textColor,
                  ),
                )
              ],
              title: TextWidget(
                text: 'Wishlist (2)',
                color: textColor,
                textSize: 22,
                isTitle: true,
              ),
            ),
            body: MasonryGridView.count(
              itemCount: 5,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return WishlistWidget();
              },
            ),
          );
  }
}
