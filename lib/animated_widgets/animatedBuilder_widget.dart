import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Builder",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            child: const FlutterLogo(
              size: 100,
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
