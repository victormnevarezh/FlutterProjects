import 'package:flutter/material.dart';
import 'package:flutter_forms/widgets/button_widget.dart';

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
      home: Scaffold(appBar: AppBar(
        title: const Text('Flutter Demo'),

      ),
      body: Center(
        child: ButtonWidget(
          title: 'Button',
          otherColor: true,
          hasColor: false,
          colorButton: Colors.orangeAccent,
          onPressed: () {
            print('Button Pressed');
          },
        ),
      ),
      ),
    );
  }
}