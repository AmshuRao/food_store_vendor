import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_store/graph/bar_data.dart';
import 'package:get/get.dart';

class BarGraph extends StatelessWidget {
  final List dailySummary;
  const BarGraph({super.key, required this.dailySummary});

  @override
  Widget build(BuildContext context) {
    BarData myData = BarData(
        burgerSold: dailySummary[0],
        pizzaSold: dailySummary[1],
        maggiSold: dailySummary[2]);

    myData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 120,
        minY: 0,
        gridData: FlGridData(show: false),
        // borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
              reservedSize: 25,
            ),
          ),
        ),
        barGroups: myData.barData
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.blue,
                      width: 20,
                      borderRadius: BorderRadius.circular(3),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 120,
                        color: const Color.fromARGB(255, 32, 32, 32),
                      ),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'Bisibele bath',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'Veg fried maggi',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'Burger',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
