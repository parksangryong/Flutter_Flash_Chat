import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  const MessageBubble(
      {super.key,
      required this.text,
      required this.sender,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Material(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isMe ? 30 : 0),
                bottomLeft: const Radius.circular(30),
                bottomRight: const Radius.circular(30),
                topRight: Radius.circular(isMe ? 0 : 30)),
            elevation: 5,
            color: isMe? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(fontSize: 15, color: isMe? Colors.white : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
