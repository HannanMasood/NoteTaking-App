import 'package:flutter/material.dart';
import 'package:myapp/first.dart';
import 'package:myapp/h.dart';
import 'package:myapp/home.dart';
import 'package:myapp/m.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

      home:First()
    );
  }
}
