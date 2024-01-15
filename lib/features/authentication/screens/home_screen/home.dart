

import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/finish_order_screen.dart';
import 'package:food_store/features/authentication/screens/orders/pending_order_screen.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class HomeVendor extends StatelessWidget {
  const HomeVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0,),
            const Center(
              child: Text(
                "Vidyarthi Khaana",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
           const Center(
              child: Text(
                "Let's Start working !!!",
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 15.0,),
            const Image(
              image: AssetImage(AppImages.bmsLogo),
              height: 200.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.dark,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 10.0),
                    width: double.infinity,
                    height: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 2.0, 2.0),
                      child: Card(
                        elevation: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text(
                              "Pending orders",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "67",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(const PendingOrderScreen());
                                  },
                                  icon: const Icon(Icons.navigate_next_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              width: double.infinity,
              height: 60.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 2.0, 2.0, 2.0),
                child: Card(
                  elevation: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        "Finished orders",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "25",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(const FinishOrderScreen());
                            },
                            icon: const Icon(Icons.navigate_next_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
