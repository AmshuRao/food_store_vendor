// ignore_for_file: depend_on_referenced_packages, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_store/features/authentication/screens/home_screen/readData.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:food_store/graph/bar_graph.dart';

class HomeVendor extends StatefulWidget {
  const HomeVendor({Key? key}) : super(key: key);

  @override
  State<HomeVendor> createState() => _HomeVendorState();
}

class _HomeVendorState extends State<HomeVendor> {
  @override
  Widget build(BuildContext context) {
    // Get the current date
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Today Sales - $formattedDate',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('MenuItems').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<String> checkIds = [];
                          List<double> dailySummary = [];
                          snapshot.data!.docs.forEach((element) {
                            checkIds.add(element.reference.id);
                            dailySummary.add((element.data() as Map<String, dynamic>?)?['count']?.toDouble() ?? 0);
                          });
                          return ListView.builder(
                            itemCount: checkIds.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: getMenu(
                                  MenuId: checkIds[index],
                                ),
                                subtitle: Text(
                                  'Item Count: ${dailySummary[index]}',
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('MenuItems').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<double> dailySummary = [];
                          snapshot.data!.docs.forEach((element) {
                            dailySummary.add((element.data() as Map<String, dynamic>?)?['count']?.toDouble() ?? 0);
                          });
                          if (dailySummary.isEmpty) {
                            return const CircularProgressIndicator();
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: BarGraph(
                                dailySummary: dailySummary,
                              ),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    }
  } // Add the missing closing square bracket ']' and closing parenthesis ')' here.

