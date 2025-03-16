import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String usernameProfile;
  const ProfilePage({required this.usernameProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 173, 145),
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          children: [
            Text(" Profile : $usernameProfile", style: TextStyle(fontSize: 90)),
          ],
        ),
      ),
    );
  }
}
