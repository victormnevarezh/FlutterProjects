import 'package:asoiaf_wiki/screen/HouseDetailPage.dart';
import 'package:asoiaf_wiki/services/HouseServices.dart';
import 'package:asoiaf_wiki/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:asoiaf_wiki/util/global.dart';

class HousePage extends StatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {

  HouseServices houseServices = HouseServices();
  bool cargando = true;

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
           future: houseServices.getHouses(),
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
                       return card(
                         title: snapshot.data[index].name,
                         height: 50,
                         width: 100,

                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HouseDetailPage(
                                        selectedHouse: snapshot.data[index],
                                      )
                                    )
                                  );
                            },
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
