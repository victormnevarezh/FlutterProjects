import 'package:asoiaf_wiki/util/global.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.colorHoney,
        foregroundColor: Global.colorJet,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.shield),
          SizedBox(width: 10),
          Text('A Song of Ice and Fire - Wiki')
        ],),
      ),

      body: Builder(
        builder: (context){
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  card(
                    width: 400,
                    height: 40,
                    hasColor: false,
                  )
                ],
              ),
            ),
          );
        })

    );
  }
}