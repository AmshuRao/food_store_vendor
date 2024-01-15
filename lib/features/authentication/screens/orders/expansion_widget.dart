import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/data.dart';
import 'package:get/get.dart';

class OrdersDropdownCard extends StatelessWidget {
 final Orders order;
 final Function(Orders)? orderRemove;
 final Function(Orders)? addOrder ;
 final bool flag;
  const OrdersDropdownCard({super.key, required this.order,required this.flag,this.orderRemove,this.addOrder});
    

 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text('${order.name} - ${order.transactionID}'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Order: ${order.orders.join(", ")}'),
                const SizedBox(height: 8.0),
                Text('Amounts: ${order.amount.join(", ")}'),
                const SizedBox(height: 8.0),
                Text('Time: ${order.time.toString()}'),
                const SizedBox(height: 15.0),
                if(flag)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: (){
                        Get.defaultDialog(
                  title: "Confirm Order",
                  content: const Text("Are you sure you want to confirm this order?"),
                  textConfirm: "Confirm",
                  textCancel: "Cancel",
                  onConfirm: () {
                  
                      addOrder!(order);
                    orderRemove!(order);
                    Get.back();
                  },
                  onCancel: () {
                    Get.back();
                  },
                );
                      },
                      child: const Text("Finish Order"),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.defaultDialog(
                  title: "Confirm Order",
                  content: const Text("Are you sure you want to confirm this order?"),
                  textConfirm: "Confirm",
                  textCancel: "Cancel",
                  onConfirm: () {
                    orderRemove!(order);
                    Get.back();
                  },
                  onCancel: () {
                    Get.back();
                  },
                );
                      },
                      child: const Text("Cancel Order"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
