import 'package:flutter/material.dart';
import 'package:food_store/common/widgets/login_signup/form_divider.dart';
import 'package:food_store/common/widgets/login_signup/social_signup_buttons.dart';
import 'package:food_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:food_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:food_store/utils/helper/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appBarHeight,
            left: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
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
