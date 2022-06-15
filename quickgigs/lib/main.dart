import 'package:firebase_core/firebase_core.dart';
import 'package:quickgigs/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/views/main_view.dart';
import 'package:quickgigs/views/register_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)
      ),
      home: MainView()
    );
  }
}