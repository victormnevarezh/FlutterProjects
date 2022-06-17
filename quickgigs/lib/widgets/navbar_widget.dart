import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/views/home_view.dart';
import 'package:quickgigs/views/login_view.dart';
import 'package:quickgigs/views/post_view.dart';
import 'package:quickgigs/views/search_view.dart';
import '../services/authentication_service.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  String mailData() {
    var currentUser = FirebaseAuth.instance.currentUser;
    return currentUser!.email ?? "";
  }

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Account mail:', style: TextStyle(color: Global.colorWhite)),
            accountEmail: Text(mailData(), style: TextStyle(color: Global.colorWhite)),
            decoration: BoxDecoration(
              color: Global.colorBlack,
            ),
          ),

          ListTile(
            leading: Icon(Icons.home_rounded),
            title: Text('Home'),
            onTap: () => (
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => HomeView()
                ),
              )
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.post_add_rounded),
            title: Text('Post'),
            onTap: () => (
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => PostView()
                ),
              )
            ),
          ),

          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Search'),
            onTap: () => (
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => SearchView()
                ),
              )
            ),
          ),

          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('LogOut'),
            onTap: () async  {
              await authService.signOut();
            }
          ),
        ],
      ),
    );
  }
}
