import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  File? _image;
  final picker = ImagePicker();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  Future _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _uploadData() async {
    if (_image != null) {
      // Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child('uploads/${DateTime.now().toString()}');
      UploadTask uploadTask = storageReference.putFile(_image!);
      await uploadTask.whenComplete(() async {
        String downloadURL = await storageReference.getDownloadURL();

        // Save data to Firestore
        await FirebaseFirestore.instance.collection('properties').add({
          'imageURL': downloadURL,
          'description': _descriptionController.text,
          'price': _priceController.text,
          'type': 'flat', // or 'rent' based on user input
        });
      });

      // Clear fields
      setState(() {
        _image = null;
        _descriptionController.clear();
        _priceController.clear();
      });
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
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                color: Colors.grey[200],
                child: _image == null
                    ? Icon(Icons.add_a_photo, size: 100, color: Colors.grey[700])
                    : Image.file(_image!),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadData,
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
