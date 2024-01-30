import 'package:firebase_database/firebase_database.dart';

void writeToFirebase() async {
  // Initialize Firebase
  FirebaseDatabase database = FirebaseDatabase.instance;

  // Reference to the root of your database
  DatabaseReference rootRef = database.ref();

  try {
    // Write data to the database
    await rootRef.child('menu').set({
      'Burger': 30,
      'Pizza': 50,
      'Noodles': 100,
    });

    print('Data written successfully.');
  } catch (error) {
    print('Error writing data: $error');
  }
}

void main() {
  writeToFirebase();
}
