import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../111/cart_controllers.dart';
import '../111/list_data.dart';

class Reportt extends StatefulWidget {
  // DocumentSnapshot docid;
  // CartProductsSave1 controller1;
  // Reportt({required this.controller1});

  @override
  State<Reportt> createState() => _ReporttState(
      // controller1: controller1,

      );
}

class _ReporttState extends State<Reportt> {
  // DocumentSnapshot docid;
  // CartProductsSave1 controller1;

  // _ReporttState(
  //     // {required this.controller}
  //     );
  final pdf = pw.Document();
  final CartController1 controller = Get.put(CartController1());
  late List<Product> productName = [];
  // late Product productName;
  var name1;
  var price;
  late List<int> number = [];
  void initState() {
    setState(() {
      print(controller.products().length);
      print(controller.productName.toString());
      for (int i = 0; i <= controller.products().length - 1; i++) {
        productName.add(Product(
            name: controller.productName[i],
            price: controller.productSubtotal[i],
            imageUrl: controller.productImg[i]));
        number.add(controller.products().values.toList()[i]);
        // print(controller.products().keys.toList()[i].name);
        // productName = controller.products().keys.toList()[i];
        //   price = controller.productSubtotal[i].toString();
        // print(productName[i].name);
        // print(productName[i].price);

        // print('$price');
      }
      // print(productName.toString() + "1123");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      canChangeOrientation: false,
      canDebug: false,
      build: (format) => generateDocument(
        format,
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(
        // pageMode: PdfPageMode.outlines
        );
    final CartController1 controller = Get.put(CartController1());
    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();
    final font3 = await PdfGoogleFonts.notoSansThaiRegular(); // ฟอนต์ภาษาไทย
    final font4 = await PdfGoogleFonts.notoSansThaiBold(); // ฟอนต์ภาษาไทย
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    DocumentSnapshot docGet = await FirebaseFirestore.instance
        .collection('profile')
        .doc(controller.email1)
        .get();
    Object? data = docGet.data();
    String name = docGet.get('Name');
    String lastName = docGet.get('Lastname');

    // final image = await imageFromAssetBundle('assets/r2.svg');

    // String? _logo = await rootBundle.loadString('assets/r2.svg');

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 100.0),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Column(children: [
                    pw.SizedBox(height: 10),
                    pw.Text(
                      'JIDDY ROASTERS COFFEE SHOP',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          '50 ',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        pw.Text(
                          ' ม',
                          style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                              font: font3),
                        ),
                        pw.Text(
                          '.4 ',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        pw.Text(
                          ' ต',
                          style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                              font: font3),
                        ),
                        pw.Text(
                          '.',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        pw.Text(
                          ' เวียง',
                          style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                              font: font3),
                        ),
                        pw.Text(
                          ' จ',
                          style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                              font: font3),
                        ),
                        pw.Text(
                          '.',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        pw.Text(
                          ' พะเยา',
                          style: pw.TextStyle(
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                              font: font3),
                        ),
                        pw.Text(
                          ' 56110',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        pw.Text(
                          ' เบอร์โทร ',
                          style: pw.TextStyle(fontSize: 15, font: font3),
                        ),
                        pw.Text(
                          '0814696645',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 20),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          ' พนักงาน ',
                          style: pw.TextStyle(fontSize: 15, font: font4),
                        ),
                        pw.Text(
                          ' $name ' + ' $lastName ',
                          style: pw.TextStyle(fontSize: 15, font: font3),
                        ),
                      ],
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          ' วันที่ ',
                          style: pw.TextStyle(fontSize: 15, font: font4),
                        ),
                        pw.Text(
                          ' $formattedDate ',
                          style: pw.TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ]),
                  pw.SizedBox(height: 20),
                  ...List.generate(productName.length, (index) {
                    return pw.Column(children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Container(
                                child: pw.Text(
                                    productName[index].name.toString())),
                            pw.Container(
                                child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                                pw.Container(
                                  width: 60,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Text(number[index].toString()),
                                        pw.Text(" เเก้ว ",
                                            style: pw.TextStyle(font: font3)),
                                      ]),
                                ),
                                pw.Container(
                                  width: 60,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Text(
                                            productName[index].price.toString(),
                                            style: pw.TextStyle()),
                                        pw.Text(" บาท",
                                            style: pw.TextStyle(font: font3)),
                                      ]),
                                ),
                              ],
                            ))

                            // pw.Text(number[index].toString()),
                          ]),
                    ]);
                  }),
                  pw.SizedBox(height: 80),
                  pw.Container(
                    height: 80,
                    padding: const pw.EdgeInsets.symmetric(horizontal: 75),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            'ยอดเงินทั้งหมด',
                            style: pw.TextStyle(
                                fontSize: 16,
                                fontWeight: pw.FontWeight.bold,
                                font: font4),
                          ),
                          pw.Text(
                            '${controller.total}',
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            'บาท',
                            style: pw.TextStyle(
                                fontSize: 16,
                                fontWeight: pw.FontWeight.bold,
                                font: font4),
                          )
                        ]),
                  ),
                ],
              ));
        },
      ),
    );
    return doc.save();
  }
}
