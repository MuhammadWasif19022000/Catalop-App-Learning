import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/model/cart.dart';
import 'package:catalog_app/model/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isincart = (_cart.items.contains(catalog) || false);
    return ElevatedButton(
      onPressed: () {
        if (!isincart) {
          // isincart = isincart.toggle();
          // final _catalog = CatalogModel();
          AddMutation(catalog);
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          // // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isincart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
