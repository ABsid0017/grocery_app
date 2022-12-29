import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/auth/forget_pass_screen.dart';
import 'package:grocery_app/Screens/auth/signup_screen.dart';
import 'package:grocery_app/Screens/home_screen.dart';
import 'package:grocery_app/widgets/auth_button.dart';
import 'package:grocery_app/widgets/google_button.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../consts/const_imagelink.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../btm_bar.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passFocusNode.dispose();

    super.dispose();
  }

  void _submitLoginForm() {
    final _isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isValid) {
      print('form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    bool isDark = utils.getTheme;
    Color textColor = utils.myTextColor;
    final screenSize = utils.getScreenSize;

    return Scaffold(
      body: Stack(children: [
        Swiper(
          duration: 800,
          autoplayDelay: 2000,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              ConstImagesList.authImage[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
          itemCount: ConstImagesList.authImage.length,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 120,
                ),
                TextWidget(
                  text: 'Welcome Back',
                  color: Colors.white,
                  textSize: 30,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  text: 'Sign in to continue',
                  color: Colors.white,
                  textSize: 18,
                  isTitle: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Email TextFeild
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_passFocusNode),
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          String? emailValue = value?.toLowerCase();
                          if (emailValue!.isEmpty ||
                              !emailValue.contains('@') ||
                              !emailValue.contains('.com') ||
                              emailValue.contains(' ')) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //Password TextFeild

                      TextFormField(
                        focusNode: _passFocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          _submitLoginForm();
                        },
                        controller: _passwordTextController,
                        obscureText: _obsecureText,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          String? passValue = value?.toLowerCase();
                          if (passValue!.isEmpty ||
                              passValue.contains(' ') ||
                              passValue.length < 7) {
                            return "Invalid Password";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              child: Icon(
                                _obsecureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              )),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          context: context,
                          routeName: ForgetPasswordScreen.routeName);
                    },
                    child: const Text(
                      'Forget passwrd?',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  fct: () {
                    _submitLoginForm();
                  },
                  btnText: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                const GoogleButton(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextWidget(text: 'OR', color: Colors.white, textSize: 18),
                    const SizedBox(
                      width: 5,
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  fct: () {
                    Navigator.pushReplacementNamed(
                        context, BottomBarScreen.routeName);
                  },
                  btnText: 'Continue As Guest',
                  btnColor: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              GlobalMethods.navigateTo(
                                  context: context,
                                  routeName: SignupScreen.routeName);
                            }),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
