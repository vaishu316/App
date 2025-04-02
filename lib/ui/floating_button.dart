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
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: widget.onTap,
            backgroundColor: Color(0xFFFF9800), // Orange color for contrast
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.smart_toy, color: Colors.white, size: 28), // Robot icon for AI Assistant
          ),
        ),
      ),
    );
  }
}
