import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  static Future<String> sendMessage(String message) async {
    final openAIKey = dotenv.env['OPENAI_API_KEY'] ?? '';
    const endpoint = "https://api.openai.com/v1/chat/completions";
    final headers = {
      "Authorization": "Bearer $openAIKey",
      "Content-Type": "application/json",
    };

    final body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": message}
      ],
      "temperature": 0.7
    });

    final response = await http.post(Uri.parse(endpoint), headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      print("Error: ${response.body}");
      return "Sorry, I couldn't process that.";
    }
  }
}
