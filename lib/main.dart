import 'package:flutter/material.dart';
import 'package:task/view/register_screen/register_screen.dart';

String? storedEmail = '';
String? storedPassword = '';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RegisterScreen(),
    );
  }
}
