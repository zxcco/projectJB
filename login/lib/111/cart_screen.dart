import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/111/cart_controllers.dart';
import 'package:login/111/cart_total.dart';
import 'package:intl/intl.dart';
import 'package:login/111/list_data.dart';

import '../pdf/report.dart';
import 'cart_products_save.dart';

class CartScreen extends StatelessWidget {
  final CartController1 controller = Get.find();
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//โชว์สลิป
    final CartController1 controller = Get.put(CartController1());
    CollectionReference _saveProduct =
        FirebaseFirestore.instance.collection("saveProduct");
    int price123 = 0;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    TextEditingController _price_changeController = TextEditingController();
    TextEditingController _email_changeController = TextEditingController();
    TextEditingController _phone_changeController = TextEditingController();

    Future<void> showMyDialog1231(BuildContext context) async {
      DocumentSnapshot docGet = await FirebaseFirestore.instance
          .collection('Userprofile')
          .doc(_email_changeController.text)
          .get();
      Object? data = docGet.data();
      String name = docGet.get('Name');
      String Phone = docGet.get('Phone');
      String monny = docGet.get('monny');
      String Lastname = docGet.get('Lastname');
      int one = int.parse(monny);
      int two = int.parse(controller.total);
      int tree = one - two;
      double monny1 = double.parse(monny);
      var text_price1 = double.parse(controller.total);
      if (monny1 >= text_price1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('คุณ' + ' $name' + ' $Lastname'),
              content: Text('ยอดเงินในบัญชี ' +
                  '$one' +
                  " บาท" +
                  '\n' +
                  "จำนวนเงิน " +
                  controller.total +
                  " บาท" +
                  '\n' +
                  "ยอดเงินคงเหลือ " +
                  '$tree' +
                  " บาท"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final aaa =
                        FirebaseFirestore.instance.collection("Userprofile");
                    final bbbb = aaa.doc(_email_changeController.text);
                    bbbb.update({"monny": tree.toString()});
                    Navigator.of(context).pop();
                    _email_changeController.text = '';
                    _price_changeController.text = '';
                    _phone_changeController.text = '';
                  },
                  child: Text('ปิด'),
                ),
              ],
            );
          },
        );
      } else {}
    }

    sss() async {
      DocumentSnapshot docGet = await FirebaseFirestore.instance
          .collection('Userprofile')
          .doc(_email_changeController.text)
          .get();
      Object? data = docGet.data();
      String name = docGet.get('Name');
      String Phone = docGet.get('Phone');
      String monny = docGet.get('monny');
      String Lastname = docGet.get('Lastname');
      int one = int.parse(monny);
      int two = int.parse(controller.total);
      int tree = one - two;

      Future<void> showMyDialog() => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('คุณ' + ' $name' + ' $Lastname'),
                content: Text('ยอดเงินในบัญชี ' +
                    '$one' +
                    " บาท" +
                    '\n' +
                    "จำนวนเงิน " +
                    controller.total +
                    " บาท" +
                    '\n' +
                    "ยอดเงินคงเหลือ " +
                    '$tree' +
                    " บาท"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      final aaa =
                          FirebaseFirestore.instance.collection("Userprofile");
                      final bbbb = aaa.doc(_email_changeController.text);
                      bbbb.update({"monny": tree.toString()});
                      Navigator.of(context).pop();
                      _email_changeController.text = '';
                      _price_changeController.text = '';
                    },
                    child: Text('ปิด'),
                  ),
                ],
              );
            },
          );
    }

    Future showMyDialogMomonNy(
            int one, int tree, String name, String Lastname) =>
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('ยอดเงินในบัญชีไม่พอ '),
              content: Text(' คุณ' +
                  ' $name' +
                  ' $Lastname' +
                  "\n" +
                  " ยอดเงินในบัญชี " +
                  one.toString() +
                  " บาท" +
                  "\n" +
                  " ขาดอีก " +
                  tree.toString() +
                  " บาท"),
              actions: [
                TextButton(
                  onPressed: () async {
                    // final aaa =
                    //     FirebaseFirestore.instance.collection("Userprofile");
                    // final bbbb = aaa.doc(_email_changeController.text);
                    // bbbb.update({"monny": tree.toString()});
                    Navigator.of(context).pop();
                    // _email_changeController.text = '';
                    // _price_changeController.text = '';
                    // _phone_changeController.text = '';
                  },
                  child: Text('ปิด'),
                ),
              ],
            );
          },
        );

    Future showMyDialog123(int one, int tree, String name, String Lastname) =>
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('คุณ' + ' $name' + ' $Lastname'),
                  content: Text('ยอดเงินในบัญชี ' +
                      '$one' +
                      " บาท" +
                      '\n' +
                      "จำนวนเงิน " +
                      controller.total +
                      " บาท" +
                      '\n' +
                      "ยอดเงินคงเหลือ " +
                      '$tree' +
                      " บาท"),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        if (tree >= 0) {
                          final aaa = FirebaseFirestore.instance
                              .collection("Userprofile");
                          final bbbb = aaa.doc(_email_changeController.text);
                          bbbb.update({"monny": tree.toString()});
                          Navigator.of(context).pop();
                          _email_changeController.text = '';
                          _price_changeController.text = '';
                          _phone_changeController.text = '';
                          controller.clearProduct();
                        } else {
                          Navigator.of(context).pop();
                          showMyDialogMomonNy(one, tree, name, Lastname);
                        }
                      },
                      child: Text('ปิด'),
                    ),
                  ],
                ));

    Future _onDialogShowingMember() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'สำหรับลูกค้าสมาชิก',
                style: TextStyle(fontFamily: "Schyler"),
              ),
              content: SingleChildScrollView(
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _email_changeController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue.shade600,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red.shade600,
                              width: 2,
                            ),
                          ),
                          // errorText: _validatePrice ? 'กรุณากรอกจำนวนเงินให้ถูกต้อง' : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // TextField(
                      //   keyboardType:
                      //       TextInputType.numberWithOptions(decimal: true),
                      //   controller: _phone_changeController,
                      //   decoration: InputDecoration(
                      //     labelText: 'เบอร์โทร',
                      //     hintText: 'เบอร์โทร',
                      //     prefixIcon: Icon(Icons.attach_money),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.grey.shade400,
                      //         width: 1,
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.blue.shade600,
                      //         width: 2,
                      //       ),
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide(
                      //         color: Colors.red.shade600,
                      //         width: 2,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    DocumentSnapshot docGet = await FirebaseFirestore.instance
                        .collection('Userprofile')
                        .doc(_email_changeController.text)
                        .get();
                    Object? data = docGet.data();
                    String name = docGet.get('Name');
                    String Phone = docGet.get('Phone');
                    String monny = docGet.get('monny');
                    String Lastname = docGet.get('Lastname');
                    int one = int.parse(monny);
                    int two = int.parse(controller.total);
                    int tree = one - two;
                    int price123 = 0;
                    double monny1 = double.parse(monny);
                    var text_price1 = int.parse(controller.total);
                    if (monny1 >= text_price1) {
                      var text_price1 = int.parse(controller.total);
                      final snackBar = SnackBar(
                        content: Text('คิดเงินสำเร็จ'),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      late List<Product> productName = [];
                      // var a;
                      // for (int i = 0; i < controller.products().length; i++) {
                      //   a = _saveProduct.where((productName) =>
                      //       productName = controller.productName[i]);
                      // }
                      // print(a);
                      // DocumentSnapshot docGet = await FirebaseFirestore.instance
                      //     .collection('saveProduct')
                      //     .doc("2023-04-23")
                      //     .get();

                      for (int i = 0; i < controller.products().length; i++) {
                        // _saveProduct
                        //     .doc(formattedDate)
                        //     .collection(controller.productName[i])
                        //     .doc("info")
                        //     .set({
                        //   "Name": controller.productName[i],
                        //   "price": controller.productSubtotal[i],
                        //   "number": controller.products().values.toList()[i]
                        // });
                        final String formattedDate =
                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                        DocumentSnapshot snapshot = await FirebaseFirestore
                            .instance
                            .collection('saveProduct')
                            .doc(formattedDate)
                            .collection('info')
                            .doc(controller.productName[i])
                            .get();
                        if (snapshot.exists) {
                          if (snapshot.get('Name') ==
                              controller.productName[i]) {
                            _saveProduct
                                .doc(formattedDate)
                                .collection("info")
                                .doc(controller.productName[i])
                                .set({
                              "Name": controller.productName[i],
                              "price": controller.productSubtotal[i] +
                                  snapshot.get('price'),
                              "number":
                                  controller.products().values.toList()[i] +
                                      snapshot.get('number'),
                              "date": formattedDate
                            });
                          }
                        } else {
                          _saveProduct
                              .doc(formattedDate)
                              .collection("info")
                              .doc(controller.productName[i])
                              .set({
                            "Name": controller.productName[i],
                            "price": controller.productSubtotal[i],
                            "number": controller.products().values.toList()[i],
                            "date": formattedDate
                          });
                        }
                      }

                      Navigator.of(context).pop();
                    } else {
                      final snackBar = SnackBar(
                        content: Text('จำนวนเงินไม่พอ'),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    Navigator.of(context).pop();
                    showMyDialog123(one, tree, name, Lastname);

                    price123 = 0;
                  },
                  child: const Text("คำนวน"),
                ),
              ],
            ));

    Future _onDialogShowing() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'ยอดทั้งหมด ${controller.total}',
                style: TextStyle(fontFamily: "Schyler"),
              ),
              content: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      controller: _price_changeController,
                      decoration: InputDecoration(
                        labelText: 'จำนวนเงินจากลูกค้า',
                        hintText: 'กรุณากรอกจำนวนเงิน',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue.shade600,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade600,
                            width: 2,
                          ),
                        ),
                        // errorText: _validatePrice ? 'กรุณากรอกจำนวนเงินให้ถูกต้อง' : null,
                      ),
                    ),
                    // Text('ยอดทั้งหมด ${controller.total} บาท'),
                    // Text('เงินทอน'+'$tatal_price'+ 'บาท'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    int price123 = 0;
                    final int? price =
                        int.tryParse(_price_changeController.text);
                    var text_price1 = int.parse(controller.total);
                    if (price! >= text_price1) {
                      var text_price1 = int.parse(controller.total);
                      price123 = price - text_price1;
                      final snackBar = SnackBar(
                        content: Text('ทอนเงิน $price123 บาท'),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      late List<Product> productName = [];
                      // var a;
                      // for (int i = 0; i < controller.products().length; i++) {
                      //   a = _saveProduct.where((productName) =>
                      //       productName = controller.productName[i]);
                      // }
                      // print(a);
                      // DocumentSnapshot docGet = await FirebaseFirestore.instance
                      //     .collection('saveProduct')
                      //     .doc("2023-04-23")
                      //     .get();

                      for (int i = 0; i < controller.products().length; i++) {
                        // _saveProduct
                        //     .doc(formattedDate)
                        //     .collection(controller.productName[i])
                        //     .doc("info")
                        //     .set({
                        //   "Name": controller.productName[i],
                        //   "price": controller.productSubtotal[i],
                        //   "number": controller.products().values.toList()[i]
                        // });
                        final String formattedDate =
                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                        DocumentSnapshot snapshot = await FirebaseFirestore
                            .instance
                            .collection('saveProduct')
                            .doc(formattedDate)
                            .collection('info')
                            .doc(controller.productName[i])
                            .get();
                        if (snapshot.exists) {
                          if (snapshot.get('Name') ==
                              controller.productName[i]) {
                            _saveProduct
                                .doc(formattedDate)
                                .collection("info")
                                .doc(controller.productName[i])
                                .set({
                              "Name": controller.productName[i],
                              "price": controller.productSubtotal[i] +
                                  snapshot.get('price'),
                              "number":
                                  controller.products().values.toList()[i] +
                                      snapshot.get('number'),
                              "date": formattedDate
                            });
                          }
                        } else {
                          _saveProduct
                              .doc(formattedDate)
                              .collection("info")
                              .doc(controller.productName[i])
                              .set({
                            "Name": controller.productName[i],
                            "price": controller.productSubtotal[i],
                            "number": controller.products().values.toList()[i],
                            "date": formattedDate
                          });
                        }
                      }

                      controller.clearProduct();

                      Navigator.of(context).pop();
                    } else {
                      final snackBar = SnackBar(
                        content: Text('จำนวนเงินไม่พอ'),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    Navigator.of(context).pop();
                    price123 = 0;
                  },
                  child: const Text("คำนวน"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _onDialogShowingMember();
                  },
                  child: const Text("สำหรับลูกค้าสมาชิก"),
                )
              ],
            ));

    Widget elevatedButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.brown),
            onPressed: () => Get.to(() => Reportt()),
            child: Icon(
              Icons.receipt,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.brown),
            onPressed: () {
              _onDialogShowing();
              SnackBar mySnackbar = SnackBar(content: Text("$price123"));
            },
            child: const Icon(
              Icons.price_change,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ตะกร้า"),
        backgroundColor: Color.fromARGB(255, 151, 95, 34),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Text('JIDDY ROASTERS COFFEE SHOP',
                  style: TextStyle(fontFamily: "Schyler")),
              Text('Phone 0814696645.',
                  style: TextStyle(fontFamily: "Schyler")),
              SizedBox(
                height: 10,
              ),
              CartProductsSave1(),
              CartTotal1(),
              elevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
