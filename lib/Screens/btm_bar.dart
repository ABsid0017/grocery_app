import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/Screens/cart/cart_screen.dart';
import 'package:grocery_app/Screens/categories.dart';
import 'package:grocery_app/Screens/home_screen.dart';
import 'package:grocery_app/Screens/user.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'pages': const HomeScreen(), 'title': 'Home'},
    {'pages': CategoriesScreen(), 'title': 'Categories'},
    {'pages': const CartScreen(), 'title': 'Cart'},
    {'pages': const UserScreen(), 'title': 'User'},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black87 : Colors.blueAccent.shade200,
        centerTitle: true,
        title: Text(
          _pages[_selectedIndex]['title'],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
      body: _pages[_selectedIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Colors.black87 : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: isDark ? Colors.white54 : Colors.grey,
        selectedItemColor:
            isDark ? Colors.lightBlue.shade200 : Colors.blueAccent.shade200,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(IconlyBold.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              icon: Badge(
                toAnimate: true,
                shape: BadgeShape.circle,
                badgeColor: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                badgeContent: FittedBox(
                  child:
                      TextWidget(text: '2', color: Colors.white, textSize: 12),
                ),
                child: const Icon(IconlyBold.buy),
              ),
              label: 'Cart'),
          const BottomNavigationBarItem(
            icon: Icon(IconlyBold.user2),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
