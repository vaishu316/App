import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'ui/floating_button.dart';
import 'ui/assistant_panel.dart';
import 'services/speech_recognition.dart';
import 'services/text_to_speech.dart';
import 'services/ai_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // Loads API key from .env
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice AI Assistant',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: VoiceAssistantHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VoiceAssistantHome extends StatefulWidget {
  @override
  _VoiceAssistantHomeState createState() => _VoiceAssistantHomeState();
}

class _VoiceAssistantHomeState extends State<VoiceAssistantHome> {
  final SpeechService _speechService = SpeechService();
  String _lastResponse = "";

  void _handleVoiceInput(String command) async {
    if (command.trim().isEmpty) return;

    setState(() => _lastResponse = "Thinking...");
    TTSService.speak("Let me think...");

    try {
     final reply = await OpenAIService.sendMessage(command);
      setState(() => _lastResponse = reply);
      TTSService.speak(reply);
    } catch (e) {
      setState(() => _lastResponse = "Sorry, an error occurred.");
      TTSService.speak("Something went wrong.");
    }
  }

  @override
  void initState() {
    super.initState();
    _speechService.onResult = _handleVoiceInput;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AssistantPanel(response: _lastResponse),
          if (_speechService.isListening)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "🎙️ Listening...",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          FloatingButton(
            onTap: () {
              if (_speechService.isListening) {
                _speechService.stopListening();
              } else {
                _speechService.startListening();
              }
              setState(() {});
            },
            isListening: _speechService.isListening,
          ),
        ],
      ),
    );
  }
}
