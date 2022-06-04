import 'package:reddit/MainPages/feed_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reddit/Entry/signup_page.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController, _passwordController;
  bool _passwordVisibility = false, firstEntry = true;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        actions: [
          TextButton(
            child: const Text('Sign Up'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignupPage()));
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
                errorText: validateUsername(_usernameController.text),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: validatePassword(_passwordController.text),
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
                  if (validateUsername(_usernameController.text) == null &&
                      validatePassword(_passwordController.text) == null) {
                    Fluttertoast.showToast(
                        msg: 'Log in was successful',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppTheme.mainColor,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FeedPage()));
                  }
                });
              }),
        ),
      ),
    );
  }

  String validateUsername(String value) {
    if (value.isEmpty && !firstEntry) {
      return 'Username is required';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty && !firstEntry) {
      return 'Password is required';
    }
    return null;
  }
}
