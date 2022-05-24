import 'package:asoiaf_wiki/services/CharacterServices.dart';
import 'package:asoiaf_wiki/widgets/card.dart';
import 'package:asoiaf_wiki/model/Character.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';

class CharacterDetailPage extends StatelessWidget {

    final Character? selectedCharacter;

    const CharacterDetailPage({
    Key? key,
    this.selectedCharacter
    }) : super(key: key);

    @override
  String getName() {
    String titleFinal = '';

    if (selectedCharacter!.name!.toString() != ''){
      titleFinal += selectedCharacter!.name!;
    }
    if(selectedCharacter!.aliases![0].toString() != ''){
      titleFinal += ' "' + selectedCharacter!.aliases![0].toString() + '"';
    }

    return titleFinal;
  }

    @override
    Widget build(BuildContext context){
      return Scaffold(
          appBar: AppBar(
          backgroundColor: Global.colorHoney,
          foregroundColor: Global.colorJet,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Icon(Icons.shield),
            const SizedBox(width: 10),
            Text('A Song of Ice and Fire - Wiki / ' + getName())
            ],
          ),
        ),

      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: 500,
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getName(),
                            style: TextStyle(
                            color: Global.colorJet,
                            fontWeight: FontWeight.w400,
                            fontSize: 30   
                            )
                          )
                        ],
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Culture: ' + selectedCharacter!.culture!,
                            style: TextStyle(
                            color: Global.colorJet,
                            fontWeight: FontWeight.w400,
                            fontSize: 20   
                            )
                          )
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Born: ' + selectedCharacter!.born!,
                            style: TextStyle(
                            color: Global.colorJet,
                            fontWeight: FontWeight.w400,
                            fontSize: 20   
                            )
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            'Died: ' + selectedCharacter!.died!,
                            style: TextStyle(
                            color: Global.colorJet,
                            fontWeight: FontWeight.w400,
                            fontSize: 20   
                            )
                          )
                        ],
                      ),
                    ),




                  ],
                ),
              ),
            ),
          );
      })

      );
    }
}
