
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/111/catalog_products.dart';

import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: SafeArea(child: Column(children: [
        CatalogProducts(),
        
      ],)
      ),
      
    );
  }
}