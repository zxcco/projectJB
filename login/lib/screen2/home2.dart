import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login/111/calculate%20copy.dart';
import 'package:login/screen2/membership.dart';
import 'package:login/screen2/page2.dart';
import 'package:login/screen2/page1.dart';
import 'package:login/screen2/page3.dart';
import 'package:login/screen2/page4.dart';
import 'package:login/screen2/page5.dart';
import 'package:login/screen2/page6.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import '../111/catalog_products 1.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  // a variable to store the current selected tab. can be used to control PageView
  int currentIndex = 0;
  void onTap(int index) {
    currentIndex = index;
  }

  List pages = [
    page4(),
    calculate1(),
    page1(),
    page3(),
    page6(),
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
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.calculate,
                          size: 30,
                        ),
                        label: "  ออเดอร์ "),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.menu_open,
                          size: 30,
                        ),
                        label: "เพิ่มเมนู"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.card_membership,
                          size: 30,
                        ),
                        label: "member"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        label: "ตั่งค่า"),
                  ]),
            ),
// Container(
//   height: 75,
// color: Color.fromARGB(255, 131, 91, 38),
//   child:  MoltenBottomNavigationBar(
//           selectedIndex: _selectedIndex,
//           domeHeight: 20,
//           onTabChange: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },

//           tabs: [

//             MoltenTab(

//               icon: Icon(Icons.menu_open),
//               title: Text('เพิ่มเมนู'),
//             ),
//             MoltenTab(
//               icon: Icon(Icons.calculate),
//             title: Text('คิดเงิน'),
//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.search),
//               title: Text('home'),
//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.home),
//               title: Text('home'),
//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.person),
//               title: Text('home'),
//               // selectedColor: Colors.yellow,
//             ),
//           ],
//         ),
// )
          ],
        ),
      ),
    );
  }
}














// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:login/screen2/page3.dart';
// import 'package:login/screen2/page4.dart';
// import 'package:login/screen2/page5.dart';
// import "calculate.dart";
// import '../model/FoodMenu.dart';
// import 'page1.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState(); //initstate
// }

// class _HomeState extends State<Home> {
//   //กลุ่มข้อมูล

//   //เเสดงผลข้อมูล
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SafeArea(
//           child: Container(
//             height: 700,
//             decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomLeft,
//                           colors: [
//                       Color.fromARGB(255, 56, 44, 31),
//                       Color.fromARGB(255, 131, 91, 38),
//                       Color.fromARGB(255, 141, 78, 6)
//                     ])),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
                
              
//                 Container(//1
//                   padding: EdgeInsets.all(8.0),
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 208, 211, 208), //สีกรอบ
//                           blurRadius: 4.0,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             Color.fromARGB(255, 226, 225, 222), //สีทางขวา
//                             Color.fromARGB(255, 148, 97, 49), //สีทางซ้าย
//                           ]),
//                       shape: BoxShape.circle //รูปทรง
//                       ),
//                       child:  FloatingActionButton(      
//                     heroTag: 'page1',     
//                     onPressed: () {
                    
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  page1()),
//                     );                    
//                   },
              
//                   child: Icon(Icons.menu_open,
//                   color: Colors.white,), 
                                                                      
//                   ),
//                 ),





//                 Container(//2
//                   padding: EdgeInsets.all(8.0),
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 208, 211, 208), //สีกรอบ
//                           blurRadius: 4.0,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             Color.fromARGB(255, 226, 225, 222), //สีทางขวา
//                             Color.fromARGB(255, 148, 97, 49), //สีทางซ้าย
//                           ]),
//                       shape: BoxShape.circle //รูปทรง
//                       ),
//                       child:  FloatingActionButton(
//                     heroTag: 'calcute',
                    
                    
//                     onPressed: () {
//                     // Navigate to second route when tapped.
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  calculate()),
//                     );
                    
//                   },
//                   child: Icon(Icons.calculate),                 
//                   ),
//                 ),





//                 Container(//3
//                   padding: EdgeInsets.all(8.0),
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 208, 211, 208), //สีกรอบ
//                           blurRadius: 4.0,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             Color.fromARGB(255, 226, 225, 222), //สีทางขวา
//                             Color.fromARGB(255, 148, 97, 49), //สีทางซ้าย
//                           ]),
//                       shape: BoxShape.circle //รูปทรง
//                       ),
//                        child:  FloatingActionButton(      
//                     heroTag: 'page3',     
//                     onPressed: () {
                    
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  MainPage()),
//                     );                    
//                   },
              
//                   child: Icon(Icons.add_a_photo,
//                   color: Colors.white,), 
                                                                      
//                   ),
//                 ),


//                 Container(//4
//                   padding: EdgeInsets.all(8.0),
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 208, 211, 208), //สีกรอบ
//                           blurRadius: 4.0,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             Color.fromARGB(255, 226, 225, 222), //สีทางขวา
//                             Color.fromARGB(255, 148, 97, 49), //สีทางซ้าย
//                           ]),
//                       shape: BoxShape.circle //รูปทรง
//                       ),
//                       child:  FloatingActionButton(      
//                     heroTag: 'page4',     
//                     onPressed: () {
                    
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  MyApp1()),
//                     );                    
//                   },
              
//                   child: Icon(Icons.abc,
//                   color: Colors.white,), 
                                                                      
//                   ),
//                 ),


//                 Container(//5
//                   padding: EdgeInsets.all(8.0),
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 208, 211, 208), //สีกรอบ
//                           blurRadius: 4.0,
//                           spreadRadius: 2.0,
//                         ),
//                       ],
//                       gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                            Color.fromARGB(255, 226, 225, 222), //สีทางขวา
//                             Color.fromARGB(255, 148, 97, 49), //สีทางซ้าย
//                           ]),
//                       shape: BoxShape.circle //รูปทรง
//                       ),
//                       child:  FloatingActionButton(      
//                     heroTag: 'page5',     
//                     onPressed: () {
//                     // Navigate to second route when tapped.
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  page5()),
//                     );                    
//                   },
//                   child: Icon(Icons.card_membership),                                                     
//                   ),
//                   // child:  FloatingActionButton(      
//                   //   heroTag: 'page5',     
//                   //   onPressed: () {
//                   //   // Navigate to second route when tapped.
//                   //   Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(builder: (context) =>  page5()),
//                   //   );                    
//                   // },
//                   // child: Icon(Icons.card_membership),                                                     
//                   // ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Center(
        
          
// //         child: ElevatedButton(
// //           child: const Text('Open route'),
// //           onPressed: () {
// //             // Navigate to second route when tapped.
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => const page2()),
// //      );
// //           },
// //         ),
// //       ),

  
  
  
  
  
  
 

 
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';

// // class MyCustomWidget extends StatefulWidget {
// //   @override
// //   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// // }

// // class _MyCustomWidgetState extends State<MyCustomWidget>
// //     with TickerProviderStateMixin {
// //   bool expanded = true;
// //   AnimationController controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 400),
// //       reverseDuration: Duration(milliseconds: 400),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: [
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.view_list, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.pause_play, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.menu_close, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.add_event, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.arrow_menu, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //             ],
// //           ),
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.close_menu, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.add_event, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.event_add, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.menu_arrow, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.play_pause, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //             ],
// //           ),
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.list_view, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.home_menu, progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                   icon: AnimatedIcon(
// //                       icon: AnimatedIcons.ellipsis_search,
// //                       progress: controller),
// //                   onPressed: () {
// //                     setState(() {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     });
// //                   }),
// //               IconButton(
// //                 icon: AnimatedIcon(
// //                     icon: AnimatedIcons.search_ellipsis, progress: controller),
// //                 onPressed: () {
// //                   setState(
// //                     () {
// //                       expanded ? controller.forward() : controller.reverse();
// //                       expanded = !expanded;
// //                     },
// //                   );
// //                 },
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }




      