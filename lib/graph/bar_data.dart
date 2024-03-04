import 'package:food_store/graph/individual_bar.dart';

class BarData {
  final double burgerSold;
  final double pizzaSold;
  final double maggiSold;

  BarData(
      {required this.burgerSold,
      required this.pizzaSold,
      required this.maggiSold});

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: burgerSold),
      IndividualBar(x: 1, y: pizzaSold),
      IndividualBar(x: 2, y: maggiSold),
    ];
  }
}
