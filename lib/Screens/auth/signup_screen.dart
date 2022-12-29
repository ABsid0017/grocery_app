import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/Screens/auth/login_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/auth_button.dart';

import '../../consts/const_imagelink.dart';
import '../../widgets/text_widget.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true;

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _addressTextController.dispose();
    _passFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();

    super.dispose();
  }

  void _submitSignupForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                    text: 'Welcome',
                    color: Colors.white,
                    textSize: 30,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextWidget(
                    text: 'Sign up to continue',
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
                        //Name Feild
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          controller: _nameTextController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            String? nameValue = value?.toLowerCase();
                            if (nameValue!.isEmpty) {
                              return "Please fill the name...";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Enter Your Name',
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

                        //Email TextFeild
                        TextFormField(
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
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
                            hintText: 'Enter Your Email',
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
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_addressFocusNode),
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
                            hintText: 'Enter Your Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        // Address Feild

                        TextFormField(
                          focusNode: _addressFocusNode,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            _submitSignupForm();
                          },
                          controller: _addressTextController,
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            String? adrsValue = value?.toLowerCase();
                            if (adrsValue!.isEmpty) {
                              return "Please fill the address...";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Enter Your Address',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthButton(fct: () {}, btnText: 'Signup'),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        children: [
                          TextSpan(
                            text: ' Sign In',
                            style: const TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              }),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
