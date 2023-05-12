// ignore_for_file: deprecated_member_use
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login/%E0%B9%8AUser/%E0%B9%8AUser_home.dart';
import 'package:login/%E0%B9%8AUser/User_register.dart';
import 'package:login/model/profile.dart';
import 'package:login/screen/register.dart';
import '../111/cart_controllers.dart';
import '../screen2/home2.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final CartController1 controller = Get.put(CartController1());

  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    String user = 'jj@gmail.com';
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("เข้าสู่ระบบ"),
      // ),
      body: Container(
        height: 750,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 151, 95, 34),
              Color.fromARGB(255, 131, 91, 38),
              Color.fromARGB(255, 94, 59, 20)
            ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
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

                  // Text("E-mail", style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  Container(
                    width: 700,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 231, 231),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'อีเมล',
                      ),
                      // validator: MultiValidator([
                      //   RequiredValidator(
                      //       errorText:
                      //           "        กรุณาป้อนอีเมลด้วยครับ\n"),
                      //   EmailValidator(
                      //       errorText:
                      //           "        รูปแบบอีเมลไม่ถูกต้อง\n")
                      // ]),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => profile.email = value.trim(),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: 700,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 231, 231),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintText: 'รหัสผ่าน',
                      ),
                      validator: RequiredValidator(
                          errorText: "        กรุณาป้อนรหัสผ่านด้วยครับ\n"),
                      obscureText: true,
                      onChanged: (value) => profile.password = value.trim(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Align(
                      alignment: Alignment(0.7, 0.3),
                      // child: Text(
                      //   ' ลืมรหัสผ่าน ?',
                      //   style: TextStyle(
                      //     color: Color.fromARGB(255, 255, 255, 255),
                      //     fontSize: 18.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                  ),

                  Container(
                    width: 700,
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: ElevatedButton(
                      // elevation: 5.0,
                      onPressed: () async {
                        // print(profile.email);
                        // user =  data["Email"];
                        if ((profile.email == user)) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: profile.email!,
                                  password: profile.password!)
                              .then((value) {
                            formKey.currentState!.reset();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              controller.email(user);
                              controller.user1;
                              return MyApp2();
                            }));
                          });
                        } else {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: profile.email!,
                                  password: profile.password!)
                              .then((value) {
                            formKey.currentState!.reset();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              controller.email(profile.email!);
                              return MyApp1();
                            }));
                          });
                        }
                      },
                      // padding: EdgeInsets.all(15.0),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(30.0),
                      // ),
                      // color: Color.fromARGB(255, 51, 50, 50),
                      child: Text(
                        'ล็อคอิน',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          letterSpacing: 1,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' ไม่มีบัญชีพนักงาน ? ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Schyler'),
                          ),
                          TextSpan(
                            text: 'สมัครบัญชีพนักงาน',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyler'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserRegister()));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' ไม่มีบัญชีลูกค้า ? ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Schyler'),
                          ),
                          TextSpan(
                            text: 'สมัครบัญชีลูกค้า',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Schyler'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
