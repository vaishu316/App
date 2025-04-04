import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.2);
    await _tts.setSpeechRate(0.9);
    await _tts.speak(text);
  }
}
