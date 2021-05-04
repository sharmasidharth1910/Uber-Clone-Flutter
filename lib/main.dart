import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/Screens/LoginScreen.dart';
import 'package:rider_app/Screens/MainScreen.dart';
import 'package:rider_app/Screens/RegisterScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Rider App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Brand-Regular",
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
      initialRoute: MainScreen.screenId,
      routes: {
        RegistrationScreen.screenId: (context) => RegistrationScreen(),
        LoginScreen.screenId: (context) => LoginScreen(),
        MainScreen.screenId: (context) => MainScreen(),
      },
    );
  }
}
