// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/screen2/page1.dart';
import '../model/FoodMenu.dart';
import 'page2.dart';
import 'membership.dart';
import 'valibel.dart';

class page5 extends StatelessWidget {
 

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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, "/membership");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberShip()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                offset: Offset(-8, -1),
                                spreadRadius: 2,
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(2, 2),
                                spreadRadius: 4,
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Icon(Icons.menu),
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/kaphe.jpg",
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'เปลียนรหัสผ่าน',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 167, 164, 161), //สีในกรอบ
                    border: Border.all(
                        color: Color.fromARGB(255, 199, 129, 72)), //ขอบ
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintText: '  รหัสผ่านเดิม',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 167, 164, 161), //สีในกรอบ
                    border: Border.all(
                        color: Color.fromARGB(255, 199, 129, 72)), //ขอบ
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintText: '  รหัสผ่านใหม่',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 167, 164, 161), //สีในกรอบ
                    border: Border.all(
                        color: Color.fromARGB(255, 199, 129, 72)), //ขอบ
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintText: '  รหัสผ่านใหม่',
                    ),
                  ),
                ),
              ],
            ),
            
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                // width: double.infinity,
                width: 80,
                child: ElevatedButton(
                  // elevation: 5.0,
                  onPressed: () {
                    // Navigate to second route when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MemberShip()),
                    );
                  },
                  // padding: EdgeInsets.all(15.0),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // ),
                  // color: Colors.white,
                  child: Icon(Icons.arrow_forward),
                ),
              ),
              GestureDetector(
                // onTap: () {
                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => page1()));
                // },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 252, 252, 252),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
