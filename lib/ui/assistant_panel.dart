import 'package:flutter/material.dart';

class AssistantPanel extends StatelessWidget {
  final VoidCallback onClose;
  const AssistantPanel({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 80,
      child: Container(
        width: 320,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(2, 4)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // AI Assistant Title
            Text(
              "AI Assistant",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Mic Button
            GestureDetector(
              onTap: () {
                // Handle Voice Activation
              },
              child: CircleAvatar(
                backgroundColor: Color(0xFFFF8C0D),
                radius: 35,
                child: Icon(Icons.mic, color: Colors.white, size: 36),
              ),
            ),

            SizedBox(height: 10),
            // Feature Options
            buildOption(Icons.headset_mic, "Voice Assistant"),
            buildOption(Icons.text_snippet, "Read Text"),
            buildOption(Icons.summarize, "Summarize"),
            buildOption(Icons.folder, "Manage Files"),

            SizedBox(height: 10),
            // Close Button
            TextButton(
              onPressed: onClose,
              child: Text("Close", style: TextStyle(color: Color(0xFFFF8C0D), fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFE4C4), // Light Orange Background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFFF8C0D), width: 1.5),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFFF8C0D), size: 28),
          SizedBox(width: 12),
          Text(text, style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
