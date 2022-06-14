import 'package:quickgigs/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/views/login_view.dart';
import 'package:quickgigs/views/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)
      ),
      home: LoginView()
    );
  }
}