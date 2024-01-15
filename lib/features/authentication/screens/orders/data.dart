class Orders {
  String name;
  String transactionID;
  List<String> orders=[];
  List<double> amount=[];
  DateTime time;
  Orders({required this.name,required this.transactionID,required this.orders,required this.amount,required this.time});
}