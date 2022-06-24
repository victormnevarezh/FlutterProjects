import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/widgets/appbar_drawer_widget.dart';
import 'package:quickgigs/widgets/textfield_widget.dart';
import 'package:quickgigs/widgets/button_widget.dart';
import 'package:quickgigs/widgets/navbar_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:animated_background/animated_background.dart';

import '../services/authentication_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with SingleTickerProviderStateMixin {
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

  final db = FirebaseFirestore.instance;
  var userEmail;
  var userAdmin;

  void deleteUser() {
    var currentUser = FirebaseAuth.instance.currentUser;
    var userToBeDeleted = currentUser!.email ?? "";

     db.collection("users").get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc['email'] == userToBeDeleted) {
          doc.reference.delete();
        }
      });
    });
  }

  void getUser() {
    var currentUser = FirebaseAuth.instance.currentUser;
    var userToBeFetched = currentUser!.email ?? "";

    db.collection("users").get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc['email'] == userToBeFetched) {
          userEmail = doc['email'];
          userAdmin = doc['admin'];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser!.email;
    final authService = Provider.of<AuthService>(context);

    return FadeIn(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBarDrawerWidget(),
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Builder(
            builder: (context) {
              getUser();
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                            child: Text(
                              'Email: ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 30,
                                color: Global.colorWhite
                                )
                            ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                            child: Text(
                              currentUser!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BreeSerif',
                                fontSize: 18,
                                color: Global.colorWhite
                                )
                            ),
                      ),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: ButtonWidget(
                            title: 'Delete my account',
                            width: 300,
                            height: 40,
                            otherColor: true,
                            hasColor: false,
                            colorButton: Global.colorWhite,
                            onPressed: () async {
                              deleteUser();
                              await authService.signOut();
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                          ),
                        ),

                    ],
                  ),
                ),
              );
            }
            ),
        ),
      )
      );
  }
}