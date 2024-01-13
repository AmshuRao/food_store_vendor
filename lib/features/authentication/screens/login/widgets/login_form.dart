import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/signup/signup.dart';
import 'package:food_store/navigation_menu.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: "E-mail",
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: "Password",
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            obscureText: true,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const BottomNavigationMenu()),
              child: const Text("Login"),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              child: const Text("Create account"),
            ),
          ),
        ],
      ),
    );
  }
}
