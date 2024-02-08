import 'package:coffee_shop/pages/profile.dart';
import 'package:coffee_shop/pages/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_nev_provider/bottom_nev_provider.dart';
import '../widget/Bottom_new_widget.dart';
import 'favourite_page.dart';
import 'home_page.dart';
import 'location_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {


    List<Widget> bodyList = [
      const HomePage(),
      const FavouritePage(),
      const LocationPage(),
      const ShoppingCartPage(),
      const Profile()
    ];

    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(
        builder: (_, value, __) {
          return bodyList[value.currentIndex];
        },
      ),
      bottomNavigationBar: const BottomNevWidget(),
    );
  }
}


