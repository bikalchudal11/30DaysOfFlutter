import 'package:eight_hrs_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: 'Add to cart'.text.make())
                .wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        //removing safe from bottom
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text
                        .color(MyTheme.darkBluishColor)
                        .xl3
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Est aliquyam at est est magna ea dolore invidunt stet sit. Lorem at takimata ut magna takimata clita ea, voluptua sit invidunt diam dolor vero vero, voluptua ea sit duo diam dolor no voluptua kasd. Rebum et justo dolore ."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p8(),
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
