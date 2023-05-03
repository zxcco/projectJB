
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_4/111/list_data.dart';
// class FirestoreDB{
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//  String collec ='asdsad';
//   Stream<List<Product>> getAllProducts(){
//     return _firebaseFirestore.collection("products")
//                         .doc('WL7UPBqaUvut37dnGHoC')
//                         .collection('$collec')
//                         .snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
//     });
//   }

// }