import 'package:flutter/material.dart';
import 'package:login/%E0%B9%8AUser/User_sitting.dart';
import 'package:login/%E0%B9%8AUser/page6User.dart';
import 'package:login/screen2/page3User.dart';
import 'User_page6.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  // a variable to store the current selected tab. can be used to control PageView
  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;
  }

  List pages = [
    page3User(),
    page6User(),
    // page4_1(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        // primaryColor: Colors.deepPurple[400],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 640,
              child: pages[currentIndex],
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color.fromARGB(255, 56, 44, 31),
                    Color.fromARGB(255, 131, 91, 38),
                    Color.fromARGB(255, 141, 78, 6)
                  ])),
            ),
            Container(
              height: 80,
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color.fromARGB(255, 19, 18, 16),
                  currentIndex: currentIndex,
                  onTap: (index) => setState(() => currentIndex = index),
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Color.fromARGB(255, 228, 233, 231),
                  unselectedFontSize: 15,
                  selectedFontSize: 15,
                  elevation: 0,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.star_border,
                          size: 30,
                        ),
                        label: "หน้าเเรก"),
                    // BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Icons.calculate,
                    //       size: 30,
                    //     ),
                    //     label: "  ออเดอร์ "),
                    // BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Icons.menu_open,
                    //       size: 30,
                    //     ),
                    //     label: "เพิ่มเมนู"),
                    // BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Icons.card_membership,
                    //       size: 30,
                    //     ),
                    //     label: "member"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        label: "ตั่งค่า"),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
