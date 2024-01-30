import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/data.dart';
import 'package:food_store/services/orders/order_service.dart';
import 'package:get/get.dart';

class OrdersDropdownCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final Function(Order)? orderRemove;
  final Function(Order)? addOrder;
  final bool flag;

  OrdersDropdownCard({
    Key? key,
    required this.order,
    required this.flag,
    this.orderRemove,
    this.addOrder,
  }) : super(key: key);

  final OrderService _orderService = OrderService();

  @override
  Widget build(BuildContext context) {
    double sum = 0;

    if (order['orderItems'] != null) {
      for (var i = 0; i < order['orderItems']!.length; i++) {
        sum += order['orderItems']![i]["item"]['price'] * order['orderItems']![i]['count'];
      }
    }

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("${order['orderItems']?[0]["item"]['name']}-${order['orderItems']?[0]['id']}"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (order['orderItems'] != null)
                      for (var i = 0; i < order['orderItems']!.length; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${order['orderItems']![i]["item"]['name']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        '${order['orderItems']![i]['count']} X',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        '${order['orderItems']![i]["item"]['price']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 30.0),
                                      Text(
                                        '${order['orderItems']![i]["item"]['price'] * order['orderItems']![i]['count']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                            onCancel: () {},
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
                            barrierDismissible: true,
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
