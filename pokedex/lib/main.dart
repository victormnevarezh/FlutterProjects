import 'package:flutter/material.dart';
import 'package:pokedex/util/global.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pokedex/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
      );
  }
}
