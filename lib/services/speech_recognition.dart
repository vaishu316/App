import 'package:speech_to_text/speech_to_text.dart';

typedef VoiceResultCallback = void Function(String text);

class SpeechService {
  final SpeechToText _speech = SpeechToText();
  VoiceResultCallback? onResult;
  bool _isListening = false;

  bool get isListening => _isListening;

  Future<void> startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          _isListening = false;
        }
      },
      onError: (error) {
        _isListening = false;
        print('Speech recognition error: $error');
      },
    );

    if (available) {
      _isListening = true;
      _speech.listen(
        onResult: (result) {
          if (result.finalResult && onResult != null) {
            onResult!(result.recognizedWords);
          }
        },
      );
    } else {
      print('Speech recognition not available');
    }
  }

  void stopListening() {
    _speech.stop();
    _isListening = false;
  }
}
