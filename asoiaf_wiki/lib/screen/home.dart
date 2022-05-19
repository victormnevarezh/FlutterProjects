import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';
import 'package:asoiaf_wiki/widgets/card.dart'
;

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
          const Icon(Icons.shield),
          const SizedBox(width: 10),
          const Text('A Song of Ice and Fire - Wiki')
          ],
        ),
      ),

      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: card(
                      title: 'Castles',
                      height: 50,
                      width: 300,
                    ),
                    ),

                                      Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: card(
                      title: 'Houses',
                      height: 50,
                      width: 300,
                    ),
                    ),

                                      Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: card(
                      title: 'Places',
                      height: 50,
                      width: 300,
                    ),
                    ),

                ],
              ),
            ),
          );
        }
        ),
    );
  }
}
