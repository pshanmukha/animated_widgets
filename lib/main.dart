import 'package:flutter/material.dart';

import 'animated_widgets/animatedAlign_widget.dart';
import 'animated_widgets/animatedBuilder_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Widgets",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AnimatedAlignWidget()));
              },
              child: Text(
                "AnimatedAlign",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AnimatedBuilderWidget()));
              },
              child: Text(
                "AnimatedBuilder",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
