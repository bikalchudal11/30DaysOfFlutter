// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_declarations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imgUrl =
        'https://images.news18.com/ibnlive/uploads/2022/01/267153613_635270220945415_6635835364397949857_n-1.jpg';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  // decoration: BoxDecoration(color: Colors.deepPurple.shade500),
                  accountName: Text('Hritik Roshan'),
                  accountEmail: Text('hrx@gmail.com'),
                  currentAccountPicture:
                      //To make image circular
                      CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.1,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                'Mail',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
