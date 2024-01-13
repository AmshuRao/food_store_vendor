import 'package:flutter/material.dart';
import 'package:food_store/utils/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            height: 100,
            image: AssetImage("assets/logos/bmsce-logo.png"),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Text(
            "Welcome Back",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Text(
            "Discover Limitless Choices and Unmatched Convenience.",
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
