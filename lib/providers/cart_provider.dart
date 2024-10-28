import 'package:final_proj_flutter/models/cart_item_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  void addItem(CartItemModel item) {
    bool isExist = false;
    for (var i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].productName == item.productName) {
        isExist = true;
        _cartItems[i].quantity++;
      }
    }
    if (!isExist) {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].increaseQuantity();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    _cartItems[index].decreaseQuantity();
    notifyListeners();
  }
}
