import 'package:flutter/material.dart';
import 'package:reddit/feed_page.dart';
import 'package:reddit/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController,
      _usernameController,
      _passwordController;
  bool _passwordVisibility = false, firstEntry = true;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        actions: [
          TextButton(
            child: const Text('Log in'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
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
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: validateEmail(_emailController.text),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: validateUsername(_usernameController.text),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: validatePassword(_passwordController.text),
                  errorMaxLines: 3,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: (ThemeMode.system == ThemeMode.dark
                          ? (_passwordVisibility
                              ? Colors.blueGrey
                              : Colors.white)
                          : (_passwordVisibility
                              ? Colors.orange
                              : Colors.black)),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisibility = !_passwordVisibility;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisibility,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                setState(() {
                  firstEntry = false;
                  if (validateEmail(_emailController.text) == null &&
                      validateUsername(_usernameController.text) == null &&
                      validatePassword(_passwordController.text) == null) {
                    Fluttertoast.showToast(
                        msg: 'Sign up was successful',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppTheme.mainColor,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedPage()));
                  }
                });
              }),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty && !firstEntry) {
      return 'Email is required';
    } else {
      if (!regex.hasMatch(value) && !firstEntry) {
        return 'Please enter a valid email';
      } else {
        return null;
      }
    }
  }

  String validateUsername(String value) {
    if (value.isEmpty && !firstEntry) {
      return 'Username is required';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value.isEmpty && !firstEntry) {
      return 'Password is required';
    } else {
      if (!regex.hasMatch(value) && !firstEntry) {
        return 'Password must have contain at least one uppercase, one lowercase, one number and at least 8 characters';
      } else {
        return null;
      }
    }
  }
}
