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
            Text(selectedHouse!.name!)
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
                    child: SizedBox(
                      height: 50,
                      width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coat of Arms: ' + selectedHouse!.coatOfArms!,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                            style: TextStyle(
                            color: Global.colorJet,
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                            )
                          )
                        ],
                      ),
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
