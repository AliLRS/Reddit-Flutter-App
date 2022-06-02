import 'package:flutter/material.dart';

class PostSearchResultPage extends StatefulWidget {
  const PostSearchResultPage({Key key}) : super(key: key);

  @override
  State<PostSearchResultPage> createState() => _PostSearchResultPageState();
}

class _PostSearchResultPageState extends State<PostSearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        title: Text('Post search result page'),
      ),
    );
  }
}
