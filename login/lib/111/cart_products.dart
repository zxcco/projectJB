import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/111/cart_controllers.dart';
import 'package:login/111/list_data.dart';
  
class CartProducts1 extends StatelessWidget {
  final CartController1 controller = Get.put(CartController1());

  CartProducts1({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 560,
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
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            product.imageUrl,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(product.name),
        ),
        IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: Icon(
              Icons.remove_circle,
            )),
        Text('${quantity}'),
         IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: Icon(
              Icons.add_circle,
            )),
      ]),
    );
  }
}
