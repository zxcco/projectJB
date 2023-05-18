import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/views/data_controller.dart';
import 'package:login/views/product_image_picker.dart';

class ProductSreen extends StatefulWidget {
  const ProductSreen({Key? key}) : super(key: key);

  @override
  _ProductSreenState createState() => _ProductSreenState();
}

class _ProductSreenState extends State<ProductSreen> {
  DataController controller = Get.put(DataController());
  var _userImageFile;
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> productData = {
    "p_name": "",
    "p_price": "",
    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
  };

  addProduct() {
    if (_userImageFile == null) {
      Get.snackbar(
        "คำเตือน",
        "กรุณาใส่รูป",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Theme.of(context).errorColor,
        colorText: Colors.white,
      );
      return;
    }

    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");

      print('Data for new product $productData');
      controller.addNewProduct(productData, _userImageFile);
      Navigator.of(context).pop();
    }
  }

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('เพิ่มเมนู'),
      // ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "เพิ่มเมนู",
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
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'ชื่อเมนู',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรูณาใส่ชื่อเมนู';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_name'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'ราคา'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่ราคา';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_price'] = value!;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                ProductImagePicker(_pickedImage),
                ElevatedButton(
                  onPressed: () {
                    addProduct();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('เพิ่มเมนูสำเร็จ')));
                  },
                  child: Text('เพิ่มเมนู'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
