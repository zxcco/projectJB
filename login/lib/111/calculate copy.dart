// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';

import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/111/cart_controllers.dart';
import 'package:login/111/cart_products.dart';
import 'package:login/111/catalog_products%201.dart';
import 'cart_screen.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

import 'package:get/get.dart';

// import 'cart_products.dart';
import 'cart_screen.dart';
// import 'cart_total.dart';

class calculate1 extends StatefulWidget {
  @override
  _calculate1State createState() => _calculate1State(); //initstate
}

class _calculate1State extends State<calculate1> {
  @override
  void initState() {
    // sendEmail();
    super.initState();
  }

  // เเสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 630,
              width: 500,
              color: Color.fromARGB(255, 252, 252, 252),
              child: Column(
                children: [
                  CatalogProducts1(),
                ],
              )),
          Container(
            height: 630,
            width: 520,
            color: Color.fromARGB(255, 221, 173, 111),
            child: Column(
              children: [
                CartProducts1(),
                ElevatedButton(
                  onPressed: () => Get.to(() => CartScreen()),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Color.fromARGB(255, 247, 247, 247),
                  ),
                )
                // CartTotal(),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
