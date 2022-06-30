import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/app_theme.dart';
import 'package:reddit/widgets.dart';
import 'feed_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _titleController, _bodyController;
  bool _isButtonActive = false;
  List<String> _communities;
  String _communitySelectedname, response;
  @override
  void initState() {
    super.initState();
    updateUser();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _titleController.addListener(() {
      final _isButtonActive = _titleController.text.isNotEmpty &&
          _bodyController.text.isNotEmpty &&
          _communitySelectedname != null;
      setState(() => this._isButtonActive = _isButtonActive);
    });
    _bodyController.addListener(() {
      _isButtonActive = _titleController.text.isNotEmpty &&
          _bodyController.text.isNotEmpty &&
          _communitySelectedname != null;
      setState(() => this._isButtonActive = _isButtonActive);
    });
    _communities = StaticFields.activeUser.communities == null
        ? ['No communities']
        : StaticFields.activeUser.communities.map((c) => c.name).toList();
    _communitySelectedname = _communities.isNotEmpty ? _communities[0] : null;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reddit'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Add a title',
                ),
                controller: _titleController,
                keyboardType: TextInputType.text,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Add Body text'),
                  controller: _bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: DropdownButton<String>(
                  value: _communitySelectedname,
                  items: _communities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  onChanged: (String value) {
                    setState(() {
                      _communitySelectedname = value;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: _isButtonActive
                      ? () {
                          for (int i = 0;
                              i < StaticFields.activeUser.communities.length;
                              i++) {
                            if (StaticFields.activeUser.communities[i].name ==
                                _communitySelectedname) {
                              addPost(
                                Post(
                                  title: _titleController.text,
                                  content: _bodyController.text,
                                  //dateTime: DateTime.now(),
                                  user: StaticFields.activeUser,
                                ),
                                StaticFields.activeUser.communities[i],
                              );
                              break;
                            }
                          }
                          if (response == 'done') {
                            FeedPage.selectedIndex = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedPage()));
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
                  child: const Text('Add Post'),
                ),
              ),
            ],
          ),
        ),
        drawer: const PageDrawer(),
        bottomNavigationBar: const PageAppBar());
  }

  void addPost(Post post, Community community) async {
    await Socket.connect(StaticFields.ip, StaticFields.port)
        .then((serverSocket) {
      final data = "addPost,," +
          json.encode(post.toJson()) +
          ',,' +
          json.encode(community.toJson()) +
          ',,' +
          userToJson(StaticFields.activeUser) +
          StaticFields.postFix;
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((res) {
        response = String.fromCharCodes(res);
        print('response: $response');
      });
    });
  }

  void updateUser() {
    Socket.connect(StaticFields.ip, StaticFields.port).then((serverSocket) {
      final data = "updateUser,," +
          userToJson(StaticFields.activeUser) +
          StaticFields.postFix;
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((res) {
        response = String.fromCharCodes(res);
        StaticFields.activeUser = userFromJson(response);
      });
    });
  }
}
