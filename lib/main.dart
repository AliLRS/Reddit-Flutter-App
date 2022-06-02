import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Reddit',
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, String title}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
