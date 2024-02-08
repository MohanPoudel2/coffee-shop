import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../const/text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.containerColor,
          hintText: 'Search your favourite Coffee',
          hintStyle: TextStyles.smallText,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.iconColor,
            size: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(35))),
    );
  }
}
