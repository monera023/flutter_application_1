import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity
  int quatityCount = 0;

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      quatityCount--;
    });
  }

  // increment quantity

  void incrementQuantity() {
    setState(() {
      quatityCount++;
    });
  }

  void addTocart(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey[700],
        ),
        body: Column(
          children: [
            // listview of food details
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 150,
                  ),

                  const SizedBox(height: 25),

                  // rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),

                      const SizedBox(width: 10),

                      // rating number
                      Text(widget.food.rating,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // food name
                  Text(widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 28)),

                  const SizedBox(height: 25),

                  Text("Description",
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 10),

                  // food description
                  Text(
                    "Delight in the exquisite simplicity of our Salmon Sushi, where pristine slices of buttery salmon rest gracefully atop vinegared sushi rice. The salmon, sourced from the icy, pure waters of the Pacific, is meticulously selected for its vibrant color and rich, velvety texture. Each piece is crafted with precision, ensuring a perfect balance of flavors and textures that melt in your mouth. Accompanied by a touch of wasabi and a delicate brush of soy sauce, this sushi offers a harmonious blend of freshness and umami, making it a quintessential experience for sushi aficionados. Whether enjoyed on its own or as part of a larger sushi platter, our Salmon Sushi promises an authentic and memorable culinary journey",
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 2),
                  ),
                ],
              ),
            )),
            // price + quantity + add to cart button
            Container(
              color: primaryColor,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  // price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        "\$" + widget.food.price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      // quantity
                      Row(
                        children: [
                          // minus button
                          Container(
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: decrementQuantity,
                                  icon:
                                      Icon(Icons.remove, color: Colors.white))),

                          // quantity count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(quatityCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                              ),
                            ),
                          ),

                          // plus button
                          Container(
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: incrementQuantity,
                                  icon: Icon(Icons.add, color: Colors.white))),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  // add to cart button
                  MyButton(text: "Add to card", onTap: addTocart)
                ],
              ),
            )

            //
          ],
        ));
  }
}
