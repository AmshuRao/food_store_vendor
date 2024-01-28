import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  String name;
  String transactionID;
  List<String> orders=[];
  List<double> amount=[];
  Timestamp time;
  Orders({required this.name,required this.transactionID,required this.orders,required this.amount,required this.time});
}