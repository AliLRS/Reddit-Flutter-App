import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/app_theme.dart';
import 'profile_page.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String userConfirmation = '';
  TextEditingController _emailController,
      _usernameController,
      _passwordController;
  bool _passwordVisibility = false, firstEntry = true;
  @override
  void initState() {
    super.initState();
    _emailController =
        TextEditingController(text: StaticFields.activeUser.email);
    _usernameController =
        TextEditingController(text: StaticFields.activeUser.username);
    _passwordController =
        TextEditingController(text: StaticFields.activeUser.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: validateUsername(_usernameController.text),
                ),
                keyboardType: TextInputType.emailAddress,
                enabled: false,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: validateEmail(_emailController.text),
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
                      setState(
                        () {
                          _passwordVisibility = !_passwordVisibility;
                        },
                      );
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
              setState(
                () {
                  firstEntry = false;
                  if (validateEmail(_emailController.text) == null &&
                      validateUsername(_usernameController.text) == null &&
                      validatePassword(_passwordController.text) == null) {
                    User newUser = User(
                      email: _emailController.text,
                      username: _usernameController.text,
                      password: _passwordController.text,
                    );
                    editUser(newUser);
                    if (userConfirmation == 'done\u0000') {
                      Fluttertoast.showToast(
                          msg: 'Edit was successful',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppTheme.mainColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    } else {
                      print('Not changed');
                      Fluttertoast.showToast(
                          msg: userConfirmation,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppTheme.mainColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                },
              );
            },
          ),
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

  void editUser(User user) async {
    await Socket.connect(StaticFields.ip, StaticFields.port)
        .then((serverSocket) {
      final data = "editProfile,," +
          userToJson(StaticFields.activeUser) +
          userToJson(user) +
          StaticFields.postFix;
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((response) {
        setState(() {
          userConfirmation = (String.fromCharCodes(response));
          print('userConfirmation: $userConfirmation');
        });
      });
    });
  }
}
