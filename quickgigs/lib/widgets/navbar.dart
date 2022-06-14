import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';
import 'package:quickgigs/views/home_view.dart';
import 'package:quickgigs/views/post_view.dart';
import 'package:quickgigs/views/search_view.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
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
            onTap: () => (
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => SearchView()
                ),
              )
            ),
          ),

        ],
      ),
    );
  }
}