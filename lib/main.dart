import 'package:flutter/material.dart';
import 'package:scholar_chat/views/log_in_view.dart';
import 'package:scholar_chat/views/registeration_view.dart';

void main() {
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LogInView.routeName,
      routes: {
        LogInView.routeName: (context) => const LogInView(),
        RegisterationView.routeName: (context) => const RegisterationView(),
      }
    );
  }
}