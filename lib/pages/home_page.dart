// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:eight_hrs_flutter/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:eight_hrs_flutter/models/catalog.dart';
import 'package:eight_hrs_flutter/widgets/themes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

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
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.darkBluishColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m8, //same like EdgeInsets.all()
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                //using expand to make the CircularProgressIndicator centered
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
