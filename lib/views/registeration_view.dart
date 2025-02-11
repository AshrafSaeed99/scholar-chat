import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field_widget.dart';

class RegisterationView extends StatelessWidget {
  RegisterationView({super.key});
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  static const routeName = '/registeration'; //const
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(children: [
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
              'Sign Up',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextFieldWidget(
                validator: (data) {
                  if (data == '') {
                    return 'the field is required';
                  }else if(!data!.contains('mail')||!data.contains('@')){
                    return 'wrong email';

                  }
                },
              labelText: 'Email',
              onChanged: (data) {
                email = data;
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            CustomTextFieldWidget(
                validator: (data) {
                  if (data == '') {
                    return 'the field is required';
                  }else if(data!.length<6||data.length>10){
                    return 'must be between 6 and 9';
                  }                  
                },
                labelText: 'Password',
                onChanged: (data) {
                  password = data;
                }),
            const SizedBox(
              height: 16.0,
            ),
            CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await registerUser();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        showSnackBar(context, e.toString());
                      } else if (e.code == 'invalid-email') {
                        showSnackBar(context, e.toString());
                      } else if (e.code == 'weak-password') {
                        showSnackBar(context, e.toString());
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  }
                },
                btnText: 'Sign Up'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'already have an account?',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xffc7ede6)),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
