import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({Key? key}) : super(key: key);

  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlay = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (_isPlay == false) {
                _controller.forward();
                _isPlay = true;
              } else {
                _controller.reverse();
                _isPlay = false;
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _controller,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
