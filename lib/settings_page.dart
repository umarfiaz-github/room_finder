import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class SettingsPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'), // Placeholder image URL
                      radius: 50,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Courtney Henry',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '10 Applied | Kathmandu',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to Edit Profile
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.blue),
                title: Text('Notifications', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to Notifications
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.history, color: Colors.blue),
                title: Text('Recent Viewed', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to Recent Viewed
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.help, color: Colors.blue),
                title: Text('Get Help', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to Get Help
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text('About us', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to About Us
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.blue),
                title: Text('Sign Out', style: TextStyle(color: Colors.white)),
                onTap: () => _signOut(context),
              ),
              Divider(color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}
