import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class page4_1 extends StatefulWidget {
  const page4_1({Key? key}) : super(key: key);

  @override
  State<page4_1> createState() => _page4_1State();
}

class _page4_1State extends State<page4_1> {
  // var dialog;
  // var nameF;
  // var callF;
  // var pic_url;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController callC = TextEditingController();

  CollectionReference users =
      FirebaseFirestore.instance.collection('UserProfile');

  File? _image;
  File? imageTemporary;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      imageTemporary = File(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // Future uploadFile() async {
  //   final path = 'test/${FirebaseAuth.instance.currentUser!.uid}';
  //   final file = File(_image!.path);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file);

  //   String url = (await ref.getDownloadURL()).toString();
  //   FirebaseFirestore.instance
  //       .collection("UserProfile")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .update({
  //     "test": url,
  //   });
  // }

  Widget profile_pic() {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          if (_image != null)
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 210, 210, 210),
              backgroundImage: FileImage(_image!))
          //   )
          // else if (pic_url != " ")
          //   CircleAvatar(
          //     backgroundColor: Color.fromARGB(255, 210, 210, 210),
          //     backgroundImage: NetworkImage(pic_url),
          //   )
          else
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 210, 210, 210),
              backgroundImage: AssetImage("assets/images/logo02.jpg"),
            ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Image.asset("assets/images/0.jpg"),
                
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text('ยกเลิก',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        title: SizedBox(
          height: 50,
          child: Stack(children: <Widget>[
            SizedBox(width: 180,
              child: const Text('แก้ไขโปรไฟล์',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            Positioned(
              top: 33,
              right: 0,
              left: 0,
              bottom: 12,
              child: Container(
                margin: const EdgeInsets.only(right: 20 / 4),
                height: 7,
                color: Colors.black,
              ),
            ),
          ]),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // uploadFile();

              // if (nameC.text.isEmpty != true) {
              //   nameC == nameF;
              //   FirebaseFirestore.instance
              //       .collection("UserProfile")
              //       .doc(FirebaseAuth.instance.currentUser!.uid)
              //       .update({
              //     "name": nameC.text,
              //   });
              // }
              // if (callC.text.isEmpty != true) {
              //   callC == callF;
              //   FirebaseFirestore.instance
              //       .collection("UserProfile")
              //       .doc(FirebaseAuth.instance.currentUser!.uid)
              //       .update({
              //     "call": callC.text,
              //   });
              // }

              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 5, 0),
              child: Text('ยืนยัน',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),

      body:  Column(
        
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      // selectFile();
                      pickImage(ImageSource.gallery);
                      //pickImage(ImageSource.camera);
                    },
                    child: profile_pic()),
                SizedBox(
                  height: 30,
                ),
                Container(
                   
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text("ชื่อผู้ใช้  ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          width: 450,
                          child: TextField(
                            controller: nameC,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'name',
                                hoverColor: Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text("เบอร์โทร",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          width: 450,
                          child: TextField(
                            controller: callC,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'call',
                                hoverColor: Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
    // FutureBuilder<DocumentSnapshot>(
    //     future: users.doc('2o2sB2fSTdfx0KuqVJcO').get(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return const Text("Error");
    //       }
    //       if (snapshot.hasData && !snapshot.data!.exists) {
    //         return Center(child: const Text("ไม่สามารถเชื่อมต่อได้"));
    //       }

    //       if (snapshot.connectionState == ConnectionState.done) {
    //         Map<String, dynamic> data =
    //             snapshot.data!.data() as Map<String, dynamic>;
    //         nameF = data['name'];
    //         callF = data['call'];
    //         pic_url = data['pic_url'];
    //         return Column(
    //           children: [
    //             SizedBox(
    //               height: 20,
    //             ),
    //             InkWell(
    //                 onTap: () async {
    //                   // selectFile();
    //                   pickImage(ImageSource.gallery);
    //                   //pickImage(ImageSource.camera);
    //                 },
    //                 child: profile_pic()),
    //             SizedBox(
    //               height: 30,
    //             ),
    //             Container(
    //               padding: EdgeInsets.all(16),
    //               child: Row(
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //                     child: Text("ชื่อผู้ใช้  ",
    //                         style: TextStyle(
    //                             fontSize: 18,
    //                             color: Colors.black87,
    //                             fontWeight: FontWeight.w600)),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 30),
    //                     child: SizedBox(
    //                       width: 250,
    //                       child: TextField(
    //                         controller: nameC,
    //                         style:
    //                             TextStyle(fontSize: 20.0, color: Colors.black),
    //                         decoration: InputDecoration(
    //                             border: UnderlineInputBorder(),
    //                             hintText: data['name'],
    //                             hoverColor: Colors.black,),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.all(16),
    //               child: Row(
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    //                     child: Text("เบอร์โทร",
    //                         overflow: TextOverflow.ellipsis,
    //                         style: TextStyle(
    //                             fontSize: 18,
    //                             color: Colors.black87,
    //                             fontWeight: FontWeight.w600)),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 30),
    //                     child: SizedBox(
    //                       width: 250,
    //                       child: TextField(
    //                         controller: callC,
    //                         keyboardType: TextInputType.phone,
    //                         maxLength: 10,
    //                         style:
    //                             TextStyle(fontSize: 20.0, color: Colors.black),
    //                         decoration: InputDecoration(
    //                             border: UnderlineInputBorder(),
    //                             hintText: data['call'],
    //                             hoverColor: Colors.black,),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         );
    //       }
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   ),
    // );
  }
}