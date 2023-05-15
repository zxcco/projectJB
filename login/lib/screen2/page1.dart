import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login/views/addproduct_screen.dart';
import 'package:login/views/product_image_picker.dart';
import '../model/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  // final Storage storage =Storage();
  final firebaseInstance = FirebaseFirestore.instance;
  Future<void> showMyDialogEorer(BuildContext context, String id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: Text('ต้องการลบหรือไม่'),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Text('ปิด'),
                ),
                TextButton(
                  onPressed: () async {
                    _delete(id);
                    Navigator.of(context).pop();
                  },
                  child: Text('ยืนยัน'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }
    Future<void> updateProduct(File image) async {
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
        await _products
            .doc(documentSnapshot!.id)
            .update({'imageUrl': imageUrl});

        print("Firebase response1111 $response");
        // CommanDialog.hideLoading();
        Get.back();
      } catch (exception) {
        // CommanDialog.hideLoading();
        print("Error Saving Data at firestore $exception");
      }
    }

    var _UpUserImageFile;
    void _pickedImage(File image) {
      _UpUserImageFile = image;
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "เเก้ไขเมนู",
                        style: TextStyle(
                          color: Colors.brown,
                          letterSpacing: 1,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'ชื่อเมนู'),
                  ),
                  TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: _priceController,
                    decoration: const InputDecoration(
                      labelText: 'ราคา',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // profile_pic(),
                  ProductImagePicker(_pickedImage),

                  ElevatedButton(
                    child: Text(
                      'เเก้ไข',
                      style: TextStyle(fontFamily: "Schyler"),
                    ),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final int? price = int.tryParse(_priceController.text);
                      if (price != null) {
                        await _products
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "price": price});
                        _nameController.text = '';
                        _priceController.text = '';
                        if (_UpUserImageFile != null) {
                          updateProduct(_UpUserImageFile);
                        } else if (documentSnapshot['price'] == '' ||
                            documentSnapshot['price'] == null) {
                          updateProduct(_UpUserImageFile);
                        }
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('ลบเมนูสำเร็จ')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Center(child: Text('เพิ่มเมนู')),
        //   backgroundColor: Color.fromARGB(255, 97, 46, 13),
        // ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromARGB(255, 151, 95, 34),
                  Color.fromARGB(255, 131, 91, 38),
                  Color.fromARGB(255, 94, 59, 20)
                ])),

            child: StreamBuilder(
              stream: _products.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Card(
                        margin: const EdgeInsets.all(15),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(documentSnapshot['imageUrl']),
                            minRadius: 20,
                            maxRadius: 40,
                          ),
                          title: Text(documentSnapshot['name']),
                          subtitle: Text(documentSnapshot['price'].toString()),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _update(documentSnapshot)),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => showMyDialogEorer(
                                        context, documentSnapshot.id)
                                    // _delete(documentSnapshot.id)
                                    ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
// Add new product
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductSreen(),
            ),
          ),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
