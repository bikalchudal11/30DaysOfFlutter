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
      body: Center(
          child: Container(
              //verifies that context is a Stateless element by line 22
              child: Text(context.runtimeType.toString()))),
      drawer: MyDrawer(),
    );
  }
}
