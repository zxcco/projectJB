import 'package:get/get.dart';
import 'package:login/111/list_data.dart';

class CartController1 extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    // Get.snackbar(
    //   "Product Added","You have added the ${product.name} to the cart",
    //   snackPosition: SnackPosition.BOTTOM,
    //   duration: Duration(seconds: 2) );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
  get email1 => user1;
  String user1 = "";
  String email(String user) {
    user1 = user;
    return user1;
  }

  get emailUser => user2;
  String user2 = "";
  String emailUser1(String user) {
    user2 = user;
    return user2;
  }

  void clearProduct() {
    _products.clear();
  }

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(0);

  get productName =>
      _products.entries.map((product) => product.key.name).toList();

  get productImg => _products.entries
      .map((product) => product.key.imageUrl * product.value)
      .toList();
}
// text_img= text_img ==null ? "" : text_img;