import 'package:flutter/material.dart';
import 'package:pokedex/util/global.dart';
import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url = '';

  @override

  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async{

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: Global.colorPokedex,
      ),

      body: Center(
        child: Text('Hello from Pokemon app')
      )

    );
  }
}