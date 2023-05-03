import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/111/catalog_products%201.dart';
import 'package:login/111/list_data.dart';
import 'package:login/111/cart_controllers.dart';
import 'package:login/111/product_controller.dart';

class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController1());

  CatalogProducts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (BuildContext context,int index){
            return CatalogProductsCard(index : index);
        }
        )),
    );
  }

}
class CatalogProductsCard extends StatelessWidget {
  final cartController = Get.put(CartController1());
  final ProductController1 productController = Get.find();
  final int index;
    CatalogProductsCard({ 
      Key? key ,
      required this.index,
    }) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Card(
      //  padding: const EdgeInsets.symmetric(
      //   horizontal: 20,
      //   vertical: 10,
      //  ),

       child: ListTile(
                       leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                           productController.products[index].imageUrl,),
                             radius : 40 ,
                            ),
                            title: Text(productController.products[index].name,
           style: TextStyle(fontSize: 30),
                            ),  
            subtitle: Text('ราคา '+ ' ${productController.products[index].price} '+' บาท'),
          //   radius:40,
          //   backgroundImage: NetworkImage(
          //     productController.products[index].imageUrl,
          //   ),
          // ),
          // SizedBox(width: 20,),
          
          // Expanded(child: 
          //  Text(productController.products[index].name,
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 18,
            
          // ),),
          onTap: (){
            cartController.addProduct(productController.products[index]);
          },
          
          // ),
          // Expanded(
          //   child: Text('${productController.products[index].price}'),
          // ),
        //   IconButton(
        //   onPressed: () {
        //     cartController.addProduct(productController.products[index]);
        //   },
        //  icon:Icon(
        //   Icons.add_circle,
        //  ))
          
       
        ),
        );
     
   }


}
 
 