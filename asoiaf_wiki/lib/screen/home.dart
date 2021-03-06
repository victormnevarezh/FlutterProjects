import 'package:animate_do/animate_do.dart';
import 'package:asoiaf_wiki/screen/HousePage.dart';
import 'package:asoiaf_wiki/screen/CharacterPage.dart';
import 'package:asoiaf_wiki/screen/BookPage.dart';
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

                  FadeInDown(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: card(
                        title: 'Characters',
                        height: 50,
                        width: 300,
                        onPressed: () {
                          Global.mensaje(context, 'You have opened characters, choose one to see the details', 'Characters!');
                           Navigator.push(
                             context, 
                             MaterialPageRoute(builder: (context) => CharacterPage()
                             ),
                            );
                        },
                      ),
                      ),
                  ),

                  FadeInDown(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: card(
                        title: 'Houses',
                        height: 50,
                        width: 300,
                        onPressed: () {
                          Global.mensaje(context, 'You have opened houses, choose one to see the details', 'Houses!');
                           Navigator.push(
                             context, 
                             MaterialPageRoute(builder: (context) => HousePage()
                             ),
                            );
                        },
                      ),
                      ),
                  ),

                  FadeInDown(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: card(
                        title: 'Books',
                        height: 50,
                        width: 300,
                        onPressed: () {
                          Global.mensaje(context, 'You have opened books, choose one to see the details', 'Books!');
                           Navigator.push(
                             context, 
                             MaterialPageRoute(builder: (context) => BookPage()
                             ),
                            );
                        },
                      ),
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
