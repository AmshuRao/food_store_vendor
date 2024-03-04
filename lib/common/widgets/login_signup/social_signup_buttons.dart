import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';

class SocialSignupButtons extends StatelessWidget {
  const SocialSignupButtons({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? AppColors.darkGrey : AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Image(
              image: AssetImage("assets/logos/google-icon.png"),
              width: AppSizes.iconLg,
              height: AppSizes.iconLg,
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? AppColors.darkGrey : AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Image(
              image: AssetImage("assets/logos/facebook-icon.png"),
              width: AppSizes.iconLg,
              height: AppSizes.iconLg,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
