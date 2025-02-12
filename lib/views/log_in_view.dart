import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/views/chat_view.dart';
import 'package:scholar_chat/views/registeration_view.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field_widget.dart';

class LogInView extends StatefulWidget {
  static const routeName = '/home';

  LogInView({
    super.key,
  });

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(children: [
              Image.asset(
                kLogo,
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
              CustomTextFieldWidget(
                onChanged: (data) {
                  email = data;
                },
                labelText: 'Email',
              ),
              SizedBox(
                height: 12.0,
              ),
              CustomTextFieldWidget(
                onChanged: (data) {
                  password = data;
                },
                labelText: 'Password',
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        isLoading = true;                        
                      });
                      await loginUser();
                        if (mounted) {
                          Navigator.pushNamed(context, ChatView.routeName);
                        }
                    } on FirebaseAuthException catch (e) {
                      if (mounted) {
                        showSnackBar(context, e.message ?? e.toString());
                      }
                    } catch (e) {
                      if (mounted) {
                        showSnackBar(context, e.toString());
                      }
                    } finally {
                      if (mounted) {
                        setState(() => isLoading = false);
                      }
                    }
                  }
                },
                btnText: 'Sign In',
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterationView.routeName);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffc7ede6)),
                  ),
                )
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
