// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/home_screen/home.dart';
import 'package:food_store/features/authentication/screens/orders/finish_order_screen.dart';
import 'package:food_store/features/authentication/screens/orders/pending_order_screen.dart';
import 'package:food_store/features/authentication/screens/profile/profilepage.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: isDarkMode ? AppColors.dark : AppColors.white,
        indicatorColor: isDarkMode
            ? AppColors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.clock),
            label: "Pending",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.check),
            label: "Finished",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomeVendor(),
          PendingOrderScreen(),
          FinishOrderScreen(),
          //i just neeed to add the profile screen in here
          profilePageScreen(),
        ],
      ),
    );
  }
}
