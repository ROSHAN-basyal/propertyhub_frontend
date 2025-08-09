import 'package:flutter/material.dart';
import 'signup.dart';
import 'globals.dart'as globals;

void main() {
  runApp(PropertyHubApp());
}

class PropertyHubApp extends StatelessWidget {
  const PropertyHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Hub',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Roboto'),
      home: Signup(),
      debugShowCheckedModeBanner: false,
    );
  }
}

