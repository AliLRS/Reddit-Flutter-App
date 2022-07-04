import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/View/MainPages/communities_page.dart';
import 'package:reddit/app_theme.dart';
import '../MainPages/feed_page.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({Key key}) : super(key: key);

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  TextEditingController _nameController, _descriptionController;
  bool _isButtonActive = false;
  String response = '';
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _nameController.addListener(() {
      final _isButtonActive = _nameController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty;
      setState(() => this._isButtonActive = _isButtonActive);
    });
    _descriptionController.addListener(() {
      _isButtonActive = _nameController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty;
      setState(() => this._isButtonActive = _isButtonActive);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a community'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              //style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Community name',
              ),
              controller: _nameController,
              keyboardType: TextInputType.text,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Description'),
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () {
                        addCommunity(
                          Community(
                              name: _nameController.text,
                              description: _descriptionController.text,
                              communityAdmin: StaticFields.activeUser),
                        );
                        if (response == 'done') {
                          Fluttertoast.showToast(
                              msg: 'Community created successfully',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppTheme.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          FeedPage.selectedIndex = 2;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunitiesPage()));
                        } else {
                          Fluttertoast.showToast(
                              msg: response,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppTheme.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    : null,
                child: const Text('Create Community'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addCommunity(Community community) async {
    await Socket.connect(StaticFields.ip, StaticFields.port)
        .then((serverSocket) {
      final data = "addCommunity,," +
          json.encode(community.toJson()) +
          StaticFields.postFix;
      print(data);
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((res) {
        response = String.fromCharCodes(res);
        print('response: $response');
      });
    });
  }
}
