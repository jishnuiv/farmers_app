import 'package:flutter/material.dart';
import 'authentication/log_in.dart';
import 'authentication/registration.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'farmers ',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home: const Registration(),
      routes: {
        'Login':(context)=>Login(),
        'Registration':(context)=>Registration(),

      },
    );
  }
}
