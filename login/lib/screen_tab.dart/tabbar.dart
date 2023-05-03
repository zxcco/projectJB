import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/screen_tab.dart/first_tab.dart';
import 'package:login/screen_tab.dart/second_tab.dart';
import 'package:login/screen_tab.dart/third_tab.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      
     child: Scaffold(
      appBar: AppBar(),
body: Column(
  children: [
        TabBar(
                  physics: const BouncingScrollPhysics(),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'เย็น',
                    ),
                    Tab(
                      text: 'ร้อน',
                    ),
                    Tab(
                      text: 'ปั่น',
                    ),
          ],
     ),

     Expanded(
       child: TabBarView(children:[
     

        firsttab(),

        secondtab(),

        thirdtab(),

       ]),
     ),
    
      ],
      ),
     ),
    );

  }
}