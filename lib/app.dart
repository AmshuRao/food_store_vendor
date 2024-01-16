import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:food_store/features/authentication/screens/orders/order_controller.dart';
import 'package:food_store/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BMSCE store",
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
       initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
class GeneralBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
