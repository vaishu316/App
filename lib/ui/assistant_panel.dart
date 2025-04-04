import 'package:flutter/material.dart';

class AssistantPanel extends StatelessWidget {
  final String response;

  const AssistantPanel({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.black,
      child: Center(
        child: Text(
          response.isEmpty ? "Ask me something!" : response,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
