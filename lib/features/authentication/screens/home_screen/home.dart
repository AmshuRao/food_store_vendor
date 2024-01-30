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

  Future<void> getId() async {
    await FirebaseFirestore.instance.collection('MenuItems').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            checkIds.add(element.reference.id);
            dailySummary.add((element.data()['count'] ?? 0));
          }),
        );
    setState(() {
      isDataLoaded = true; // Set the flag to true after data is loaded
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer
  }

  void startTimer() {
    // Set up a periodic timer to refresh data every 30 seconds
    Timer.periodic(Duration(seconds: 30), (Timer timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    await getId();
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
}
