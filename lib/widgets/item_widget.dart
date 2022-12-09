// ignore_for_file: prefer_const_constructors

import 'package:eight_hrs_flutter/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  //since we are passing the items we can access its property
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          onTap: () {
            print('${item.name} pressed');
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          //first $ is for $ sign and second $ is for string interpolation
          trailing: Text(
            '\$${item.price.toString()}',
            //multiplies the text size by textScaleFactor
            textScaleFactor: 1.3,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
