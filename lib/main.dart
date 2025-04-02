import 'package:flutter/material.dart';
import 'ui/floating_button.dart';
import 'ui/chat_window.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showChat = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF000000), // Black background
      ),
      home: Scaffold(
        body: Stack(
          children: [
            if (showChat) ChatWindow(onClose: () => setState(() => showChat = false)),
            FloatingButton(onTap: () => setState(() => showChat = true)),
          ],
        ),
      ),
    );
  }
}
