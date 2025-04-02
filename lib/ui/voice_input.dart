import 'package:flutter/material.dart';
///import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceInput extends StatefulWidget {
  final Function(String) onResult;
  const VoiceInput({Key? key, required this.onResult}) : super(key: key);

  @override
  _VoiceInputState createState() => _VoiceInputState();
}

class _VoiceInputState extends State<VoiceInput> {
  stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;

  void startListening() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() => isListening = true);
      speech.listen(onResult: (result) {
        widget.onResult(result.recognizedWords);
      });
    }
  }

  void stopListening() {
    setState(() => isListening = false);
    speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isListening ? Icons.mic_off : Icons.mic, color: Colors.red),
      onPressed: isListening ? stopListening : startListening,
    );
  }
}
