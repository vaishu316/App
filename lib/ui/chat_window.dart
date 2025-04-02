import 'package:flutter/material.dart';

class ChatWindow extends StatelessWidget {
  final VoidCallback onClose;

  ChatWindow({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 20,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],
        ),
        width: 250,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Chat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(icon: Icon(Icons.close), onPressed: onClose),
              ],
            ),
            Expanded(
              child: Center(child: Text("Chat content goes here")),
            ),
          ],
        ),
      ),
    );
  }
}
