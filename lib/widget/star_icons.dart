import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class StarsIconWidget extends StatelessWidget {
  const StarsIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: const Row(
        children: [
          Icon(
            Icons.star,
            size: 16,
            color: AppColors.indicatorColor,
          ),
          Icon(
            Icons.star,
            size: 16,
            color: AppColors.indicatorColor,
          ),
          Icon(
            Icons.star,
            size: 16,
            color: AppColors.indicatorColor,
          ),
          Icon(
            Icons.star,
            size: 16,
            color: AppColors.indicatorColor,
          ),
          Icon(
            Icons.star_border,
            size: 16,
            color: AppColors.indicatorColor,
          ),
        ],
      ),
    );
  }
}