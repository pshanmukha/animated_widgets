import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
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
            child: AnimatedContainer(
              width: isSelected ? 200.0 : 100.0,
              height: isSelected ? 200.0 : 100.0,
              color: isSelected ? Colors.blueAccent : Colors.redAccent,
              alignment: isSelected ? Alignment.center : Alignment.center,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: isSelected ? 200 : 100,),
            )
          ),
        ),
      ),
    );
  }
}
