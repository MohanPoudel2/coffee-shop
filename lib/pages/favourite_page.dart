import 'package:coffee_shop/const/text_style.dart';
import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation:2,
                      color: AppColors.bgColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/demo.jpg'
                          ),
                          radius: 60,
                        ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cappuccino',style: TextStyles.mediumText.copyWith(fontSize:18 ),
                              ),
                              Text(
                                'with Chocolate',style: TextStyles.smallText.copyWith(fontSize: 12),
                              ),
                              Text(
                                '\$10',style: TextStyles.tabText3.copyWith(fontSize: 12),
                              ),

                            ],
                          ),
                          IconButton(onPressed: (){}, icon:const Icon(Icons.favorite,color: AppColors.indicatorColor,))

                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
