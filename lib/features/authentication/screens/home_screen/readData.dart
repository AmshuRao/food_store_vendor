
// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class getMenu extends StatelessWidget {
  // const getMenu({super.key});

  final String MenuId;

  const getMenu({super.key, required this.MenuId});

  @override
  Widget build(BuildContext context) {
    CollectionReference Menu =
        FirebaseFirestore.instance.collection('MenuItems');

    // DocumentReference documentReference = Menu.doc(MenuId);

    return FutureBuilder<DocumentSnapshot>(
      future: Menu.doc(MenuId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Item: ${data['name']}');
        }

        return const Text('loading...');
      },
    );
  }
}
