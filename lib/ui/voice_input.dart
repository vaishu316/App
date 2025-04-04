import 'package:flutter/material.dart';

class VoiceInputIndicator extends StatelessWidget {
  final bool isListening;

  const VoiceInputIndicator({Key? key, required this.isListening}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isListening ? Colors.orangeAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            if (isListening)
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: isListening ? Colors.white : Colors.black54,
            ),
            SizedBox(width: 10),
            Text(
              isListening ? "Listening..." : "Tap the mic to speak",
              style: TextStyle(
                fontSize: 16,
                color: isListening ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

