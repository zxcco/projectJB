import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login/screen2/page6.dart';

import '../111/cart_controllers.dart';
import '../model/user.dart';

class page3 extends StatefulWidget {
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _profilecollection =
      FirebaseFirestore.instance.collection("Userprofile");
  // TextEditingController _email_changeController = TextEditingController();
  TextEditingController _Phone_changeController = TextEditingController();
  TextEditingController _price_changeController = TextEditingController();
  final CartController1 controller = Get.put(CartController1());

  Future<void> showMyDialog(BuildContext context, String name, String Lastname,
      int one, int two, int tree, String email) async {
    // print("jj@gmail.com" + " 111");
    // print(controller.email1);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('คุณ $name $Lastname'),
          content: Text(
              'ยอดเงินในบัญชี $one บาท\nเติมเงินเพิ่ม $two บาท\nยอดเงินคงเหลือ $tree บาท'),
          actions: [
            TextButton(
              onPressed: () async {
                final aaa =
                    FirebaseFirestore.instance.collection('Userprofile');
                final bbbb = aaa.doc(email.toString().trim());
                bbbb.update({'monny': tree.toString()});
                Navigator.of(context).pop();
                _Phone_changeController.text = '';
                _price_changeController.text = '';
                controller.email('');
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
          title: Text('ไม่มีเบอร์นี้ในระบบ'),
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

  Future<void> fetchDataByPhone(String phone) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Userprofile')
        .where('Phone', isEqualTo: phone)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // พบเอกสารที่ตรงกับเงื่อนไข
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        // ดึงค่าข้อมูลจากเอกสาร
        if (data.containsKey('Email')) {
          String email = data['Email'] as String;
          // ทำสิ่งที่ต้องการกับ email
          controller.email(email);
        }
      } else {
        // ไม่พบเอกสารที่ตรงกับเงื่อนไข
        print('ไม่พบข้อมูลสำหรับเบอร์โทรศัพท์ที่ระบุ');
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                                      controller: _Phone_changeController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'เบอร์โทร',
                                        hintText: '',
                                        prefixIcon: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(Icons.phone),
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
                                          return 'กรุณากรอกเบอร์โทร';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
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
                                        // fetchDataByPhone(
                                        //     _Phone_changeController.text);
                                        try {
                                          QuerySnapshot querySnapshot =
                                              await FirebaseFirestore.instance
                                                  .collection('Userprofile')
                                                  .where('Phone',
                                                      isEqualTo:
                                                          _Phone_changeController
                                                              .text
                                                              .trim())
                                                  .get();

                                          if (querySnapshot.docs.isNotEmpty) {
                                            DocumentSnapshot documentSnapshot =
                                                querySnapshot.docs.first;
                                            Map<String, dynamic>? data =
                                                documentSnapshot.data()
                                                    as Map<String, dynamic>?;
                                            if (data!.containsKey('Email')) {
                                              String email =
                                                  data['Email'] as String;
                                              String name =
                                                  data['Name'] as String;
                                              String phone =
                                                  data['Phone'] as String;
                                              String monny =
                                                  data['monny'] as String;
                                              String lastname =
                                                  data['Lastname'] as String;
                                              int one = int.parse(monny);
                                              int two = int.parse(
                                                  _price_changeController.text);
                                              int tree = one + two;

                                              if (_Phone_changeController
                                                      .text ==
                                                  phone) {
                                                showMyDialog(
                                                    context,
                                                    name,
                                                    lastname,
                                                    one,
                                                    two,
                                                    tree,
                                                    email);
                                              }
                                            }
                                          } else {
                                            showMyDialogEmail(context);
                                          }
                                        } catch (e) {
                                          showMyDialogEmail(context);
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
                        ),
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
                                border: Border.all(
                                  color: Colors.red, // สีขอบที่ต้องการ
                                  width: 2, // ความหนาของขอบที่ต้องการ
                                ),
                                borderRadius: BorderRadius.circular(
                                    10), // ขอบเขตรูปร่างของ Container
                                image: DecorationImage(
                                  image: AssetImage("assets/images/11.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                                border: Border.all(
                                  color: Colors.red, // สีขอบที่ต้องการ
                                  width: 2, // ความหนาของขอบที่ต้องการ
                                ),
                                borderRadius: BorderRadius.circular(
                                    10), // ขอบเขตรูปร่างของ Container
                                image: DecorationImage(
                                  image: AssetImage("assets/images/22.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              width: 700,
                              height: 350,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red, // สีขอบที่ต้องการ
                                  width: 2, // ความหนาของขอบที่ต้องการ
                                ),
                                borderRadius: BorderRadius.circular(
                                    10), // ขอบเขตรูปร่างของ Container
                                image: DecorationImage(
                                  image: AssetImage("assets/images/33.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              width: 700,
                              height: 350,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red, // สีขอบที่ต้องการ
                                  width: 2, // ความหนาของขอบที่ต้องการ
                                ),
                                borderRadius: BorderRadius.circular(
                                    10), // ขอบเขตรูปร่างของ Container
                                image: DecorationImage(
                                  image: AssetImage("assets/images/logo02.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
