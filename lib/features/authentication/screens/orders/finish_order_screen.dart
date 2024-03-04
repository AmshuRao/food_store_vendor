import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/orders/expansion_widget.dart';
import 'package:food_store/services/orders/order_service.dart';
import 'package:food_store/utils/constants/colors.dart';

class FinishOrderScreen extends StatefulWidget{
  const FinishOrderScreen({super.key});
 
  @override
  State<FinishOrderScreen> createState() => _FinishOrderScreenState();
}
final OrderService _orderService = OrderService();
class _FinishOrderScreenState extends State<FinishOrderScreen> {
  @override
  Widget build(BuildContext context) {
   // final orders = controller.finsihedOrders;
 
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
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
        stream: _orderService.getFinishedOrders(),
        builder: ((context, snapshot)  {
          if(snapshot.hasError)
          {
            return const Text("Error");
          }
          else if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Text("Loading");
          }
          else
          {
            return ListView(
              children: snapshot.data!.map<Widget>((orderData) => OrdersDropdownCard(order:orderData,flag:false)).toList(),
            );
          }
        })
        )
    );
  }
}
