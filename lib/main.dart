import 'package:flutter/material.dart';
import 'package:vacanza/view/home_page.dart';
import 'package:vacanza/view/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacanza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily:
          'Poppins'),
      home: LoginPage(),
    );
  }
}
