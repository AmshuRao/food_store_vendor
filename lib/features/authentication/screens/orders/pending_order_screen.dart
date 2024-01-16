import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/expansion_widget.dart';
import 'package:food_store/features/authentication/screens/orders/order_controller.dart';
import 'package:food_store/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:food_store/utils/constants/colors.dart';

class PendingOrderScreen extends GetView<OrderController> {
  const PendingOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //this is the priority queue of orderes
    final orders = controller.pendingOrders;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pending Orders",
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
      body:  Obx(()=>Column(
        children:[
          ...orders.map((order) {
            return OrdersDropdownCard(order: order,orderRemove:(order){
             controller.removeOrder(order);
            },addOrder:(order){
              controller.addOrder(order);
            },flag:true);
          }).toList(),
        ]
        )
      ),
    );
  }
}