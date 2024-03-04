// ignore_for_file: camel_case_types, unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_store/services/auth/auth_service.dart';

class profilePageScreen extends StatefulWidget {
  const profilePageScreen({Key? key}) : super(key: key);

  @override
  State<profilePageScreen> createState() => _profilePageScreenState();
}

final AuthService _auth = AuthService();

class _profilePageScreenState extends State<profilePageScreen> {
  late Future<String?> userEmail;
  late String currentPassword = '';
  late String newPassword = '';
  late String confirmPassword = '';

  @override
  void initState() {
    super.initState();
    userEmail = _auth.getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 110),
            child: buildCoverImage()),
        Positioned(top: 288 - 72, child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://bbsstatic.oppo.com/upload/image/front/thread/20221122/1550688128564219511/1204871070403264520/1204871070403264520.jpg',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => Container(
        padding:
            const EdgeInsets.all(8.0), // Padding to control the width of the border
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // Border color
            width: 4.0, // Border width
          ),
        ),
        child: CircleAvatar(
          radius: 72,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: const NetworkImage(
            'https://lh3.googleusercontent.com/7jIqu_lUNX9I3btfDzRne6FqUTX7ErIgaDXoMBpc_AspfZaG6kjKoAWhA6VzWn5Owf2t_3t_XdzRCqUPN4yOcunuzUCK=w256-rw',
          ),
        ),
      );

  Widget buildContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildSocialIcon(FontAwesomeIcons.googlePay)],
            ),
            const SizedBox(height: 8),
            const Text(
              'Vidyarthi Khana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            FutureBuilder<String?>(
              future: userEmail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Error retrieving email',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _showChangePasswordDialog();
              },
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: 200), // Adjust the maximum width as needed
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock),
                      SizedBox(
                          width: 8), // Add some space between the icon and text
                      Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: () {
                _auth.signOut();
                // Implement logout functionality
                // For example, you can use Firebase Authentication sign out method
              },
              icon: const Icon(Icons.logout),
              iconSize: 40.0, // Set the size of the icon as needed
              color: Colors.white, // Set the color of the icon
              splashRadius:
                  30.0, // Set the splash radius for the circular effect
              padding: const EdgeInsets.all(16.0), // Padding around the icon
              constraints:
                  const BoxConstraints(), // Remove constraints to allow circular shape
              // shape: CircleBorder(), // Apply a circular shape
              splashColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
                child: Icon(
              icon,
              size: 32,
            )),
          ),
        ),
      );

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Change Password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  currentPassword = value;
                },
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  newPassword = value;
                },
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  confirmPassword = value;
                },
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (currentPassword.isNotEmpty &&
                    newPassword.isNotEmpty &&
                    confirmPassword.isNotEmpty &&
                    newPassword == confirmPassword) {
                  _auth.changePassword(newPassword,currentPassword);
                  Navigator.of(context).pop();
                } else {
                  // Show an error message or handle the case where passwords don't match
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}