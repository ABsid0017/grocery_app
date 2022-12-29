import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/Screens/order/order_screen.dart';
import 'package:grocery_app/Screens/viewed_recently/viewed_recently_screen.dart';
import 'package:grocery_app/Screens/wishlist/wishlist_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/list_tile_widget.dart';
import '../widgets/text_widget.dart';
import 'auth/login_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Address'),
          content: TextField(
            //onChanged: (value) {},
            controller: _addressTextController,
            decoration: const InputDecoration(hintText: 'Enter Your Address'),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    Color myColor = themeState.getDarkTheme ? Colors.white : Colors.black87;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Hi,  ',
                      style: TextStyle(
                        color: isDark
                            ? Colors.lightBlue.shade200
                            : Colors.blueAccent.shade200,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Guest User",
                          style: TextStyle(
                            color: myColor,
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextWidget(
                      color: myColor,
                      textSize: 16,
                      text: 'guest-user@gmail.com'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTileWidget(
                  title: "Address",
                  subtitle: "My Address 3123123",
                  icon: Icons.house_outlined,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                ),
                ListTileWidget(
                  title: "Order",
                  icon: IconlyLight.bag2,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        context: context, routeName: OrderScreen.routeName);
                  },
                ),
                ListTileWidget(
                  title: "Wishlist",
                  icon: IconlyLight.heart,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        context: context, routeName: WishlistScreen.routeName);
                  },
                ),
                ListTileWidget(
                  title: "Viewed",
                  icon: IconlyLight.show,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        context: context,
                        routeName: ViewedRecentlyScreen.routeName);
                  },
                ),
                ListTileWidget(
                  title: "Foget Password",
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                ),
                SwitchListTile(
                  title: const Text(
                    "Theme",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                ListTileWidget(
                  title: "Logout",
                  icon: IconlyLight.logout,
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: 'Sign out',
                        subtitle: 'Do you wanna sign out?',
                        function: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (Route route) => false);
                        },
                        context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
