import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  List foodMenu = [
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

  // navigate to food item details page
  void navigateToFoodDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailsPage(food: foodMenu[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.grey[900],
          ),
          title: Text(
            'Tokyo',
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo banner
            Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // promo message
                        Text(
                          'Get 32% Promo',
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20, color: Colors.white),
                        ),

                        const SizedBox(height: 20),
                        // redeem message
                        MyButton(text: 'Redeem', onTap: () {})
                      ],
                    ),
                    // image
                    Image.asset(
                      'lib/images/sushi.png',
                      height: 100,
                    )
                  ],
                )),

            const SizedBox(height: 25),

            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search here.."),
              ),
            ),

            const SizedBox(height: 20),
            // menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Food Menu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18),
              ),
            ),

            const SizedBox(height: 10),

            //popular food
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            )),

            const SizedBox(height: 10),

            // popular food
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // image
                      Image.asset(
                        'lib/images/tuna.png',
                        height: 40,
                      ),

                      const SizedBox(width: 20),
                      // name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name
                          Text("Tuna tuna",
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18)),

                          const SizedBox(height: 5),

                          // price
                          Text(
                            '\$21.00',
                            style: TextStyle(color: Colors.grey[700]),
                          )

                          // price
                        ],
                      ),
                    ],
                  ),

                  // heart
                  Icon(Icons.favorite_outline,
                      color: Colors.grey[700], size: 28)
                ],
              ),
            )
          ],
        ));
  }
}
