import 'package:asoiaf_wiki/services/HouseServices.dart';
import 'package:asoiaf_wiki/widgets/card.dart';
import 'package:asoiaf_wiki/model/House.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';

class HouseDetailPage extends StatelessWidget {

    final House? selectedHouse;

    const HouseDetailPage({
    Key? key,
    this.selectedHouse
    }) : super(key: key);
    
    void runAlert(BuildContext context){
       Global.mensaje(context, 'You have opened houses, choose one to see the details', 'Houses!');
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
            Text('A Song of Ice and Fire - Wiki / ' + selectedHouse!.name!)
            ],
          ),
        ),

      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedHouse!.name!,
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
                          selectedHouse!.words!,
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
                          'Region: ' + selectedHouse!.region!,
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
                      children: [
                        Center(
                          child: Container(
                            width: 500,
                            child: Text(
                              'Coat of Arms: ' + selectedHouse!.coatOfArms!,
                              overflow: TextOverflow.clip,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                              maxLines: 5,
                              style: TextStyle(
                              color: Global.colorJet,
                              fontWeight: FontWeight.w400,
                              fontSize: 20
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),
          );
      })

      );
    }
}
