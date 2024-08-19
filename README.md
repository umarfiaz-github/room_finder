Room Finder
A Flutter-based Room Finder application developed as part of an internship at Ezitec Institute.

Project Overview
This app helps users find rooms and properties for rent, with features like phone number authentication and 
email/password login, integrated using Firebase.
The UI is designed to be user-friendly and straightforward, with screens for login, property details,
search, and settings.

Features:
Phone Number Authentication: Users can log in with their phone number using Firebase's authentication services.
Email/Password Login: Traditional login method using email and password, also powered by Firebase.
Property Search: Users can search for rooms and properties, with detailed views for each listing.
Responsive Design: The app is designed to be responsive, ensuring it looks good on various device sizes.
Custom UI: The UI has been carefully crafted to provide a seamless user experience.
Tech Stack:
Flutter: The framework used for building the app.
Firebase: Used for backend services, including authentication and Firestore for storing data.
State Management: The app does not use state management solutions like Bloc or GetX; state is managed within the app's logic.
Getting Started
To get started with this project:

Clone the Repository:

bash
Copy code
git clone https://github.com/umarfiaz-github/room_finder.git
cd room_finder
Set Up Firebase:

Create a Firebase project.
Add your Firebase google-services.json for Android and GoogleService-Info.plist for iOS in the respective directories.
Update the Firebase security rules to ensure your data is secure before deploying.
## Firebase Configuration

To use Firebase in this project, you'll need to set up your own `firebase_options.dart` file. Follow these steps:

1. Install the FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure

Run the App:

Install dependencies:
bash
Copy code
flutter pub get
Run the app on your device or emulator:
bash
Copy code
flutter run