import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/views/cart_view.dart';
import 'package:flutter_boiler_plate/views/catalog_view.dart';
import 'package:flutter_boiler_plate/views/order_view.dart';
import 'package:provider/provider.dart';

import 'controllers/cart_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => CatalogController(),
        //   child: ShopCatalog(),
        // ),
        ChangeNotifierProvider(
          create: (_) => CartController(),
          child: ShopCart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Boiler Plate',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ShopCatalog(),
          '/cart': (context) => ShopCart(),
          '/order': (context) => ShopOrder(),
        },
      ),
    );
  }
}