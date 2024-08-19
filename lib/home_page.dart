import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'settings_page.dart';
import 'account_page.dart';
import 'search_page.dart';
import 'property_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchPage(),
    SettingsPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAddButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPropertyScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        onPressed: _onAddButtonPressed,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> properties = [
    {
      'image': 'assets/flatimage.jpg',
      'title': 'Luxurious Apartment',
      'location': 'Kathmandu, Nepal',
      'price': '\$1200 / month',
      'availability': 'Available',
      'description': 'A luxurious apartment with modern amenities and a great view.'
    },
    {
      'image': 'assets/oneroom.jpg',
      'title': 'Cozy Room',
      'location': 'Pokhara, Nepal',
      'price': '\$500 / month',
      'availability': 'Available',
      'description': 'A cozy room perfect for students or singles.'
    },
    {
      'image': 'assets/propertyimage.jpg',
      'title': 'Spacious Hall',
      'location': 'Bhaktapur, Nepal',
      'price': '\$800 / month',
      'availability': 'Available',
      'description': 'A spacious hall suitable for events and gatherings.'
    },
    {
      'image': 'assets/sample.jpg',
      'title': 'Modern Flat',
      'location': 'Lalitpur, Nepal',
      'price': '\$1000 / month',
      'availability': 'Available',
      'description': 'A modern flat with all the necessary facilities.'
    },
    {
      'image': 'assets/sample.jpg',
      'title': 'Modern Flat 2',
      'location': 'Lalitpur, Nepal',
      'price': '\$1000 / month',
      'availability': 'Available',
      'description': 'Another modern flat with a beautiful interior.'
    },
    {
      'image': 'assets/sample.jpg',
      'title': 'Modern Flat 3',
      'location': 'Lalitpur, Nepal',
      'price': '\$1000 / month',
      'availability': 'Available',
      'description': 'A stylish flat with great amenities.'
    },
    {
      'image': 'assets/propertyimage.jpg',
      'title': 'Luxurious Apartment',
      'location': 'Peshwar',
      'price': '\$1300 / month',
      'availability': 'Available',
      'description': 'A luxurious apartment with modern amenities and a great view.'
    },
    {
      'image': 'assets/flatimage.jpg',
      'title': 'Refurnish Appartment',
      'location': 'Islamabad',
      'price': '\$1600 / month',
      'availability': 'Available',
      'description': 'A luxurious apartment with modern amenities and a great view.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();

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
                        Text(
                          'Room Finder',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
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
                          'Find a property anywhere',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Search address or near you',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.location_on),
                                  prefixIconColor: Colors.blue,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: width * .01,
                                    vertical: height * .01,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Search Now'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Advance Search',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Flat'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.grey[850],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Rooms'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.grey[850],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Hall'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.grey[850],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Rent'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.grey[850],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recently Added Properties',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('View All'),
                            ),
                          ],
                        ),
                        Column(
                          children: properties.map((property) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PropertyDetailPage(
                                      propertyTitle: property['title']!,
                                      propertyDescription: property['description']!,
                                      imageUrl: property['image']!,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 180,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(property['image']!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(property['title']!),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(property['location']!),
                                            Text(property['price']!),
                                            Text(property['availability']!),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
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
}

class AddPropertyScreen extends StatefulWidget {
  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _uploadData() async {
    if (_image != null) {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('properties/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageReference.putFile(_image!);

      final completedTask = await uploadTask;
      final imageUrl = await completedTask.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('properties').add({
        'title': _titleController.text,
        'location': _locationController.text,
        'price': _priceController.text,
        'description': _descriptionController.text,
        'imageUrl': imageUrl,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 16),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _uploadData,
                child: Text('Add Property'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
