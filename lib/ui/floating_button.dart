import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isListening; // Pass this from main to indicate listening state

  const FloatingButton({
    Key? key,
    required this.onTap,
    required this.isListening,
  }) : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton>
    with SingleTickerProviderStateMixin {
  double x = 300, y = 600;
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _glowAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  if (widget.isListening)
                    BoxShadow(
                      color: Colors.orange.withOpacity(_glowAnimation.value),
                      blurRadius: 25,
                      spreadRadius: 8,
                    ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: widget.onTap,
                backgroundColor: Color(0xFFFF9800),
                child: Icon(
                  widget.isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
