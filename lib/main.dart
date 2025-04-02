import 'package:flutter/material.dart';
import 'ui/floating_button.dart';
import 'ui/assistant_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showAssistant = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            if (showAssistant) AssistantPanel(onClose: () => setState(() => showAssistant = false)),
            FloatingButton(onTap: () => setState(() => showAssistant = true)),
          ],
        ),
      ),
    );
  }
}
