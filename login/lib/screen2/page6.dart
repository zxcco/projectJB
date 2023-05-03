// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login/screen/login.dart';

import '../111/cart_controllers.dart';

class page6 extends StatefulWidget {
  @override
  _page6State createState() => _page6State();
}

class _page6State extends State<page6> {
  TextEditingController _pass_changeController = TextEditingController();
  TextEditingController _passNew_changeController = TextEditingController();
  TextEditingController _passNew1_changeController = TextEditingController();
  final CartController1 controller = Get.put(CartController1());
  CollectionReference _profilecollection =
      FirebaseFirestore.instance.collection("profile");
  String? name;
  String? pass;
  String? lastName;

  @override
  void initState() {
    super.initState();
    getData();
    print(controller.user1);
  }

  Future<void> getData() async {
    DocumentSnapshot docGet = await FirebaseFirestore.instance
        .collection('profile')
        .doc(controller.user1)
        .get();
    setState(() {
      name = docGet.get('Name');
      pass = docGet.get('Password');

      lastName = docGet.get('Lastname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            // Text(
            //   "การตั่งค่า",
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 175, 132, 76),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "บัญชี",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "เปลี่ยนรหัสผ่าน"),
            // buildAccountOptionRow(context, "ภาษา"),
            // buildAccountOptionRow(context, "ความเป็นส่วนตัวและความปลอดภัย"),
            // SizedBox(
            //   height: 40,
            // ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.volume_up_outlined,
            //       color: Color.fromARGB(255, 175, 132, 76),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(
            //       "การแจ้งเตือน",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            // buildNotificationOptionRow("ข่าวสารใหม่", true),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(250, 0, 250, 0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 243, 98, 98)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  child: const Text(
                    "ออกจากระบบ",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      controller: _pass_changeController,
                      decoration: InputDecoration(
                        labelText: 'รหัสผ่านเดิม',
                        hintText: '',
                        prefixIcon: SizedBox(
                          height: 20,
                          width: 20,
                          child: Icon(Icons.password_sharp),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
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
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'รหัสผ่านเดิม';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      controller: _passNew_changeController,
                      decoration: InputDecoration(
                        labelText: 'รหัสผ่านใหม่',
                        hintText: '',
                        prefixIcon: SizedBox(
                          height: 20,
                          width: 20,
                          child: Icon(Icons.password_sharp),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
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
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'รหัสผ่านใหม่';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      controller: _passNew1_changeController,
                      decoration: InputDecoration(
                        labelText: 'รหัสผ่านใหม่',
                        hintText: '',
                        prefixIcon: SizedBox(
                          height: 20,
                          width: 20,
                          child: Icon(Icons.password_sharp),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
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
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'รหัสผ่านใหม่';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("ปิด")),
                      TextButton(
                          onPressed: () {
                            if (_pass_changeController.text == pass) {
                              if (_passNew_changeController.text ==
                                  _passNew1_changeController.text) {
                                final bbbb =
                                    _profilecollection.doc(controller.user1);
                                bbbb.update({
                                  "Password": _passNew1_changeController.text
                                });
                              }
                            }
                            Navigator.of(context).pop();
                          },
                          child: Text("ยืนยัน")),
                    ],
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
