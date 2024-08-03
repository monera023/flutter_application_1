import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/themes/colors.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // CART
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                // get food from cart
                final Food food = value.cart[index];
                
                // get food name
                final String foodName = food.name;
              
                // get food price
                final String foodPrice = food.price;
              
                // return list tile
                return Container(
                  decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: ListTile(
                    title: Text(
                      foodName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    subtitle: Text(foodPrice),
                    trailing: IconButton(
                      onPressed: () => removeFromCart(food, context),
                      icon: const Icon(Icons.delete)
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {}
              ),
            )
          ],
        )
      )
    );
  }
}