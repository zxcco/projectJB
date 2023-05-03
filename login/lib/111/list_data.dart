import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final int price;
  final String imageUrl;

  // final String status;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    // required this.status
  });
  static Product fromSnapshot(DocumentSnapshot data) {
    Product product = Product(
      name: data['name'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      // status: data['status']
    );
    return product;
  }
}

// static const List<Product> products = [
//       Product(
//         name: "app",
//         price: 21,
//         imageUrl:

//               'https://firebasestorage.googleapis.com/v0/b/new1-a6579.appspot.com/o/image?alt=media&token=1676207f-3fa6-4b79-911b-1a25a2553fde')
//     ,
//      Product(
//         name: "p",
//         price: 81,
//         imageUrl:

//               'https://firebasestorage.googleapis.com/v0/b/new1-a6579.appspot.com/o/image?alt=media&token=1676207f-3fa6-4b79-911b-1a25a2553fde')
//     , Product(
//         name: "s",
//         price: 10,
//         imageUrl:

//               'https://firebasestorage.googleapis.com/v0/b/new1-a6579.appspot.com/o/image?alt=media&token=1676207f-3fa6-4b79-911b-1a25a2553fde')

//     ];

