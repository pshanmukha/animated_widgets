import 'package:flutter/material.dart';

class TweenAnimationBuilderWidget extends StatefulWidget {
  const TweenAnimationBuilderWidget({Key? key}) : super(key: key);

  @override
  _TweenAnimationBuilderWidgetState createState() => _TweenAnimationBuilderWidgetState();
}

class _TweenAnimationBuilderWidgetState extends State<TweenAnimationBuilderWidget> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tween Animation Builder",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: IntTween(begin: 0, end: value),
                duration: Duration(seconds: 6),
                builder: (context, value, child) => Text(value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              SizedBox(height: 4,),
              ElevatedButton(onPressed: (){
                setState(() {
                  value = 100;
                });
              }, child: const Text("Press"))
            ],
          )
        ),
      ),
    );
  }
}
