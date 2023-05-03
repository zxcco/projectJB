import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/111/cart_controllers.dart';

class CartTotal1 extends StatelessWidget {
  final CartController1 controller = Get.find();

  CartTotal1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'ยอดเงินทั้งหมด',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Schyler"),
          ),
          Text(
            '${controller.total} บาท',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Schyler"),
          )
        ]),
      ),
    );
  }
}
