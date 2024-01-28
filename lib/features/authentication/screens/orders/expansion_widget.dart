import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/data.dart';
import 'package:food_store/services/orders/order_service.dart';
import 'package:get/get.dart';

class OrdersDropdownCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final Function(Orders)? orderRemove;
  final Function(Orders)? addOrder;
  final bool flag;

  OrdersDropdownCard({
    super.key,
    required this.order,
    required this.flag,
    this.orderRemove,
    this.addOrder,
  });
final OrderService _orderService = OrderService();
  @override
  Widget build(BuildContext context) {
    double sum = 0;
    for (var i = 0; i < order['amount'].length; i++) {
      sum += order['amount'][i];
    }
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("${order['name']}-${order['transactionID']}"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < order['orders'].length; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              order['orders'][i],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            order['amount'][i].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 15.0),
                const Divider(), // Add horizontal line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$sum',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                if (flag)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Confirm Order",
                            content: const Text("Are you sure you want to confirm this order?"),
                            textConfirm: "Confirm",
                            textCancel: "Cancel",
                            onConfirm: () {
                              _orderService.markAsFinished(order);
                            Get.back();
                            },
                            onCancel: () {
                              
                            },
                            barrierDismissible: true,
                             // Add this line
                         
                          );
                        },
                        child: const Text("Finish Order"),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Cancel Order",
                            content: const Text("Are you sure you want to cancel this order?"),
                            textConfirm: "Confirm",
                            textCancel: "Cancel",
                            onConfirm: () {
                             _orderService.deleteOrder(order);
                              Get.back();
                            },
                           barrierDismissible: true
                          );
                        },
                        child: const Text("Cancel Order"),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
