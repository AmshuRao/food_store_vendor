import 'package:food_store/features/authentication/screens/orders/data.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<Orders> pendingOrders = <Orders>[
    Orders(
        name: "Rahul",
        transactionID: "1234",
        orders: ["Pizza", "Burger"],
        quantity: [2, 1],
        amount: [200.0, 50.0],
        time: DateTime.now()),
    Orders(
        name: "kiran",
        transactionID: "1234",
        orders: ["Pizza", "Burger"],
        quantity: [2, 1],
        amount: [200.0, 50.0],
        time: DateTime.now()),
    Orders(
        name: "Bob",
        transactionID: "1234",
        orders: ["Pizza", "Burger"],
        quantity: [2, 1],
        amount: [200.0, 50.0],
        time: DateTime.now()),
  ].obs;
  RxList<Orders> finsihedOrders = <Orders>[
    Orders(
        name: "Rahul",
        transactionID: "1234",
        orders: ["Pizza", "Burger"],
        quantity: [2, 1],
        amount: [200.0, 50.0],
        time: DateTime.now()),
    Orders(
        name: "kiran",
        transactionID: "1234",
        orders: ["Pizza", "Burger"],
        quantity: [2, 1],
        amount: [200.0, 50.0],
        time: DateTime.now()),
    Orders(
        name: "Bob",
        transactionID: "1234",
        orders: ["Pizza", "Burger"],
        quantity: [2, 1],
        amount: [200.0, 50.0],
        time: DateTime.now()),
  ].obs;
  void removeOrder(Orders order) {
    pendingOrders.remove(order);
  }

  void addOrder(Orders order) {
    finsihedOrders.add(order);
  }
}
