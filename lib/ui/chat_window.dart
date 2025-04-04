import 'package:flutter/material.dart';

class ChatWindow extends StatelessWidget {
  final VoidCallback onClose;

  const ChatWindow({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 300,
        height: 400,
        color: Colors.white,
        child: Column(
          children: [
            Text('Chat Window'),
            ElevatedButton(onPressed: onClose, child: Text('Close')),
          ],
        ),
      ),
    );
  }
}
