import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({Key? key}) : super(key: key);

  @override
  _AnimatedDefaultTextStyleWidgetState createState() => _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: isSelected ? 90 : 60,
                  color: isSelected ? Colors.blueAccent : Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                child: const Text("Flutter"),
              ),
          ),
        ),
      ),
    );
  }
}
