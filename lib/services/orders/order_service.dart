import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_store/services/auth/auth_service.dart';

class OrderService {
  //create the instance of firestore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();
  //get the pending orders
  Stream<List<Map<String, dynamic>>> getPendingOrders() {
    //get the pending orders from the database


    final Stream<List<Map<String,dynamic>>> orderList =  _firestore
        .collection("PendingOrders")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final order = doc.data();
        return order;
      }).toList();});
    return orderList;
    
  }
  //get finished orders
  Stream<List<Map<String, dynamic>>> getFinishedOrders() {
    //get the finished orders from the database
    final Stream<List<Map<String,dynamic>>> orderList =  _firestore
        .collection("finished_orders")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final order = doc.data();
        return order;
      }).toList();});
    return orderList;
  }
  //mark as finished
  Future<void> markAsFinished(Map<String, dynamic> order) async {
    //mark the order as finished
    await _firestore.collection("finished_orders").add(order);
    await _firestore.collection("PendingOrders").doc(order['uid']).delete();
  }

  //delete the order
  Future<void> deleteOrder(Map<String, dynamic> order) async {
    //delete the order
    await _firestore.collection("PendingOrders").doc(order['uid']).delete();
  }

  //get the length of finisded orders
  Future<int> getFinishedOrdersLength() async {
    //get the length of finished orders
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection("finished_orders").get();
    return snapshot.docs.length;
  }

  //get the length of pending orders
  Future<int> getPendingOrdersLength() async {
    //get the length of pending orders
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
      .collection("PendingOrders")
      .where("merchantId", isEqualTo: _auth.getCurrentUser()!.uid)
      .get();
    return snapshot.docs.length;
  }
}