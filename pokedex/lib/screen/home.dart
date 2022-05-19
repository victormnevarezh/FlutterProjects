import 'package:flutter/material.dart';
import 'package:pokedex/util/global.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatelessWidget {
  @override
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