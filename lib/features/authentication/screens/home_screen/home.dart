import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_store/graph/bar_graph.dart';

class HomeVendor extends StatefulWidget {
  const HomeVendor({Key? key}) : super(key: key);

  @override
  State<HomeVendor> createState() => _HomeVendorState();
}

class _HomeVendorState extends State<HomeVendor> {
  List<String> checkIds = [];
  List<double> dailySummary = [];
  bool isDataLoaded = false;
  int pendingOrdersCount = 0;
  int finishedOrdersCount = 0;

  Future<void> getId() async {
    FirebaseFirestore.instance.collection('MenuItems').get().then((snapshot) {
      snapshot.docs.forEach((element) {
        checkIds.add(element.reference.id);
        dailySummary.add((element.data()['count'] ?? 0));
        setState(() {
          isDataLoaded = true;
        });
      });
    });
  }

  Future<void> fetchOrderCounts() async {
    // Fetch pending orders count
    QuerySnapshot pendingOrdersSnapshot =
        await FirebaseFirestore.instance.collection('PendingOrders').get();
    pendingOrdersCount = pendingOrdersSnapshot.size;

    // Fetch finished orders count
    QuerySnapshot finishedOrdersSnapshot =
        await FirebaseFirestore.instance.collection('finished_orders').get();
    finishedOrdersCount = finishedOrdersSnapshot.size;
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer
  }

  void startTimer() {
    // Set up a periodic timer to refresh data every 30 seconds
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    await getId();
    await fetchOrderCounts();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatBox('Pending Orders', pendingOrdersCount),
                _buildStatBox('Finished Orders', finishedOrdersCount),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Today Sales - $formattedDate',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (isDataLoaded)
              SizedBox(
                height: 200,
                child: BarGraph(
                  dailySummary: dailySummary,
                ),
              )
            else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String title, int count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue, // You can change the color as per your preference
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
