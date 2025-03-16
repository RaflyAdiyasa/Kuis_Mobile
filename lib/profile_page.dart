import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String usernameProfile;
  const ProfilePage({super.key, required this.usernameProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Column(children: [Text("Rafly")])),
    );
  }
}
