import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedModalBarrierWidget extends StatefulWidget {
  const AnimatedModalBarrierWidget({Key? key}) : super(key: key);

  @override
  _AnimatedModalBarrierWidgetState createState() => _AnimatedModalBarrierWidgetState();
}

class _AnimatedModalBarrierWidgetState extends State<AnimatedModalBarrierWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Widget _animatedModalBarrier;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 3),
    );
    ColorTween _colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5),
    );
    _colorAnimation = _colorTween.animate(_controller);
    _animatedModalBarrier = AnimatedModalBarrier(color: _colorAnimation, dismissible: true,);
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
          child: SizedBox(
            height: 100.0,
            width: 250.0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    _isSelected = true;
                  });
                  _controller.reset();
                  _controller.forward();
                  Future.delayed(const Duration(seconds: 3), (){
                    setState(() {
                      _isSelected = false;
                    });
                  });
                }, child: const Text("Press"),),
                if(_isSelected) _animatedModalBarrier,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
