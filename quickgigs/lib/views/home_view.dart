import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/NavBar.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Global.colorWhite,
        foregroundColor: Global.colorBlack,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          SizedBox(width: 10),
          Image.asset('logo.png', fit: BoxFit.contain),
          Text(' QuickGigs', style: TextStyle(fontFamily: 'BreeSerif'))
          ],
        ),
      ),

      body: Builder(
        builder: (context) {
          return Center(
            
          );
        }
        ),
    );
  }
}
