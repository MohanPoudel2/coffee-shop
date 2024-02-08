import 'package:coffee_shop/pages/bottom_nev_bar.dart';
import 'package:flutter/material.dart';

import '../const/text_style.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_coffee.jpg'),
                    fit: BoxFit.fill)),
          ),
          Positioned(
              top: screenHeight * 0.05, // 5% from the top
              left: screenWidth * 0.05, // 5% from the left
              child: const Text('Coffee so good,\nyour taste buds\nwill love it',
                  style: TextStyles.bigText)),
          Positioned(
            left: screenWidth * 0.05, // 5% from the left
            top: screenHeight * 0.3, // 30% from the top
            child: const Text(
              'The best grain,the finest roast,the\npowerful flavor',
              style: TextStyles.smallText,
            ),
          ),
          Positioned(
              bottom: screenHeight * 0.01, // 1% from the bottom
              left: screenWidth * 0.1, // 10% from the left
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNav(),));
                },
                child: Container(
                  width: screenWidth * 0.8, // 80% of screen width
                  height: screenHeight * 0.08, // 10% of screen height
                  decoration: BoxDecoration(
                      color: Colors.teal[800],
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyles.buttonText,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

