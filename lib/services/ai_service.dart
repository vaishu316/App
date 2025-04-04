import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  static Future<String> sendMessage(String userInput) async {
    final apiKey = dotenv.env['OPENROUTER_API_KEY']; // 👈 This gets it from .env

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('API key not found. Did you set it in .env file?');
    }

    final response = await http.post(
      Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "openai/gpt-3.5-turbo", // or another supported model
        "messages": [
          {"role": "user", "content": userInput}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      print(response.body); // for debugging
      throw Exception('Failed to get response from OpenRouter API');
    }
  }
}

