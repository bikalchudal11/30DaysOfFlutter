// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names

import 'package:eight_hrs_flutter/models/catalog.dart';
import 'package:eight_hrs_flutter/widgets/drawer.dart';
import 'package:eight_hrs_flutter/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    await Future.delayed(Duration(seconds: 2));
    //line 28 returns future so we use await keyword
    final catalougeJson =
        await rootBundle.loadString('assets/files/catalouge.json');
    // print(catalougeJson);
    final decodeData = jsonDecode(catalougeJson);
    // print(decodeData);
    //We only need products data so
    var productsData = decodeData['products'];
    // print(productsData);
    //creating list of items to show in app
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //to print the items for given index times using List.generate
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //using conditional operator to check wether the items in the list is empty or not
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final Item = CatalogModel.items[index];
                  return Card(
                      //clips the card perfectly
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            Item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.network(Item.image),
                        footer: Container(
                          child: Text(
                            Item.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
