import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  static const String screenId = "MainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("RIDER"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Rider Application"),
      ),
    );
  }
}
