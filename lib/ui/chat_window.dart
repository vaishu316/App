import 'package:flutter/material.dart';

class ChatWindow extends StatelessWidget {
  final VoidCallback onClose;

  const ChatWindow({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 80,
      child: Container(
        width: 320,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 8)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "AI Assistant",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Handle Voice Activation
              },
              child: CircleAvatar(
                backgroundColor: Colors.orange, // Adjusted color
                radius: 30,
                child: Icon(Icons.mic, color: Colors.white, size: 30),
              ),
            ),
            SizedBox(height: 10),
            buildOption(Icons.headset_mic, "Voice Assistant"),
            buildOption(Icons.text_snippet, "Read Text"),
            buildOption(Icons.summarize, "Summarize"),
            buildOption(Icons.folder, "Manage Files"),
            SizedBox(height: 5),
            IconButton(icon: Icon(Icons.close, color: Colors.white), onPressed: onClose),
          ],
        ),
      ),
    );
  }

  Widget buildOption(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange), // Adjusted icon color
          SizedBox(width: 10),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
