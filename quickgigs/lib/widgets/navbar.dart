import 'package:flutter/material.dart';
import 'package:quickgigs/util/global.dart';

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
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.post_add_rounded),
            title: Text('Post'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Search'),
            onTap: () => null,
          ),

        ],
      ),
    );
  }
}