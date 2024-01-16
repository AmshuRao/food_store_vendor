import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/expansion_widget.dart';
import 'package:food_store/features/authentication/screens/orders/order_controller.dart';
import 'package:food_store/utils/constants/colors.dart';
import 'package:get/get.dart';

class FinishOrderScreen extends GetView<OrderController> {
  const FinishOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = controller.finsihedOrders;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Finished Orders",
          style: TextStyle(
            color: AppColors.textWhite,
          ),
        ),
        leading: IconButton(
          icon:const Icon(
            Icons.navigate_before_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body:  Column(
        children:[
          ...orders.map((order){
            return OrdersDropdownCard(order:order,flag:false);
          })
        ]
        ),
    );
  }
}