// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_application_4/111/list_data.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter_application_4/111/product_controller.dart';
// import 'package:get/get.dart';
// // import 'package:flutter_application_4/addproduct_screen.dart';
// // import 'package:flutter_application_4/111/cart_controllers.dart';
// import 'dart:ffi';

// // import 'package:flutter_application_4/111/firestose_db.dart';
// // import 'package:flutter_application_4/111/list_data.dart';

// import 'cart_controllers.dart';
// import 'list_data.dart';

// class ProductController extends GetxController {
//   final products =<Product>[].obs;

//   @override
//   void onInit(){
//     products.bindStream(FirestoreDB().getAllProducts());
//     super.onInit();
//   } 
//   }
// class FirestoreDB{
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//  String collec ='product2';

//   Stream<List<Product>> getAllProducts(){
//     return _firebaseFirestore.collection("products")
//                         .doc('aLsQEGuWgm2kGFThwJOv')
//                         .collection('$collec')
//                         .snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
//     });
//   }

// }





// class CatalogProducts2 extends StatelessWidget {
//   final productController = Get.put(ProductController());

//   CatalogProducts2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Flexible(
//           child: ListView.builder(
//               itemCount: productController.products.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return CatalogProductsCard(index: index);
//               })),
//     );
//   }
// }

// class CatalogProductsCard extends StatelessWidget {
//   final cartController = Get.put(CartController());
//   final ProductController productController = Get.find();
//   final int index;
//   CatalogProductsCard({
//     Key? key,
//     required this.index,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 80.0,
//           backgroundImage: NetworkImage(
//             productController.products[index].imageUrl,
//           ),
//         ),
//         title: Text(
//           productController.products[index].name,
//           style: TextStyle(fontSize: 30),
//         ),
//         subtitle: Text(
//             'ราคา ' + ' ${productController.products[index].price} ' + ' บาท'),
//         minLeadingWidth: 20,
//         onTap: () {
//           cartController.addProduct(productController.products[index]);
//         },
//       ),
//     );
//   }
// }
