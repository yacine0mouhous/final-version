import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ui test',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 27, 92, 30),
        backgroundColor: Color.fromARGB(255, 179, 242, 181),
        useMaterial3: true,
      ),
      home: home_screen(),
    );
  }
}
