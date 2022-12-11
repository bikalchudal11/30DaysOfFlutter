// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:eight_hrs_flutter/models/catalog.dart';
import 'package:eight_hrs_flutter/widgets/drawer.dart';
import 'package:eight_hrs_flutter/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = 'Codepur';

  @override
  void initState() {
    super.initState();
    //function that is going to load data from catalogue.json file
    loadData();
  }

  loadData() async {
    //line 28 returns future so we use await keyword
    final catalougeJson =
        await rootBundle.loadString('assets/files/catalouge.json');
    // print(catalougeJson);
    final decodeData = jsonDecode(catalougeJson);
    // print(decodeData);
    //We only need products data so
    var productsData = decodeData['products'];
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    //to print the items for given index times using List.generate
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[0],
            );
          },
          itemCount: dummyList.length,
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
