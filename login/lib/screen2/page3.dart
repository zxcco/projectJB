import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/screen2/page6.dart';

import '../model/user.dart';

class page3 extends StatefulWidget {
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _profilecollection =
      FirebaseFirestore.instance.collection("Userprofile");
  TextEditingController _email_changeController = TextEditingController();
  // TextEditingController _Phone_changeController = TextEditingController();
  TextEditingController _price_changeController = TextEditingController();

  Future<void> showMyDialog(BuildContext context) async {
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
    int two = int.parse(_price_changeController.text);
    int tree = one + two;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('คุณ' + ' $name' + ' $Lastname'),
          content: Text('ยอดเงินในบัญชี ' +
              '$one' +
              " บาท" +
              '\n' +
              "เติมเงินเพิ่ม " +
              '$two' +
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
                // _Phone_changeController.text = '';
              },
              child: Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialogEorer(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เบอร์โทรศัพท์ผิด'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialogNoUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('อีเมลนี้ไม่ใช่ลูกค้าในสมาชิก'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialogEmail(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ไม่มีอีเมลนี้'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: <Widget>[
          // background
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/01.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            child: ListView(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(700, 42, 100, 0),
                //   child: Text(
                //     "ยอดเงินในบัตร",
                //     style: TextStyle(
                //         fontSize: 20,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.fromLTRB(650, 150, 40, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.grey.shade100,
                            child: SingleChildScrollView(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _email_changeController,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        hintText: '',
                                        prefixIcon: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(Icons.email),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 8,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade100,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade100,
                                            width: 2,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.red.shade600,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'กรุณากรอกอีเมล';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // TextFormField(
                                    //   keyboardType:
                                    //       TextInputType.numberWithOptions(
                                    //     decimal: true,
                                    //   ),
                                    //   controller: _Phone_changeController,
                                    //   decoration: InputDecoration(
                                    //     labelText: 'เบอร์โทรศัพท์',
                                    //     hintText: '',
                                    //     prefixIcon: SizedBox(
                                    //       height: 20,
                                    //       width: 20,
                                    //       child: Icon(Icons.password_sharp),
                                    //     ),
                                    //     contentPadding: EdgeInsets.symmetric(
                                    //         vertical: 16, horizontal: 8),
                                    //     border: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       borderSide: BorderSide(
                                    //         color: Colors.grey.shade100,
                                    //         width: 1,
                                    //       ),
                                    //     ),
                                    //     focusedBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       borderSide: BorderSide(
                                    //         color: Colors.grey.shade100,
                                    //         width: 2,
                                    //       ),
                                    //     ),
                                    //     errorBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       borderSide: BorderSide(
                                    //         color: Colors.red.shade600,
                                    //         width: 2,
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   validator: (value) {
                                    //     if (value == null || value.isEmpty) {
                                    //       return 'เบอร์โทรศัพท์';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      controller: _price_changeController,
                                      decoration: InputDecoration(
                                        labelText: 'จำนวนเงิน',
                                        hintText: '',
                                        prefixIcon: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(Icons.attach_money),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 8),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade100,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade100,
                                            width: 2,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.red.shade600,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'กรุณากรอกจำนวนเงิน';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_email_changeController.text ==
                                                null ||
                                            _email_changeController.text ==
                                                ''.trim()) {
                                          showMyDialogEmail(context);
                                        } else {
                                          DocumentSnapshot docGet =
                                              await FirebaseFirestore.instance
                                                  .collection('Userprofile')
                                                  .doc(_email_changeController
                                                      .text)
                                                  .get();
                                          if (docGet == null) {
                                            showMyDialogNoUser(context);
                                          }
                                          // else {
                                          // try {
                                          //   Object? data = docGet.data();
                                          //   String Phone =
                                          //       docGet.get('Phone');
                                          //   String monny =
                                          //       docGet.get('monny');
                                          //   String Lastname =
                                          //       docGet.get('Lastname');
                                          //   if (_Phone_changeController
                                          //           .text ==
                                          //       Phone) {
                                          showMyDialog(context);
                                          //   } else {
                                          //     showMyDialogEorer(context);
                                          //   }
                                          // } catch (e) {
                                          //   showMyDialogEorer(context);
                                          // }
                                          // }
                                        }
                                      },
                                      child: Text(
                                        "เติมเงิน",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                )
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                //   child: Text(
                //     "คะเเนนสะสม",
                //     style: TextStyle(
                //         fontSize: 20,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
          ),
          // card

          Container(
            width: 600,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 170),

                  // Button Link
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      30,
                      0,
                      0,
                      0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   "โปรโมชั่น",
                              //   style: TextStyle(
                              //       fontSize: 26,
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),

                          GestureDetector(
                            child: Container(
                                width: 700,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/36.jpg"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // ElevatedButton(
                                            //   // elevation: 5.0,
                                            //   onPressed: () {
                                            //     Navigator.pushReplacement(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 page6()));
                                            //   },
                                            //   // padding: EdgeInsets.all(10.0),
                                            //   // shape: RoundedRectangleBorder(
                                            //   //   borderRadius:
                                            //   //       BorderRadius.circular(30.0),
                                            //   // ),
                                            //   // color: Color.fromARGB(
                                            //   //     255, 255, 255, 255),
                                            //   child: Text(
                                            //     'รายละเอียด',
                                            //     style: TextStyle(
                                            //       color:
                                            //           Color.fromARGB(255, 0, 0, 0),
                                            //       letterSpacing: 1,
                                            //       fontSize: 15.0,
                                            //       fontWeight: FontWeight.bold,
                                            //       fontFamily: 'OpenSans',
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                    ),
                                  ],
                                )),
                          ),
                          // Container(

                          //   decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                          //   width: 700,
                          //   height: 40,
                          //   alignment: Alignment.center,
                          //   child: Text('โปรโมชั่น 1  ',style: TextStyle(color: Colors.white,fontSize: 25),),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                                width: 700,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/35.jpg"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // ElevatedButton(
                                            //   // elevation: 5.0,
                                            //   onPressed: () {
                                            //     Navigator.pushReplacement(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 page6()));
                                            //   },
                                            //   // padding: EdgeInsets.all(10.0),
                                            //   // shape: RoundedRectangleBorder(
                                            //   //   borderRadius:
                                            //   //       BorderRadius.circular(30.0),
                                            //   // ),
                                            //   // color: Color.fromARGB(
                                            //   //     255, 255, 255, 255),
                                            //   child: Text(
                                            //     'รายละเอียด',
                                            //     style: TextStyle(
                                            //       color:
                                            //           Color.fromARGB(255, 0, 0, 0),
                                            //       letterSpacing: 1,
                                            //       fontSize: 15.0,
                                            //       fontWeight: FontWeight.bold,
                                            //       fontFamily: 'OpenSans',
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                                width: 700,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/37.png"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // ElevatedButton(
                                            //   // elevation: 5.0,
                                            //   onPressed: () {
                                            //     Navigator.pushReplacement(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 page6()));
                                            //   },
                                            //   // padding: EdgeInsets.all(10.0),
                                            //   // shape: RoundedRectangleBorder(
                                            //   //   borderRadius:
                                            //   //       BorderRadius.circular(30.0),
                                            //   // ),
                                            //   // color: Color.fromARGB(
                                            //   //     255, 255, 255, 255),
                                            //   child: Text(
                                            //     'รายละเอียด',
                                            //     style: TextStyle(
                                            //       color:
                                            //           Color.fromARGB(255, 0, 0, 0),
                                            //       letterSpacing: 1,
                                            //       fontSize: 15.0,
                                            //       fontWeight: FontWeight.bold,
                                            //       fontFamily: 'OpenSans',
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                                width: 700,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logo02.jpg"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // ElevatedButton(
                                            //   // elevation: 5.0,
                                            //   onPressed: () {
                                            //     Navigator.pushReplacement(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 page6()));
                                            //   },
                                            //   // padding: EdgeInsets.all(10.0),
                                            //   // shape: RoundedRectangleBorder(
                                            //   //   borderRadius:
                                            //   //       BorderRadius.circular(30.0),
                                            //   // ),
                                            //   // color: Color.fromARGB(
                                            //   //     255, 255, 255, 255),
                                            //   child: Text(
                                            //     'รายละเอียด',
                                            //     style: TextStyle(
                                            //       color:
                                            //           Color.fromARGB(255, 0, 0, 0),
                                            //       letterSpacing: 1,
                                            //       fontSize: 15.0,
                                            //       fontWeight: FontWeight.bold,
                                            //       fontFamily: 'OpenSans',
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Row(
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// Container(
//                             width: 700,
//                             padding: EdgeInsets.symmetric(vertical: 25.0),
//                             child: RaisedButton(
//                               elevation: 5.0,
//                               onPressed: () async {

//                               },
//                               padding: EdgeInsets.all(15.0),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                               ),
//                               color: Color.fromARGB(255, 51, 50, 50),
//                               child: Text(
//                                 'ล็อคอิน',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                   letterSpacing: 1,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'OpenSans',
//                                 ),
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => RegisterScreen()));
//                             },
// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';

// import '../api/firebase_api.dart';
// import '../widget/button_widget.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // static final String title = 'เพิ้มรูปภาพ';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // title: title,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: MainPage(),
//       );
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   UploadTask? task;
//   File? file;

//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? basename(file!.path) : 'No File Selected';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("เพิ่มรูปภาพ"),
//         centerTitle: true,
//          backgroundColor: Color.fromARGB(255, 97, 46, 13),
//       ),

//     );
//   }}

// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';

// import '../api/firebase_api.dart';
// import '../widget/button_widget.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // static final String title = 'เพิ้มรูปภาพ';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // title: title,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: MainPage(),
//       );
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   UploadTask? task;
//   File? file;

//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? basename(file!.path) : 'No File Selected';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("เพิ่มรูปภาพ"),
//         centerTitle: true,
//          backgroundColor: Color.fromARGB(255, 97, 46, 13),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(32),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ButtonWidget(
//                 text: 'Select File',
//                 icon: Icons.attach_file,
//                 onClicked: selectFile,
//               ),
//               SizedBox(height: 8),
//               Text(
//                 fileName,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 48),
//               ButtonWidget(
//                 text: 'Upload File',
//                 icon: Icons.cloud_upload_outlined,
//                 onClicked: uploadFile,
//               ),
//               SizedBox(height: 20),
//               task != null ? buildUploadStatus(task!) : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);

//     if (result == null) return;
//     final path = result.files.single.path!;

//     setState(() => file = File(path));
//   }

//   Future uploadFile() async {
//     if (file == null) return;

//     final fileName = basename(file!.path);
//     final destination = 'files/$fileName';

//     task = FirebaseApi.uploadFile(destination, file!);
//     setState(() {});

//     if (task == null) return;

//     final snapshot = await task!.whenComplete(() {});
//     final urlDownload = await snapshot.ref.getDownloadURL();

//     print('Download-Link: $urlDownload');
//   }

//   Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
//         stream: task.snapshotEvents,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final snap = snapshot.data!;
//             final progress = snap.bytesTransferred / snap.totalBytes;
//             final percentage = (progress * 100).toStringAsFixed(2);

//             return Text(
//               '$percentage %',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             );
//           } else {
//             return Container();
//           }
//         },
//       );
// }
