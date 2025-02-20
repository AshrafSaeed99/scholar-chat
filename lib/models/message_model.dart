import 'package:scholar_chat/constant.dart';

class MessageModel {
  final String message;
  MessageModel({required this.message,});
  factory MessageModel.fromJson(json) {
    return MessageModel(
      message: json[kMessagesField],
    );
  }
}