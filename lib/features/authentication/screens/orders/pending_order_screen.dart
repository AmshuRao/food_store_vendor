import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/expansion_widget.dart';
import 'package:food_store/services/orders/order_service.dart';
import 'package:food_store/utils/constants/colors.dart';

class PendingOrderScreen extends StatefulWidget {
  const PendingOrderScreen({Key? key}) : super(key: key);

  @override
  State<PendingOrderScreen> createState() => _PendingOrderScreenState();
}

final OrderService _orderService = OrderService();

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  @override
  Widget build(BuildContext context) {
    //this is the priority queue of orderes

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
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
        stream: _orderService.getPendingOrders(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          } else {
            if (snapshot.hasData && snapshot.data != null && snapshot.data!.isEmpty) {
              return const Text("No pending orders");
            } else {
              return ListView(
                children: snapshot.data!.map<Widget>((orderData) => OrdersDropdownCard(order: orderData, flag: true)).toList(),
              );
            }
          }
        }),
      ),
    );
  }
}