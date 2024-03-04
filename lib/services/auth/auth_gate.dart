import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:food_store/features/authentication/screens/home_screen/home.dart';
import 'package:food_store/features/authentication/screens/login/login.dart';
import 'package:food_store/navigation_menu.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //if user is loggd in
          if(snapshot.hasData)
          {
            return const BottomNavigationMenu();
          }
          else
          {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}