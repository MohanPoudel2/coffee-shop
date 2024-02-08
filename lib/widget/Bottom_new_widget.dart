import 'package:coffee_shop/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../provider/bottom_nev_provider/bottom_nev_provider.dart';

class BottomNevWidget extends StatelessWidget {
  const BottomNevWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (_, value, __) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: SalomonBottomBar(
              backgroundColor: AppColors.containerColor,
              duration:const Duration(seconds: 1),
              currentIndex: value.currentIndex,
                onTap: (index){
                value.currentIndex=index;
                },
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text("Home"),
                    selectedColor: Colors.lightBlue,
                  ),

                  /// Likes
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.favorite_border),
                    title: const Text("Favourite"),
                    selectedColor: Colors.lightBlue,
                  ),


                  SalomonBottomBarItem(
                    icon: const Icon(Icons.location_on_sharp),
                    title: const Text("Locations"),
                    selectedColor: Colors.lightBlue,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.shopping_cart),
                    title: const Text("Cart"),
                    selectedColor: Colors.lightBlue,
                  ),

                  /// Profile
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.person),
                    title: const Text("Profile"),
                    selectedColor: Colors.lightBlue,
                  ),
                ]
            ),
          ),
        );

      },

    );
  }
}