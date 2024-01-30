import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/home_screen/readData.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:food_store/graph/bar_graph.dart';
import 'package:firebase_database/firebase_database.dart';

// final databaseReference = FirebaseDatabase.instance
//     .ref("https://food-store-12f0f-default-rtdb.firebaseio.com/Food");

class HomeVendor extends StatefulWidget {
  @override
  State<HomeVendor> createState() => _HomeVendorState();
}

class _HomeVendorState extends State<HomeVendor> {
  List<String> checkIds = [];
  List<int> dailySummary = [];

  Future getId() async {
    await FirebaseFirestore.instance.collection('MenuItems').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            // print(element.reference);
            checkIds.add(element.reference.id);
            dailySummary.add(element.data()['count'] ?? 0);
          }),
        );
  }

  @override
  void initState() {
    // getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Today Sales - $formattedDate', // Include the formatted date
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Expanded(
            //     child: FutureBuilder(
            //   future: getId(),
            //   builder: (context, snapshot) {
            //     return ListView.builder(
            //       itemCount: checkIds.length,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           title: getMenu(
            //             MenuId: checkIds[index],
            //           ),
            //         );
            //       },
            //     );
            //   },
            // )),
            // const SizedBox(height: 10),
            SizedBox(
                height: 200,
                child: FutureBuilder(
                    future: getId(),
                    builder: (context, index) {
                      if (dailySummary.isEmpty) {
                        // Return a loading indicator or placeholder widget
                        return const CircularProgressIndicator();
                      } else {
                        return BarGraph(
                          dailySummary: dailySummary,
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
