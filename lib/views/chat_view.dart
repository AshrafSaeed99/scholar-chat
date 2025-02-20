import 'package:flutter/material.dart';
import 'package:scholar_chat/constant.dart';
import 'package:scholar_chat/models/message_model.dart';
import 'package:scholar_chat/widgets/chatbubblewdg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static const String routeName = '/chat-view';
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            messages.orderBy(kCreatedAtField, descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
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
                    const Text(
                      'Chat',
                      style: TextStyle(color: Colors.white, fontSize: 28.0),
                    ),
                  ],
                ),
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        //reverse: true,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) => ChatBubbleWdg(
                          message: messagesList[index].message,
                        ),
                      ),
                    ),
                    TextField(
                      controller: messageController,
                      onSubmitted: (value) {
                        messages.add({
                          kMessagesField: value,
                          kCreatedAtField: DateTime.now(),
                        });
                        messageController.clear();
                        scrollController.animateTo(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      cursorColor: kPrimaryColor,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                              width: 1.5,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
              value: 100,
            ));
          }
        });
  }
}
