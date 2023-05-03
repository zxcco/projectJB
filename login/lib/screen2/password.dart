// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:login/screen/login.dart';
// import 'package:login/screen2/passdialog.dart';

// class page4_2 extends StatefulWidget {
 

//   @override
//   State<page4_2> createState() => _page4_2State();
// }
// class _page4_2State extends State<page4_2> {
//   bool _isObscure = true;
//   bool _isObscure1 = true;
//   bool _isObscure2 = true;

//   var user_pass;

//   CollectionReference users =
//       FirebaseFirestore.instance.collection('UserProfile');

//   TextEditingController passwordController = TextEditingController();
//   TextEditingController newpasswordController = TextEditingController();
//   TextEditingController confirmNewPasswordController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   final currentUser = FirebaseAuth.instance.currentUser;
//   User? user = FirebaseAuth.instance.currentUser;

//   @override
//   void dispose() {
//     newpasswordController.dispose();
//     super.dispose();
//   }

//   changPassword() async {
//     try {
//       await currentUser!.updatePassword(newpasswordController.text);
//       await FirebaseFirestore.instance
//           .collection("UserProfile")
//           .doc(user!.uid)
//           .update({
//         "password": newpasswordController.text,
//       });
//       FirebaseAuth.instance.signOut();
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginScreen(),
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.black,
//           content: Text('อัพเดทรหัสผ่านสำเร็จโปรด...ลงชื่อเข้าใช้ใหม่'),
//         ),
//       );
//     } catch (e) {}
//   }



//   final kHintTextStyle = TextStyle(
//     color: Colors.black87,
//     fontFamily: 'OpenSans',
//   );

//   final kLabelStyle = TextStyle(
//     color: Colors.black87,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'OpenSans',
//   );

//   final kBoxDecorationStyle = BoxDecoration(
//     color: Color.fromARGB(255, 180, 180, 180),
//     borderRadius: BorderRadius.circular(10.0),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black12,
//         blurRadius: 6.0,
//         offset: Offset(0, 2),
//       ),
//     ],
//   );

//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'รหัสผ่านเดิม',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: TextField(
//               controller: passwordController,
//               obscureText: _isObscure,
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontFamily: 'OpenSans',
//               ),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(bottom: 5),
//                 suffix: IconButton(
//                     iconSize: 25,
//                     color: Colors.black87,
//                     icon: Icon(
//                         _isObscure ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });
//                     }),
//                 hintText: 'กรอกรหัสผ่านเดิม',
//                 hintStyle: kHintTextStyle,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPasswordTF1() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'รหัสผ่านใหม่',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: TextField(
//               controller: newpasswordController,
//               obscureText: _isObscure1,
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontFamily: 'OpenSans',
//               ),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(bottom: 5),
//                 suffix: IconButton(
//                     iconSize: 25,
//                     color: Colors.black87,
//                     icon: Icon(
//                         _isObscure1 ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure1 = !_isObscure1;
//                       });
//                     }),
//                 hintText: 'กรอกรหัสผ่านใหม่',
//                 hintStyle: kHintTextStyle,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPasswordTF2() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'ยืนยันรหัสผ่านใหม่',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: TextField(
//               controller: confirmNewPasswordController,
//               obscureText: _isObscure2,
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontFamily: 'OpenSans',
//               ),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(bottom: 5),
//                 suffix: IconButton(
//                     iconSize: 25,
//                     color: Colors.black87,
//                     icon: Icon(
//                         _isObscure2 ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure2 = !_isObscure2;
//                       });
//                     }),
//                 hintText: 'กรอกรหัสผ่านใหม่',
//                 hintStyle: kHintTextStyle,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black87,
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         elevation: 0,
       
//         leading: Padding(
//           padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Text('ยกเลิก',
//                 style: TextStyle(
//                     fontSize: 17,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.bold)),
//           ),
//         ),
//         title: SizedBox(
//           height: 50,
//           child: Stack(children: <Widget>[
//             const Text('ตั้งค่าบัญชี',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//             Positioned(
//               top: 33,
//               right: 0,
//               left: 0,
//               bottom: 12,
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20 / 4),
//                 height: 7,
                
//               ),
//             ),
//           ]),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () async {
//               if (passwordController.text.isEmpty != true ||
//                   newpasswordController.text.isEmpty != true ||
//                   confirmNewPasswordController.text.isEmpty != true) {
//                 if (passwordController.text == user_pass) {
//                   if (newpasswordController.text.isEmpty != true ||
//                       confirmNewPasswordController.text.isEmpty != true) {
//                     if (newpasswordController.text ==
//                         confirmNewPasswordController.text) {
// ////////////////////////////////////// To Do ///////////////////////////////////////////////////////////////////////////////
//                       changPassword();
//                     } else {
//                       var dialog = CustomAlertDialog(
//                         title: "เกิดข้อผิดพลาด",
//                         message: "รหัสผ่านใหม่ไม่ตรงกัน",
//                         onPostivePressed: () {},
//                         positiveBtnText: 'ปิด', //negativeBtnText: 'No'
//                       );

//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) => dialog);
//                     }
//                   } else {
//                     var dialog = CustomAlertDialog(
//                       title: "เกิดข้อผิดพลาด",
//                       message: "กรอกข้อมูลให้ครบถ้วน",
//                       onPostivePressed: () {},
//                       positiveBtnText: 'ปิด', //negativeBtnText: 'No'
//                     );

//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) => dialog);
//                   }
//                 } else {
//                   var dialog = CustomAlertDialog(
//                     title: "เกิดข้อผิดพลาด",
//                     message: "รหัสผ่านเดิมไม่ถูกต้อง",
//                     onPostivePressed: () {},
//                     positiveBtnText: 'ปิด', //negativeBtnText: 'No'
//                   );

//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) => dialog);
//                 }
//               } else {
//                 var dialog = CustomAlertDialog(
//                   title: "เกิดข้อผิดพลาด",
//                   message: "กรอกข้อมูลให้ครบถ้วน",
//                   onPostivePressed: () {},
//                   positiveBtnText: 'ปิด', //negativeBtnText: 'No'
//                 );

//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) => dialog);
//               }

//               print("เก็บข้อมูล");
//               // Navigator.pop(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(0, 15, 5, 0),
//               child: Text('ยืนยัน',
//                   style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ],
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Error");
//           }
//           if (snapshot.hasData && !snapshot.data!.exists) {
//             return Center(child: const Text("ไม่สามารถเชื่อมต่อได้"));
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;
//             user_pass = data['password'];
//             return SizedBox(
//               height: double.infinity,
//               child: SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 40.0,
//                   vertical: 20.0,
//                 ),
                
//               ),
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }