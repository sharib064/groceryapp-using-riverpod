import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

// class CartModel extends ChangeNotifier {
//   final List _shopItems = [
//     ["Avacado", "20", "lib/images/avacado.png", Colors.green],
//     ["Banana", "10", "lib/images/banana.png", Colors.yellow],
//     ["Chicken", "30", "lib/images/chicken.png", Colors.brown],
//     ["Water", "5", "lib/images/water.png", Colors.blue],
//   ];
//   List get shopItems => _shopItems;
//   final List _userCart = [];

//   List get userCart => _userCart;

//   void addCartItem(int index) {
//     _userCart.add(_shopItems[index]);
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _userCart.removeAt(index);
//     notifyListeners();
//   }

//   String getTotal() {
//     double totalPrice = 0;
//     for (int i = 0; i < _userCart.length; i++) {
//       totalPrice += double.parse(_userCart[i][1]);
//     }
//     return totalPrice.toStringAsFixed(2);
//   }
// }

List shopItems = [
  ["Avacado", "20", "lib/images/avacado.png", Colors.green],
  ["Banana", "10", "lib/images/banana.png", Colors.yellow],
  ["Chicken", "30", "lib/images/chicken.png", Colors.brown],
  ["Water", "5", "lib/images/water.png", Colors.blue],
];

final shopItemsProvider = Provider(
  (ref) => shopItems,
);

class UserCart extends Notifier<List> {
  @override
  List build() {
    return [];
  }

  void addCartItem(int index) {
    state = [...state, ref.read(shopItemsProvider)[index]];
  }

  void removeItem(int index) {
    final newState = List.from(state);
    newState.removeAt(index);
    state = newState;
  }

  String getTotal() {
    double totalPrice = 0;
    for (int i = 0; i < state.length; i++) {
      totalPrice += double.parse(state[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

final userCartProvider = NotifierProvider<UserCart, List>(
  () => UserCart(),
);
