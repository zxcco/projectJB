import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../111/cart_controllers.dart';

class page3User extends StatefulWidget {
  const page3User({
    super.key,
  });
  @override
  State<page3User> createState() => _page3UserState();
}

class _page3UserState extends State<page3User> {
  final CartController1 controller = Get.put(CartController1());

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _profilecollection =
      FirebaseFirestore.instance.collection("Userprofile");
  String? name;
  String? pass;
  String? monny;
  String? lastName;

  @override
  void initState() {
    super.initState();
    getData();
    print(controller.user1);
  }

  Future<void> getData() async {
    DocumentSnapshot docGet = await FirebaseFirestore.instance
        .collection('Userprofile')
        .doc(controller.user1)
        .get();
    setState(() {
      name = docGet.get('Name');
      pass = docGet.get('Password');
      monny = docGet.get('monny');
      lastName = docGet.get('Lastname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        // background
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/images/01.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        // card
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 170),

                // Button Link
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    80,
                    0,
                    0,
                    0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
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
                                    image:
                                        AssetImage("assets/images/logo02.jpg"),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // name and money container
        Positioned(
          top: 42,
          right: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              0,
              20,
              50,
              0,
            ),
            child: Transform.scale(
              scale: 1.2, // เพิ่มขนาดของ Container
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "$name " + "$lastName\n" + "ยอดเงินในบัตร " + "$monny บาท",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

//----------------------------------------------------------------------------------------------------------------------------//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(children: <Widget>[
//           // background
//           const Positioned.fill(
//             child: Image(
//               image: AssetImage('assets/images/01.jpg'),
//               fit: BoxFit.fill,
//             ),
//           ),
//           Container(
//             child: ListView(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(700, 42, 100, 0),
//                   child: Text(
//                     "$name " + "$lastName\n" + "ยอดเงินในบัตร " + "$monny บาท",
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 20.0, right: 20),
//                 //   child: Text(
//                 //     "คะเเนนสะสม",
//                 //     style: TextStyle(
//                 //         fontSize: 20,
//                 //         color: Colors.white,
//                 //         fontWeight: FontWeight.bold),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//           // card

//           Container(
//             width: 950,
//             alignment: Alignment.center,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: 170),

//                   // Button Link
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(
//                       100,
//                       0,
//                       0,
//                       0,
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // Text(
//                               //   "โปรโมชั่น",
//                               //   style: TextStyle(
//                               //       fontSize: 26,
//                               //       color: Colors.white,
//                               //       fontWeight: FontWeight.bold),
//                               // ),

//                               // Padding(
//                               //   padding:
//                               //       const EdgeInsets.fromLTRB(500, 42, 100, 0),
//                               //   child: Text(
//                               //     "$name " +
//                               //         "$lastName\n" +
//                               //         "ยอดเงินในบัญชี " +
//                               //         "$monny บาท",
//                               //     style: TextStyle(
//                               //         fontSize: 20,
//                               //         color: Colors.white,
//                               //         fontWeight: FontWeight.bold),
//                               //   ),
//                               // ),
//                             ],
//                           ),

//                           GestureDetector(
//                             child: Container(
//                                 width: 700,
//                                 height: 350,
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   image: DecorationImage(
//                                       image: AssetImage("assets/images/36.jpg"),
//                                       fit: BoxFit.cover),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 160,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 15.0),
//                                       child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             // ElevatedButton(
//                                             //   // elevation: 5.0,
//                                             //   onPressed: () {
//                                             //     Navigator.pushReplacement(
//                                             //         context,
//                                             //         MaterialPageRoute(
//                                             //             builder: (context) =>
//                                             //                 page6()));
//                                             //   },
//                                             //   // padding: EdgeInsets.all(10.0),
//                                             //   // shape: RoundedRectangleBorder(
//                                             //   //   borderRadius:
//                                             //   //       BorderRadius.circular(30.0),
//                                             //   // ),
//                                             //   // color: Color.fromARGB(
//                                             //   //     255, 255, 255, 255),
//                                             //   child: Text(
//                                             //     'รายละเอียด',
//                                             //     style: TextStyle(
//                                             //       color:
//                                             //           Color.fromARGB(255, 0, 0, 0),
//                                             //       letterSpacing: 1,
//                                             //       fontSize: 15.0,
//                                             //       fontWeight: FontWeight.bold,
//                                             //       fontFamily: 'OpenSans',
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                           ]),
//                                     ),
//                                   ],
//                                 )),
//                           ),
//                           // Container(

//                           //   decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
//                           //   width: 700,
//                           //   height: 40,
//                           //   alignment: Alignment.center,
//                           //   child: Text('โปรโมชั่น 1  ',style: TextStyle(color: Colors.white,fontSize: 25),),
//                           // ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             child: Container(
//                                 width: 700,
//                                 height: 350,
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   image: DecorationImage(
//                                       image: AssetImage("assets/images/35.jpg"),
//                                       fit: BoxFit.cover),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 160,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 15.0),
//                                       child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             // ElevatedButton(
//                                             //   // elevation: 5.0,
//                                             //   onPressed: () {
//                                             //     Navigator.pushReplacement(
//                                             //         context,
//                                             //         MaterialPageRoute(
//                                             //             builder: (context) =>
//                                             //                 page6()));
//                                             //   },
//                                             //   // padding: EdgeInsets.all(10.0),
//                                             //   // shape: RoundedRectangleBorder(
//                                             //   //   borderRadius:
//                                             //   //       BorderRadius.circular(30.0),
//                                             //   // ),
//                                             //   // color: Color.fromARGB(
//                                             //   //     255, 255, 255, 255),
//                                             //   child: Text(
//                                             //     'รายละเอียด',
//                                             //     style: TextStyle(
//                                             //       color:
//                                             //           Color.fromARGB(255, 0, 0, 0),
//                                             //       letterSpacing: 1,
//                                             //       fontSize: 15.0,
//                                             //       fontWeight: FontWeight.bold,
//                                             //       fontFamily: 'OpenSans',
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                           ]),
//                                     ),
//                                   ],
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             child: Container(
//                                 width: 700,
//                                 height: 350,
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   image: DecorationImage(
//                                       image: AssetImage("assets/images/37.png"),
//                                       fit: BoxFit.cover),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 160,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 15.0),
//                                       child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             // ElevatedButton(
//                                             //   // elevation: 5.0,
//                                             //   onPressed: () {
//                                             //     Navigator.pushReplacement(
//                                             //         context,
//                                             //         MaterialPageRoute(
//                                             //             builder: (context) =>
//                                             //                 page6()));
//                                             //   },
//                                             //   // padding: EdgeInsets.all(10.0),
//                                             //   // shape: RoundedRectangleBorder(
//                                             //   //   borderRadius:
//                                             //   //       BorderRadius.circular(30.0),
//                                             //   // ),
//                                             //   // color: Color.fromARGB(
//                                             //   //     255, 255, 255, 255),
//                                             //   child: Text(
//                                             //     'รายละเอียด',
//                                             //     style: TextStyle(
//                                             //       color:
//                                             //           Color.fromARGB(255, 0, 0, 0),
//                                             //       letterSpacing: 1,
//                                             //       fontSize: 15.0,
//                                             //       fontWeight: FontWeight.bold,
//                                             //       fontFamily: 'OpenSans',
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                           ]),
//                                     ),
//                                   ],
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             child: Container(
//                                 width: 700,
//                                 height: 350,
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/logo02.jpg"),
//                                       fit: BoxFit.cover),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 160,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 15.0),
//                                       child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             // ElevatedButton(
//                                             //   // elevation: 5.0,
//                                             //   onPressed: () {
//                                             //     Navigator.pushReplacement(
//                                             //         context,
//                                             //         MaterialPageRoute(
//                                             //             builder: (context) =>
//                                             //                 page6()));
//                                             //   },
//                                             //   // padding: EdgeInsets.all(10.0),
//                                             //   // shape: RoundedRectangleBorder(
//                                             //   //   borderRadius:
//                                             //   //       BorderRadius.circular(30.0),
//                                             //   // ),
//                                             //   // color: Color.fromARGB(
//                                             //   //     255, 255, 255, 255),
//                                             //   child: Text(
//                                             //     'รายละเอียด',
//                                             //     style: TextStyle(
//                                             //       color:
//                                             //           Color.fromARGB(255, 0, 0, 0),
//                                             //       letterSpacing: 1,
//                                             //       fontSize: 15.0,
//                                             //       fontWeight: FontWeight.bold,
//                                             //       fontFamily: 'OpenSans',
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                           ]),
//                                     ),
//                                   ],
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                             child: Row(
//                               children: [],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
//-----------------------------------------------------------------------------------------------------------------------//
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

//--------------------------------------------------------------------


