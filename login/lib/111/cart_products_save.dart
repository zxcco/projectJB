import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/111/cart_controllers.dart';
import 'package:login/111/list_data.dart';

class CartProductsSave1 extends StatelessWidget {
  final CartController1 controller = Get.put(CartController1());

  CartProductsSave1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 470,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.products().keys.toList()[index],
                quantity: controller.products().values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController1 controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            product.name,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          color: Colors.amber,
          child: Row(
            children: [
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${quantity} เเก้ว  ',
                        style: TextStyle(fontFamily: "Schyler", fontSize: 18))
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('  ${controller.productSubtotal[index]} บาท',
                        style: TextStyle(fontFamily: "Schyler", fontSize: 18)),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
