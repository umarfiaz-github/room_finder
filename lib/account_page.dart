import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class AccountPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blueAccent,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: height * .05),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: user?.photoURL != null
                              ? NetworkImage(user!.photoURL!)
                              : AssetImage('assets/profile.png')
                          as ImageProvider,
                          radius: 40,
                        ),
                        SizedBox(height: 16),
                        Text(
                          user?.displayName ?? 'No display name',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          '10 Applied  |  Kathmandu',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () => _signOut(context),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Account Details',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Column(
                          children: [
                            _buildInfoRow('Email', user?.email ?? 'No email'),
                            SizedBox(height: 8),
                            _buildInfoRow('Location', 'Kathmandu, Nepal'),
                            SizedBox(height: 8),
                            _buildInfoRow('Phone No', '(+977) 9125331510'),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    // Add functionality for 'Applied'
                                  },
                                  child: Text(
                                    'Applied (5)',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    // Add functionality for 'Liked'
                                  },
                                  child: Text(
                                    'Liked',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        _buildPropertyCard(),
                        SizedBox(height: height * 0.02),
                        _buildPropertyCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black87),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPropertyCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/propertyimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1 BHK at Lalitpur',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Mahalaxmi Lalitpur',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'RS 8000',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '3.0 ★',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
