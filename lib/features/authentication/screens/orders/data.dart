class Order {
  String id;
  String canteen;
  double totalPrice;
  String status;
  List<OrderItem> orderItems = [];
  
  Order({required this.id, required this.canteen, required this.totalPrice, required this.status, required this.orderItems});
}

class OrderItem {
  String id;
  int count;
  MenuItem menuItem;
  
  OrderItem({required this.id, required this.count, required this.menuItem});
}

class MenuItem {
  String id;
  String name;
  String canteen;
  String image;
  double price;
  
  MenuItem({required this.id, required this.name, required this.canteen, required this.image, required this.price});
}