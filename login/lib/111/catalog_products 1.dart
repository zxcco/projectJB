import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:login/111/cart_controllers.dart';
import 'package:login/111/list_data.dart';

class ProductController1 extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String collec = 'product1';

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection("products")
        // .doc('0KyKEM2oOfQSMUYCRAiW')
        // .collection('$collec')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}

class CatalogProducts1 extends StatelessWidget {
  final productController = Get.put(ProductController1());

  CatalogProducts1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CatalogProductsCard(index: index);
              })),
    );
  }
}

class CatalogProductsCard extends StatelessWidget {
  final cartController = Get.put(CartController1());
  final ProductController1 productController = Get.find();
  final int index;
  CatalogProductsCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      //  padding: const EdgeInsets.symmetric(
      //   horizontal: 20,
      //   vertical: 10,
      //  ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            productController.products[index].imageUrl,
          ),
          radius: 40,
        ),
        title: Text(
          productController.products[index].name,
          style: TextStyle(fontSize: 30),
        ),
        subtitle: Text(
            'ราคา ' + ' ${productController.products[index].price} ' + ' บาท',
            style: TextStyle(fontFamily: "Schyler")),
        //   radius:40,
        //   backgroundImage: NetworkImage(
        //     productController.products[index].imageUrl,
        //   ),
        // ),
        // SizedBox(width: 20,),

        // Expanded(child:
        //  Text(productController.products[index].name,
        // style: TextStyle(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 18,

        // ),),
        onTap: () {
          cartController.addProduct(productController.products[index]);
        },

        // ),
        // Expanded(
        //   child: Text('${productController.products[index].price}'),
        // ),
        //   IconButton(
        //   onPressed: () {
        //     cartController.addProduct(productController.products[index]);
        //   },
        //  icon:Icon(
        //   Icons.add_circle,
        //  ))
      ),
    );
  }
}
