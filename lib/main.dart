import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/Screens/auth/forget_pass_screen.dart';
import 'package:grocery_app/Screens/auth/signup_screen.dart';
import 'package:grocery_app/Screens/btm_bar.dart';
import 'package:grocery_app/Screens/home_screen.dart';
import 'package:grocery_app/Screens/order/order_screen.dart';
import 'package:grocery_app/Screens/viewed_recently/viewed_recently_screen.dart';
import 'package:grocery_app/Screens/wishlist/wishlist_screen.dart';
import 'package:grocery_app/consts/theme_data.dart';
import 'package:grocery_app/inner_screen/all_product_screen.dart';
import 'package:grocery_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_app/inner_screen/product_detail_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const LoginScreen(),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            ProductsScreen.routeName: (context) => const ProductsScreen(),
            ProductDetails.routeName: (context) => const ProductDetails(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            OrderScreen.routeName: (context) => const OrderScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            SignupScreen.routeName: (context) => const SignupScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            BottomBarScreen.routeName: (context) => const BottomBarScreen(),
            ForgetPasswordScreen.routeName: (context) =>
                const ForgetPasswordScreen(),
          },
        );
      }),
    );
  }
}
