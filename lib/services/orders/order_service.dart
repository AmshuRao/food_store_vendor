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
   await _firestore.collection("PendingOrders").doc(order['uid']).delete();

    // Change order status to 3 (finished)
    order['status'] = 3;

    // Add the order to "finished_orders" collection
    final DocumentReference orderRef = await _firestore.collection("finished_orders").add(order);
    final String orderId = orderRef.id; // Get the actual document UID

    order['uid'] = orderId; // Add the UID to the order
    await _firestore.collection("finished_orders").doc(orderId).update(order);
  }

  //delete the order
  Future<void> deleteOrder(Map<String, dynamic> order) async {
    //delete the order
    await _firestore.collection("PendingOrders").doc(order['uid']).delete();
  }

  //get the length of finisded orders
  Stream<int> getFinishedOrdersLength() {
    //get the length of finished orders
    return _firestore.collection("finished_orders").snapshots().map((snapshot) => snapshot.docs.length);
  }

  //get the length of pending orders
  Stream<int> getPendingOrdersLength() {
    //get the length of pending orders
    return _firestore
        .collection("PendingOrders")
        .where("merchantId", isEqualTo: _auth.getCurrentUser()!.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }
  //change the status of the order
  Future<void>changeStatus(Map<String, dynamic> order,int status)async
  {
      order['status'] = status; // Change order status to 2
      await _firestore.collection("finished_orders").doc(order['uid']).update(order);
  }
}