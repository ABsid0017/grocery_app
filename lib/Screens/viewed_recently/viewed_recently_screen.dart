import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/Screens/viewed_recently/viewed_recently_widget.dart';

import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widgets/empty_screen.dart';
import '../../widgets/text_widget.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';
  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  State<ViewedRecentlyScreen> createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    //Size size = utils.getScreenSize;
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
                imagePath: 'assets/images/history.png',
                title: 'Whoops',
                subtitle: 'Your history is empty !',
                buttonText: 'Browse Products'),
          )
        : Scaffold(
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
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: 'Empty Viewd',
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
                text: 'History',
                color: textColor,
                textSize: 22,
                isTitle: true,
              ),
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: ViewedRecentlyWidget(),
                  );
                }),
          );
  }
}
