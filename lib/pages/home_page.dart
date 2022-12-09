// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:eight_hrs_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'Codepur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
            minHeight: 70, maxHeight: 200, minWidth: 70, maxWidth: 200),
        color: Colors.green,
        child: Container(
          //height and width must be lies between the range of constraints otherwise the parent's constraints is applied.
          height: 50,
          width: 300,
          color: Colors.red,
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
