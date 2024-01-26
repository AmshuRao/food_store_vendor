class Orders {
  String name;
  String transactionID;
  List<String> orders = [];
  List<double> amount = [];
  List<int> quantity = [];
  DateTime time;
  Orders(
      {required this.name,
      required this.transactionID,
      required this.orders,
      required this.quantity,
      required this.amount,
      required this.time});
}
