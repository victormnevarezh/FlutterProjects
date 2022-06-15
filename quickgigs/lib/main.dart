import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:quickgigs/services/authentication_service.dart';
import 'package:quickgigs/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/views/login_view.dart';
import 'package:quickgigs/views/register_view.dart';
import 'package:quickgigs/wrapper.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuickGigs',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => LoginView(),
          '/register': (context) => RegisterView(),
        },
      ),
    );
  }
}