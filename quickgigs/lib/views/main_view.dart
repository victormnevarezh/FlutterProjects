import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/views/home_view.dart';
import 'package:quickgigs/widgets/appbar_drawer.dart';
import 'auth_page.dart';

  //Run: flutter run -d chrome --no-sound-null-safety
  //Run:  flutter run --no-sound-null-safety

class MainView extends StatefulWidget {
  MainView({ Key? key }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDrawerWidget(),

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          } else if (snapshot.hasData) {
            return HomeView();
          } else {
            return AuthPage();
          }
        }
      ),
    );
  }
}
