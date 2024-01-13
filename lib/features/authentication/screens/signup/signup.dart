import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/login_signup/form_divider.dart';
import 'package:food_store/common/widgets/login_signup/social_signup_buttons.dart';
import 'package:food_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const SingupForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              const FormDivider(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              SocialSignupButtons(isDarkMode: isDarkMode),
            ],
          ),
        ),
      ),
    );
  }
}
