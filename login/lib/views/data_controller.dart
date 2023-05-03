
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
// import 'package:_flutterfirebase/comman_dailod.dart';

class DataController extends GetxController{
  final firebaseInstance = FirebaseFirestore.instance;
  // var userId;
  Future<void> addNewProduct(Map productdata, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(image);
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      // Comman.showLoading();
      int price = int.parse(productdata['p_price']);
      var response = await firebaseInstance.collection('products').add({
        'name': productdata['p_name'],
        'price': price,
        "upload_date": productdata['p_upload_date'],
        'imageUrl': imageUrl,
        // 'user_Id': authController.userId,

      });
      print("Firebase response1111 $response");
      // CommanDialog.hideLoading();
      Get.back();
    } catch (exception) {
      // CommanDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
  }
  


}