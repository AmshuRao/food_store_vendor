import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/signup/signup.dart';
import 'package:food_store/services/auth/auth_gate.dart';
import 'package:food_store/services/auth/auth_service.dart';
import 'package:food_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
void login() async {
  try {
    AuthService authService = AuthService();
    await authService.signInWithEmailAndPassword(
      emailController.text.toString(),
      passwordController.text.toString(),
    );
    MaterialPageRoute(builder:(context)=>const AuthGate(),
    );
  } catch (e) {
    AlertDialog(
      title: Text(e.toString()),
    );
  }
}
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
            controller: emailController,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: "Password",
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              // ignore: prefer_const_constructors
              onPressed: login,
              child: const Text("Login"),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder:(context)=>const SignupScreen(),
                   ),
          );
                },
              child: const Text("Create Account"),
              ),
            ),
        ],
      ),
    );
  }
}
