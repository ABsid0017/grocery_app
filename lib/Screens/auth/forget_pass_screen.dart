import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/auth_button.dart';

import '../../consts/const_imagelink.dart';
import '../../widgets/text_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgetPasswordScreen';
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  void forgetPassFct() async {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  onTap: () {
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                  },
                  child: const Icon(
                    IconlyLight.arrowLeft2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
                TextWidget(
                  text: 'Forget Password',
                  color: Colors.white,
                  textSize: 30,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
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
                  height: 30,
                ),
                AuthButton(fct: () {}, btnText: 'Reset Now')
              ],
            ),
          )
        ],
      ),
    );
  }
}
