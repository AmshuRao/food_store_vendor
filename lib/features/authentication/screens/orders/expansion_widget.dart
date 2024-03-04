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

    if (order['orders'] != null) {
      for (var i = 0; i < order['orders']!.length; i++) {
        sum += order['orders']![i]["item"]['price'] * order['orders']![i]['count'];
      }
    }

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("${order['orders']?[0]["item"]['name']}-${order['uid']}"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (order['orders'] != null)
                  DataTable(
                    columnSpacing: 20.0, // Increase the column spacing for more space
                    columns: const [
                      DataColumn(label: Text('Item')),
                      DataColumn(label: Text('Count')),
                      DataColumn(label: Text('Price')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: List<DataRow>.generate(
                      order['orders'].length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(
                            '${order['orders']?[index]["item"]['name']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '${order['orders']?[index]['count']} X',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '${order['orders']?[index]["item"]['price']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '${order['orders']?[index]["item"]['price'] * order['orders']![index]['count']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ],
                      ),
                    ),
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
