import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/View/MainPages/post_page.dart';

class AddCommentPage extends StatefulWidget {
  AddCommentPage(this.post, {Key key}) : super(key: key);
  Post post;
  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
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
                      widget.post.comments.add(Comment(
                        content: _commentController.text,
                        user: StaticFields.activeUser,
                        dateTime: DateTime.now().toString(),
                        post: widget.post,
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostPage(widget.post)));
                    }
                  : null,
              child: const Text('Add comment'),
            ),
          ),
        ],
      ),
    );
  }
}
