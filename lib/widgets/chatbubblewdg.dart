import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';

class ChatBubbleWdg extends StatelessWidget {
  const ChatBubbleWdg({
    super.key, required this.message,
  });
final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
        //alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
