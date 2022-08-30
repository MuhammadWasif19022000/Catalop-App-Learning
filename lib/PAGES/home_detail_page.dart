import 'package:catalog_app/model/catalog.dart';
import 'package:catalog_app/widgets/home_widget/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
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
                arcType: VxArcType.CONVEX,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.color(Colors.grey).xl.make(),
                      10.heightBox,
                      "And fellow dwell time sad wassailers. Had ee by night and care though his but. Whateer one consecrate drugged fellow worse maidens or flow, him mammon earthly from mirth and drop in his made. Full happy night ofttimes partings scene they and. Riot mine soils him amiss lands vaunted parasites stalked revellers. That once nor whateer of satiety weary by."
                          .text
                          .color(Colors.grey)
                          .make()
                          .p16()
                    ],
                  ).p(context.isMobile ? 0 : 16),
                ),
              ))
            ],
          )),
    );
  }
}
