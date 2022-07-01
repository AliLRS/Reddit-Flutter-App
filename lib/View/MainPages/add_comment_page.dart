import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/View/MainPages/post_page.dart';
import 'package:reddit/app_theme.dart';

class AddCommentPage extends StatefulWidget {
  AddCommentPage(this.post, {Key key}) : super(key: key);
  Post post;
  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  String response = '';
  TextEditingController _commentController;
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _commentController.addListener(() {
      final _isButtonActive = _commentController.text.isNotEmpty;
      setState(() => this._isButtonActive = _isButtonActive);
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add comment to: ' + widget.post.title)),
      body: Column(
        children: [
          TextField(
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Add a comment',
            ),
            controller: _commentController,
            keyboardType: TextInputType.text,
            maxLines: 6,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: _isButtonActive
                  ? () {
                      if (response == 'done') {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostPage(widget.post)));
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
              child: const Text('Add comment'),
            ),
          ),
        ],
      ),
    );
  }

  void addComment(Comment comment) async {
    await Socket.connect(StaticFields.ip, StaticFields.port)
        .then((serverSocket) {
      final data =
          "addComment,," + json.encode(comment.toJson()) + StaticFields.postFix;
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((res) {
        response = String.fromCharCodes(res);
        print('response: $response');
      });
    });
  }
}
