import 'package:asoiaf_wiki/screen/CharacterDetailPage.dart';
import 'package:asoiaf_wiki/services/CharacterServices.dart';
import 'package:animate_do/animate_do.dart';
import 'package:asoiaf_wiki/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {

  CharacterServices characterServices = CharacterServices();
  bool cargando = true;

  @override
  String getTitle(AsyncSnapshot snapshot, int index) {
    String titleFinal = '';

    if (snapshot.data[index].name.toString() != ''){
      titleFinal += snapshot.data[index].name;
    }
    if(snapshot.data[index].aliases.toString() != ''){
      titleFinal += ' "' + snapshot.data[index].aliases[0].toString() + '"';
    }
    return titleFinal;
  }

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


      body: FutureBuilder(
           future: characterServices.getCharacters(),
           builder: (BuildContext context, AsyncSnapshot snapshot){
              
             if(!snapshot.hasData){
               return Center(
                child: Text('Loading...'),
               );
             } 

             return Container(
               alignment: Alignment.center,
               child: SizedBox(
                 width: 400,
                 child: ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (BuildContext context, int index){
                       return FadeInDown(
                         child: card(
                           
                           title: getTitle(snapshot, index),
                           height: 50,
                           width: 100,
                       
                           onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CharacterDetailPage(
                                          selectedCharacter: snapshot.data[index],
                                        )
                                      )
                                    );
                              },
                         ),
                       );
                     }
                 ),
               ),
             );

             
           },
         ),
    );
  }
}
