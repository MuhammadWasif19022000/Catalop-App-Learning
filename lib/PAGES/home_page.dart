import 'dart:ui';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/model/cart.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:catalog_app/model/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/home_widget/catalog_header.dart';
import 'package:catalog_app/widgets/home_widget/catalog_list.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/src/widgets/vxbuilder.dart';

// import 'package:velocity_x/velocity_x.dart';

class Homeage extends StatefulWidget {
  @override
  _HomeageState createState() => _HomeageState();
}

class _HomeageState extends State<Homeage> {
  final int days = 30;

  final String name = "Wasif";
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  // @override
  // void initState() {
  //   super.initState();
  //   loadData();
  // }

  // loadData() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   final catalogJson =
  //       await rootBundle.loadString("assets/files/catalog.json");
  //   final decodedData = jsonDecode(catalogJson);
  //   var productsData = decodedData["products"];
  //   CatalogModel.items = List.from(productsData)
  //       .map<Item>((item) => Item.fromMap(item))
  //       .toList();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ).badge(
          color: Vx.gray200,
          size: 22,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
 

//  appBar: AppBar(
//         title: Text("Catalog App"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//           ),
//           itemBuilder: (context, index) {
//             final Item = CatalogModel.items[index];
//             return Card(
//                 clipBehavior: Clip.antiAlias,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: GridTile(
//                   header: Container(
//                     child: Text(
//                       Item.name,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   child: Image.network(Item.image),
//                   footer: Container(
//                     child: Text(
//                       Item.price.toString(),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ));
//           },
//           itemCount: CatalogModel.items.length,
//         ),
//         // child: ListView.builder(
//         //   // itemCount: CatalogModel.items.length,
//         //   itemCount: CatalogModel.items.length,
//         //   itemBuilder: (context, index) {
//         //     return ItemWidget(
//         //       item: CatalogModel.items[index],
//         //     );
//         //   },
//         // ),
//       ),
//       drawer: MyDrawer(),
