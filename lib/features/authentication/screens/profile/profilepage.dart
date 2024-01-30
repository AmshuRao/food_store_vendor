import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profilePageScreen extends StatefulWidget {
  const profilePageScreen({super.key});

  @override
  State<profilePageScreen> createState() => _profilePageScreenState();
}

class _profilePageScreenState extends State<profilePageScreen> {
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
            EdgeInsets.all(8.0), // Padding to control the width of the border
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
            Text(
              'Vidyarthi Khana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Email Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'example@example.com', // Replace with the actual email address
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Implement change password functionality
                // This could navigate to a new screen or show a dialog for password change
              },
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: 200), // Adjust the maximum width as needed
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock),
                      const SizedBox(
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
                // Implement logout functionality
                // For example, you can use Firebase Authentication sign out method
              },
              icon: Icon(Icons.logout),
              iconSize: 40.0, // Set the size of the icon as needed
              color: Colors.white, // Set the color of the icon
              splashRadius:
                  30.0, // Set the splash radius for the circular effect
              padding: EdgeInsets.all(16.0), // Padding around the icon
              constraints:
                  BoxConstraints(), // Remove constraints to allow circular shape
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
          shape: CircleBorder(),
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
}
