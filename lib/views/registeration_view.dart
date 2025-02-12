import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/views/chat_view.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field_widget.dart';

class RegisterationView extends StatefulWidget {
  RegisterationView({super.key});
  static const routeName = '/registeration';
  @override
  State<RegisterationView> createState() => _RegisterationViewState();
}

class _RegisterationViewState extends State<RegisterationView> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  //const
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
                  if (data == null || data.isEmpty) {
                    return 'the field is required';
                  } else if (!data.contains('@') || !data.contains('.')) {
                    return 'please enter a valid email';
                  } else {
                    return null;
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
                    if (data == null || data.isEmpty) {
                      return 'the field is required';
                    } else if (data.length < 6 || data.length > 9) {
                      return 'password must be between 6 and 9';
                    } else {
                      return null;
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
                        setState(() {
                          isLoading = true;
                        });
                        await registerUser();
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
      ),
    );
  }

  

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
