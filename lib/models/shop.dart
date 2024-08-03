import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  List<Food> _foodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "21.0",
        imagePath: "lib/images/salmon.png",
        rating: "4.9"),
    Food(
        name: "Tuna",
        price: "18.0",
        imagePath: "lib/images/tuna.png",
        rating: "4.5")
  ];

  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food fooditem, int quantity) {
   for(int i = 0; i < quantity; i++) {
     _cart.add(fooditem);
   }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

}