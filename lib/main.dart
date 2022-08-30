import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/PAGES/Login_page.dart';
import 'package:catalog_app/PAGES/cart_page.dart';
import 'package:catalog_app/PAGES/home_page.dart';
import 'package:catalog_app/core/store.dart';

import 'package:velocity_x/velocity_x.dart';

import 'PAGES/Login_page.dart';
import 'PAGES/cart_page.dart';
import 'PAGES/home_page.dart';
import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: Myapp()));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homeage(),
      themeMode: ThemeMode.dark,

      theme: MyTheme.lightTheme(context),

      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeroutes,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeroutes: (context) => Homeage(),
        MyRoutes.loginroutes: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
