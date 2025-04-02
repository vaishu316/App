import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  final VoidCallback onTap;
  const FloatingButton({Key? key, required this.onTap}) : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  double x = 300, y = 600; // Initial position

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            x += details.delta.dx;
            y += details.delta.dy;
          });
        },
        child: FloatingActionButton(
          onPressed: widget.onTap,
          backgroundColor: Color(0xFFFF8C0D), // Orange color
          child: Icon(Icons.smart_toy, color: Colors.white, size: 28), // AI Assistant Icon
        ),
      ),
    );
  }
}
