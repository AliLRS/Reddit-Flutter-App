import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  bool _passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        actions: [
          TextButton(
            child: Text('Sign Up'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: !_passwordVisibility,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: (_passwordVisibility
                        ? Colors.deepOrange
                        : Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisibility = !_passwordVisibility;
                    });
                  },
                ),
              ],
            ),
            OutlinedButton(
              child: Text('Log In'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
