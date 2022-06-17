import 'package:animated_background/animated_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/appbar_drawer_widget.dart';
import 'package:quickgigs/widgets/card_widget.dart';
import 'package:quickgigs/widgets/button_widget.dart';
import 'package:quickgigs/widgets/navbar_widget.dart';

class SearchView extends StatefulWidget {
  SearchView({ Key? key }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with SingleTickerProviderStateMixin {
  // Defining Particles for animation.
  ParticleOptions particles = const ParticleOptions(
    baseColor: Global.colorWhite,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  // Initial Selected Value
  List<String> _cities = ["Guadalajara", "CDMX", "Monterrey", "Querétaro", "León"];

  //Stream Builder
  Stream? filterStream;
  String? filterValue = '';

  //Function Update Stream
  void resetStreamWithNameFilter() {
  
    setState(() {
      
      if (filterValue!.isEmpty) {
        filterStream = FirebaseFirestore.instance.collection('gig').snapshots();
        return;
      }
      
      filterStream = FirebaseFirestore.instance.collection('gig').where('city', isEqualTo: filterValue).snapshots();
    });
  }

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    //We set the stream value for the first time
    resetStreamWithNameFilter();

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBarDrawerWidget(),

      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),     
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: ButtonWidget(
                    title: 'Reset filters',
                    width: 300,
                    height: 40,
                    otherColor: true,
                    hasColor: false,
                    colorButton: Global.colorWhite,
                    onPressed: () async {
                      filterValue = '';
                      resetStreamWithNameFilter();
                    },
                  ),
                ),

                Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
                        child:
                        DropdownButtonFormField2(
                          alignment: Alignment.center,
                          buttonDecoration: BoxDecoration(
                            border: Border.all(
                              color: Global.colorWhite,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Select your city',
                            style: TextStyle(
                              color: Global.colorWhite,
                              ),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Global.colorWhite,
                          ),
                          iconSize: 30,
                          buttonHeight: 50,
                          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Global.colorWhite,
                              width: 1,
                            ),
                            color: Global.colorBlack
                          ),
                          items: _cities
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        color: Global.colorWhite
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))
                                  .toList(),
                          validator: (value) {
                            if (value == null) {
                              Global.mensaje(context, 'You must select a city', 'Please select the city where you are willing to work in');
                              return;
                            }
                          },
                          onChanged: (value) {
                            filterValue = value.toString();
                            resetStreamWithNameFilter();
                          },
                          onSaved: (value) {
                            filterValue = value.toString();
                          },
                        ),
                      ),
      
                StreamBuilder(
                  //filterStream is the current Stream that depends on the function resetStreamWithNameFilter()
                  stream: filterStream!,
                  builder: (context, snapshot) {
      
                  try {
                    //The next line brings as docs a list made of the snapshot's items
                    List<QueryDocumentSnapshot> docs = (snapshot.data as QuerySnapshot).docs;
      
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
                        print(data['title'].toString());
                        return CardWidget(
                          title: data['title'].toString(),
                        );
                      }
                    );
                  } catch (e) {
                    return Text(
                      "Currently there are no gigs in that city :(",
                      style: TextStyle(color: Global.colorWhite)
                    );
                  }
                  }
                )
              ],
            ),
          ),
        
      )
    );
  }
}
