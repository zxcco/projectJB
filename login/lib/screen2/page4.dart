import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../111/cart_controllers.dart';

class page4 extends StatefulWidget {
  const page4({Key? key}) : super(key: key);

  @override
  State<page4> createState() => _page4State();
}

final CartController1 controller = Get.put(CartController1());

class _page4State extends State<page4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controller.login);
    check = true;
  }

  List<String> messageBB = [];
  List<String> messageAA = [];
  List<String> messageCC = [];

  String dateNow(String formattedDate) {
    return formattedDate.split('-')[0] +
        "-" +
        formattedDate.split('-')[1] +
        "-" +
        (int.parse(formattedDate.split('-')[2]) - 1).toString();
  }

  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 151, 95, 34),
              Color.fromARGB(255, 131, 91, 38),
              Color.fromARGB(255, 94, 59, 20)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset('assets/images/logo01.jpg')),
                ),
              ],
            ),
            Container(
              width: 0,
              height: 0,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("product(coffee)")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index)
                            // => Container(
                            //       child: Text(snapshot.data?.docs[index]["Name"]),
                            //     )
                            {
                          // sendEmail(snapshot.data);
                          final lastIndex = snapshot.data!.docs.length - 1;

                          if (lastIndex == snapshot.data!.docs.length - 1) {
                            messageB(snapshot.data);
                            messageBB = messageB(snapshot.data);
                          }
                          // print(messageNaYai.join("\n"));
                          // print(dateNow(formattedDate));
                          // print(snapshot.data?.docs[index]["Name"]);

                          //-----------------------------------------------------------------------------------------------------------------------------//
                          //------------------------------------------------------------------------------------------------------------------------------------------//
                        });
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Container(
              width: 0,
              height: 0,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("eventlog")
                    .doc(formattedDate)
                    .collection('info')
                    .orderBy('dateIn', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          //   print(snapshot.data!.docs.length);
                          //   print(snapshot.data!.docs[i]["Name"]);
                          //   print(snapshot.data!.docs[i]["dateIn"]);
                          // }

                          final lastIndex = snapshot.data!.docs.length - 1;
                          if (lastIndex == snapshot.data!.docs.length - 1) {
                            messageCC = messageC(snapshot.data);
                            // print(dateNow(formattedDate) + "22222");
                          }
                        });
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Container(
              width: 0,
              height: 0,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("saveProduct")
                    .doc(formattedDate)
                    .collection('info')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index)
                            // => Container(
                            //       child: Text(snapshot.data?.docs[index]["Name"]),
                            //     )
                            {
                          final lastIndex = snapshot.data!.docs.length - 1;
                          // messageA(snapshot.data);
                          // print(snapshot.data!.docs.length);
                          if (lastIndex == snapshot.data!.docs.length - 1) {
                            messageAA = messageA(snapshot.data);
                            // sendEmail(messageAA, messageBB, messageCC);
                            // print(dateNow(formattedDate) + "22222");
                            // print(snapshot.data!.docs[lastIndex]["date"] +
                            //     "111111");
                            if (check == true) {
                              // print(dateNow(formattedDate) + "33333");
                              if (dateNow(formattedDate) ==
                                  snapshot.data!.docs[lastIndex]["date"]) {
                                sendEmail(messageAA, messageBB);
                                sendEmail1(messageCC);
                                check = false;
                              }
                            } else {
                              // print(dateNow(formattedDate) + "33333");
                            }

                            // for (int i = 0; i < messageAA.length; i++) {
                            //   print(messageAA.length);
                            // }
                            // print(messageAA);
                          }
                          // for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          //   print(snapshot.data!.docs[i]["Name"]);
                          // }

                          // print(dateNow(formattedDate));
                        });
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> messageA(QuerySnapshot<Object?>? data) {
  double totalPrice = 0;
  List<String> message = ["\n"];
  for (int i = 0; i < data!.docs.length; i++) {
    message.add(data.docs[i]["Name"] +
        "  จำนวน " +
        data.docs[i]["number"].toString() +
        "  ราคา " +
        data.docs[i]["price"].toString() +
        "");
    totalPrice += data.docs[i]["price"];
    if (data.docs.length - 1 == i) {
      message.add("ยอดทั้งหมด " + totalPrice.toString() + "\n");
    }
    // print(data.docs[i]["Name"]);
  }

  return message;
}

List<String> messageB(QuerySnapshot<Object?>? data) {
  double totalPrice = 0;
  List<String> messageNaYai = ["\n"];
  for (int i = 0; i < data!.docs.length; i++) {
    messageNaYai.add("รหัสสินค้า : " +
        data.docs[i]["_ID"] +
        " = " +
        " ชื่อ : " +
        data.docs[i]["Name"] +
        "\nประเภท : " +
        data.docs[i]["type"] +
        "\nวันที่ผลิต : " +
        data.docs[i]["code"] +
        "\nวันหมดอายุ : " +
        data.docs[i]["code_1"] +
        "\nจำนวน : " +
        data.docs[i]["amount"] +
        "\nราคาต่อชิ้น : " +
        data.docs[i]["price"].toString() +
        "\nราคาทั้งหมด : " +
        data.docs[i]["priceall"].toString() +
        "\n");
  }
  return messageNaYai;
}

List<String> messageC(QuerySnapshot<Object?>? data) {
  double totalPrice = 0;
  List<String> messageNaYai = ["\n"];
  for (int i = 0; i < data!.docs.length; i++) {
    messageNaYai.add(" ชื่อ : " +
        data.docs[i]["Name"] +
        " " +
        data.docs[i]["LastName"] +
        " วันที่ : " +
        data.docs[i]["dateIn"] +
        " - " +
        data.docs[i]["dateOut"]);
  }
  return messageNaYai;
}

sendEmail1(List<String> messageCC) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final service_id = "service_z8wh4bg";
  final template_id = "template_skkx8tp";
  final user_id = "k-uqrvUma4j1xST3A";
  String to_email = "asdfgzxcvg1123@gmail.com";
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  var respond = await http.post(url,
      headers: {
        'origin': 'http:/localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        "service_id": service_id,
        "template_id": template_id,
        "user_id": user_id,
        "template_params": {
          "user_name": 'hello',
          "to_email": to_email,
          "messageCC": messageCC.join("\n"),
          "date": formattedDate,
        }
      }));
  print(respond.body);
}

sendEmail(List<String> message, List<String> messageNaYai) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final service_id = "service_z8wh4bg";
  final template_id = "template_3qyt2zj";
  final user_id = "k-uqrvUma4j1xST3A";
  String to_email = "JUt@gmail.com";
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  var respond = await http.post(url,
      headers: {
        'origin': 'http:/localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        "service_id": service_id,
        "template_id": template_id,
        "user_id": user_id,
        "template_params": {
          "user_name": 'hello',
          "to_email": to_email,
          "message": message.join("\n"),
          "messageNaYai": messageNaYai.join("\n"),
          "date": formattedDate,
        }
      }));
  print(respond.body);
}
