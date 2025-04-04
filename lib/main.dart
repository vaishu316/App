import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'ui/floating_button.dart';
import 'ui/assistant_panel.dart';
import 'services/speech_recognition.dart';
import 'services/text_to_speech.dart';
import 'services/openai_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter initializes first
  await dotenv.load(fileName: ".env"); // Load API key
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

  void _handleVoiceInput(String command) async {
    if (command.trim().isEmpty) return;

    TTSService.speak("Let me think...");
    final reply = await OpenAIService.sendMessage(command);
    TTSService.speak(reply);
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
          AssistantPanel(),
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
              setState(() {}); // Update button state
            },
            isListening: _speechService.isListening,
          ),
        ],
      ),
    );
  }
}