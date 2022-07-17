import 'package:flutter/material.dart';
import 'package:chat_ui/screens/home_screen.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 35, 93, 37),
        // ignore: deprecated_member_use
        accentColor: Color.fromARGB(255, 218, 205, 175),
      ),
      home: HomeScreen(),
    );
  }
}
