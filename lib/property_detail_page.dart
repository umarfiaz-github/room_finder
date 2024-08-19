import 'package:flutter/material.dart';

class PropertyDetailPage extends StatelessWidget {
  final String propertyTitle;
  final String propertyDescription;
  final String imageUrl;

  PropertyDetailPage({
    required this.propertyTitle,
    required this.propertyDescription,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(propertyTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              imageUrl.startsWith('http')
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Image.asset(imageUrl, fit: BoxFit.cover),
              SizedBox(height: 16.0),
              Text(
                propertyTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Rs. 6000 / per week',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/women/44.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Courtney Henry',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Landlord',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.phone, color: Colors.blue),
                    onPressed: () {
                      // Add phone call functionality here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.message, color: Colors.blue),
                    onPressed: () {
                      // Add message functionality here
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      '1.2 km from Gwarko, Mahalaxmi, Lalitpur',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Available',
                style: TextStyle(color: Colors.green),
              ),
              Text(
                'Property Owned By: Alok',
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  // Add navigation to Google Maps here
                },
                child: Text(
                  'View on Google Maps',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    '0 Applied | 19 Views',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                propertyDescription,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        'assets/sample.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Booking Confirmation'),
                          content: Text('Congratulations! Your room is booked.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Book Now'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding:
                    EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
