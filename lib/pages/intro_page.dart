import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 43, 36),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // shop name
            const SizedBox(height: 10),
            
            Text("SUSHI MAN", 
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 10),

            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi.png'),
            ),

            const SizedBox(height: 10),

            // title
            Text("THE TASTE OF JAPANESE FOOD", 
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 24,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 10),

            // subtitle
            Text("Feel the taste of most popular Japanese food from anywhere and anytime", 
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            const SizedBox(height: 10),
            MyButton(
              text: "Getting Started",
              onTap: () {
                // go to menu
                Navigator.pushNamed(context, '/menupage');
              },
            )
        ]),
      ),
    );
  }
}