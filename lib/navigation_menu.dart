import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/home_screen/home.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/helper/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final bool isDarkMode = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDarkMode ? AppColors.dark : AppColors.white,
          indicatorColor: isDarkMode
              ? AppColors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          selectedIndex: controller.index.value,
          onDestinationSelected: (index) => controller.index.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: "Canteen",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.bill),
              label: "Orders",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.index.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt index = 0.obs;
  
  final screens = [
   const HomeVendor(),
  ];
}

