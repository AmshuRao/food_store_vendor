
import 'package:flutter/material.dart';
import 'package:food_store/services/auth/auth_gate.dart';
import 'package:food_store/services/auth/auth_service.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SingupForm extends StatelessWidget {
  SingupForm({
    super.key,
  });
final TextEditingController _firstnameController = TextEditingController();
final TextEditingController _lastnameController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
void signUp() async {
  try {
    AuthService authService = AuthService();
    await authService.signUpWithEmailAndPassword(
      _emailController.text.toString(),
       _passwordController.text.toString(),
      _firstnameController.text.toString(),
      _lastnameController.text.toString(),
      _usernameController.text.toString(),
      _phoneController.text.toString(),
    );
    MaterialPageRoute(builder:(context)=>const AuthGate(),
    );
  } catch (e) {
    AlertDialog(
      title: Text(e.toString()));
  }
}
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "Firstname",
                  ),
                  controller: _firstnameController,
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Lastname",
                  ),
                  controller: _lastnameController,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: "Username",
            ),
            controller: _usernameController,
            obscureText: true,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: "E-mail",
            ),
            controller: _emailController,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: "Phone number",
            ),
            controller: _phoneController,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: "Password",
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: signUp,
              child: const Text("Create"),
            ),
          ),
        ],
      ),
    );
  }
}
