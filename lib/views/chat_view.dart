import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/widgets/chatbubblewdg.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static const String routeName = '/chat-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (kPrimaryColor),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text('Chat',
                style: TextStyle(color: Colors.white, fontSize: 28.0)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: 2,
              itemBuilder: (context, index) => ChatBubbleWdg(message: 'hellogg',),
              
            ),
          ),
        ],
      ),
    );
  }
}

