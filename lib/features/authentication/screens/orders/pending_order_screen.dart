import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/order_controller.dart';
import 'package:get/get.dart';
import 'package:food_store/utils/constants/colors.dart';

class PendingOrderScreen extends GetView<OrderController> {
  const PendingOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          icon: const Icon(
            Icons.navigate_before_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            ...orders.map(
              (order) {
                return Card(
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        print('hello');
                        // Show the snackbar when swiped
                        Get.defaultDialog(
                          title: "Confirm Order",
                          content: const Text(
                              "Are you sure you want to confirm this order?"),
                          textConfirm: "Confirm",
                          textCancel: "Cancel",
                          onConfirm: () {
                            controller.removeOrder(order);
                            Get.back();
                          },
                          onCancel: () {
                            // controller.addOrder(order);
                            
                          },
                        );
                      }
                    },
                    background: Container(
                      color: Color.fromARGB(255, 0, 68, 255),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        "Order Name: ${order.name}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: DropdownButton<String>(
                        hint: Text('Ordered Items'),
                        value:
                            null, // You may need to manage the selected value
                        onChanged: (String? value) {
                          // Handle dropdown value change
                          // You may want to update the state or perform other actions
                          // based on the selected value
                        },
                        items: order.orders.map<DropdownMenuItem<String>>(
                          (String foodItem) {
                            int index = order.orders.indexOf(foodItem);
                            return DropdownMenuItem<String>(
                              value: foodItem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("- $foodItem x${order.quantity[index]}"),
                                  Text(
                                      "  :  Rs. ${order.amount[index] * order.quantity[index]}"),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
