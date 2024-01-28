

import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/finish_order_screen.dart';
import 'package:food_store/features/authentication/screens/orders/pending_order_screen.dart';
import 'package:food_store/services/orders/order_service.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:food_store/utils/constants/image_strings.dart';

class HomeVendor extends StatelessWidget {
  HomeVendor({Key? key}) : super(key: key);
final OrderService _orderService = OrderService();

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
                                FutureBuilder<int>(
                                  future: _orderService.getPendingOrdersLength(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return Text(
                                        snapshot.data.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                      Navigator.push(context,MaterialPageRoute(builder:(context)=>const PendingOrderScreen(),
                                      ));
                                  
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
                          FutureBuilder<int>(
                            future: _orderService.getFinishedOrdersLength(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text(
                                  snapshot.data.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                );
                              }
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>const FinishOrderScreen(),
                              ));
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
