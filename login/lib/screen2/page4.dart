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

class _page4State extends State<page4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> messageBB = [];
  List<String> messageAA = [];

  String dateNow(String formattedDate) {
    return formattedDate.split('-')[0] +
        "-" +
        formattedDate.split('-')[1] +
        "-" +
        (int.parse(formattedDate.split('-')[2]) - 1).toString();
  }

  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

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
                            // if (dateNow(formattedDate) ==
                            //     snapshot1.data!.docs[lastIndex]["date"]) {
                            //   sendEmail(message, messageNaYai);
                            // }
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
                            // sendEmail(messageAA, messageBB);
                            // print(dateNow(formattedDate) + "22222");
                            // print(snapshot.data!.docs[lastIndex]["date"] +
                            //     "111111");
                            if (dateNow(formattedDate) ==
                                snapshot.data!.docs[lastIndex]["date"]) {
                              sendEmail(messageAA, messageBB);
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
            )
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

sendEmail(List<String> message, List<String> messageNaYai) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final service_id = "service_lqhozk2";
  final template_id = "template_5ii629m";
  final user_id = "fxJn7y0PvmfTrrM5F";
  String to_email = "netiphong234567@gmail.com";
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
          "messageNaYai": messageNaYai.join("\n")
        }
      }));

  print(respond.body);
}
