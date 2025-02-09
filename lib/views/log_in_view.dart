import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/views/registeration_view.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field_widget.dart';

class LogInView extends StatelessWidget {
  static const routeName = '/home';

  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            children: [
              Image.asset(
                'assets/images/scholar.png',
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Scholar Chat',
                    style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.white,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const CustomTextFieldWidget(
                labelText: 'Email',
              ),
              const SizedBox(
                height: 12.0,
              ),
              const CustomTextFieldWidget(
                labelText: 'Password',
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomButton(onPressed:() {}, btnText: 'Sign In'),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context,RegisterationView.routeName);
                  },
                  child:const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffc7ede6)),
                  ),
                )
              ]),
            ]),
      ),
    );
  }
}

