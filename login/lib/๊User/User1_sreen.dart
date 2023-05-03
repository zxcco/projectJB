import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class User1 extends StatefulWidget {
  const User1({Key? key}) : super(key: key);

  @override
  State<User1> createState() => _User1State();
}

class _User1State extends State<User1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children:<Widget>[
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "โปรโมชั่น",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
               
                "คะเเนนสะสม",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
               
                "ยอดเงินในบัตร",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
        // card
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150),
              // Button Link
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  0,
                  0,
                  0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                          child: Container(
                              width: 450,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logo02.jpg"),
                                      fit: BoxFit.cover),
                                  )),
                          onTap: () {
                            
                          }),
                          Container(
                            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                            width: 450,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text('โปรโมชั่น 1  ',style: TextStyle(color: Colors.white,fontSize: 25),),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                          child: Container(
                              width: 450,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logo02.jpg"),
                                      fit: BoxFit.cover),
                                  )),
                          onTap: () {
                            
                          }),
                          Container(
                            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                            width: 450,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text('โปรโมชั่น 2 ',style: TextStyle(color: Colors.white,fontSize: 25),),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                          child: Container(
                              width: 450,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logo02.jpg"),
                                      fit: BoxFit.cover),
                                  )),
                          onTap: () {
                            
                          }),
                          Container(
                            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                            width: 450,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text('โปรโมชั่น 3 ',style: TextStyle(color: Colors.white,fontSize: 25),),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                          child: Container(
                              width: 450,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logo02.jpg"),
                                      fit: BoxFit.cover),
                                  )),
                          onTap: () {
                            
                          }),
                          Container(
                            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                            width: 450,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text('โปรโมชั่น 4 ',style: TextStyle(color: Colors.white,fontSize: 25),),
                          ),
                          SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Row(
                          children: [
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );

  }
}