import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/data.dart';
import 'package:get/get.dart';

class OrdersDropdownCard extends StatelessWidget {
 final Orders order;
 final Function(Orders)? orderRemove;
 final Function(Orders)? addOrder ;
 final bool flag;
  const OrdersDropdownCard({super.key, required this.order, required this.flag, this.orderRemove, this.addOrder});
    

 
  @override
  Widget build(BuildContext context) {
    double sum=0;
    for(int i=0;i<order.amount.length;i++)
    {
      sum+=order.amount[i];
    }
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text('${order.name} - ${order.transactionID}'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:[
                  for(int i=0;i<order.orders.length;i++)

                  Row(
                    children: [
                      Text(order.orders[i]),
                      const SizedBox(width: 10.0),
                      Text('${order.amount[i]}'),
                    ],
                  ),
                  ],
                ),
                 Row(
                    children: [
                      const Text('Total:'),
                      const SizedBox(width: 10.0),
                      Text('$sum'),
                    ],
                  ),
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
