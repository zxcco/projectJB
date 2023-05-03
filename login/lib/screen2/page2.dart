
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../model/FoodMenu.dart';


// class calculate extends StatefulWidget {
//   @override
//   _calculateState createState() => _calculateState(); //initstate
// }

// class _calculateState extends State<calculate> {
//   //กลุ่มข้อมูล
//    final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
// final TextEditingController _imgeController = TextEditingController();
//   final CollectionReference _products =
//       FirebaseFirestore.instance.collection('products');

//   String text_name = "";
//   String text_img = "https://firebasestorage.googleapis.com/v0/b/myloginapp-98f2d.appspot.com/o/files%2Flogo02.jpg?alt=media&token=80a4b1e2-a613-4fca-b2a2-9a73c201ad11";
//   String text_bd = "";
//   String text_price = "";
//   String show_price= "";
//   int text_monny= 0;
//   // int tatal_monny= 0;
//   int number = 0;
//   int text_price1=0;
//  int tatal_monny= 0;


//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //text_img= text_img ==null ? "" : text_img;
//     text_name = "";
//     text_img = text_img == null ? "" : text_img;
//     text_bd = "";
//     text_price ="";
//     show_price="";

//     text_price1=0;
//     tatal_monny=0;
//     tatal_monny = text_monny;
//     // int tatal_monny= 0;
//     // text_price1=0;

    
//   }

//   void change(String name, String price, String img, String bd) {
//     setState(() {
//       text_name = ('$name');
//       text_price =('$price');
//       show_price =("ราคา "+'$price'+" บาท");
//       text_img = '$img';
//       text_bd = '$bd';
      
//       // tatal_number= text_price1 *number ;
//     });
//   }

// int tatalnumber() {
//     // setState(() {
//     //   var text_price1 = int.parse(text_price);
//     //   tatal_monny= text_price1 * number ;
//     //   print('$tatal_monny');
      
//     // });
//     int tatal_monny = int.parse(text_price) * number ;
//     return tatal_monny;
//   }

//   // int add(int text_price1, int number) => text_price1 * number;

// //โชว์สลิป
//  Future _onDialogShowing()=> showDialog(
//     context: context, 
//     builder: (context) => AlertDialog(
//       content:  
//       Text("ราคาทั้งหมด  "+tatalnumber().toString()+"  บาท"),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text("data"),
//        )
//             ],
//        ));



//   static List<FoodManu> menu = [
//    FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
    
//         FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
    
//         FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
    
//         FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
    
//         FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
    
//         FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//     FoodManu("", "", "", ""),
//   ];
//   final List<FoodManu> fruitdata = List.generate(
//       menu.length,
//       (index) => FoodManu('${menu[index]}', '${menu[index]}', '${menu[index]}',
//           '${menu[index]}'));
  
//   bool isVisible = true;
//   //เเสดงผลข้อมูล
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: SingleChildScrollView(
        
//         child: SafeArea(
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, 
//           children: [
//             Container(
//               height: 630,
//               width: 500,
//               color: Color.fromARGB(255, 252, 252, 252),
//               child:StreamBuilder(
//         stream: _products.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//           if (streamSnapshot.hasData) {
//             return ListView.builder(
//               itemCount: streamSnapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                     streamSnapshot.data!.docs[index];
//                     FoodManu food = menu[index];
//                 return Card(
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                      leading: Image.network(
//                            documentSnapshot['image'] ,
//                               width: 50,
//                               height: 50,
//                             ), //รูปเมนู//รูปเมนู
            
//                     title: Text(
                      
//                         documentSnapshot['name'],
//                               style: TextStyle(fontSize: 30),
//                             ),                              
//                                     // textColor: Color.fromARGB(255, 255, 0, 0),
//                           subtitle: Text("ราคา" + documentSnapshot['price'].toString() + "บาท"),
//                              onTap: () {
                              
//                                 documentSnapshot['name'] == food.name;
//                                 documentSnapshot['price'].toString() ;
//                                 documentSnapshot['image'] ;

//                               change(documentSnapshot['name'], documentSnapshot['price'].toString(),documentSnapshot['image'],food.bd);
//                             },          
                           
                    
//                   ),
                  
//                 );
                
//               },
//             );
//           }

//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
          
//             ),
//             Container(
//                 height: 630,
//                 width: 520,
//                 color: Color.fromARGB(255, 221, 173, 111),
//                 child: Column(
//                   children: [
//                     (Text('$text_name', style: TextStyle(fontSize: 50))),
//                     (Text('$show_price', style: TextStyle(fontSize: 30))),
      
//                      Image.network(
//                       '$text_img',
//                       width: 450,
//                       height: 350,
//                     ),
//                     Text(text_bd),
      
//                     //ปุ่มบวกลบ(+.-) 
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           FloatingActionButton(
//                             heroTag: '+',
//                             onPressed: () {
//                               setState(() {
                                
//                                 if (number >= 1) {
//                                     number--;
                                    
//                                   }
                                
//                               });
//                             },
//                             child: Icon(Icons.do_disturb_on),
//                           ),
//                           //โชว๋จำนวนเเก้ว
//                           Text(
//                             number.toString(),
//                             style: TextStyle(fontSize: 20),
                            
//                           ),
//                           FloatingActionButton(
//                             heroTag: '-',
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   number++;
                                
//                                 },
//                               );
//                             },
//                             child: Icon(Icons.add_circle),
//                           ),
//                         ]),
//                         FloatingActionButton(
//                           heroTag: 'save',
//                             onPressed: () {
//                              _onDialogShowing();
//                             },
//                             child: Icon(Icons.save_alt),
//                           ),
//                   ],
//                 ))
//           ]),
//         ),
//       ),
//     );
//   }
// }


