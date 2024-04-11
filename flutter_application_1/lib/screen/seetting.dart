import 'package:flutter/material.dart';

class seetting extends StatefulWidget {
  seetting({super.key});

  @override
  State<seetting> createState() => _seettingState();
}

class _seettingState extends State<seetting> {
  bool isDarkModeEnabled = false;
  bool areNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: areNotificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    areNotificationsEnabled = value;
                  });
                },
              ),
            ),
            Divider(), // Divider for visual separation
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: (bool value) {
                  setState(() {
                    isDarkModeEnabled = value;
                  });
                },
              ),
            ),
            Divider(), // Divider for visual separation
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            Divider(), // Divider for visual separation
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
