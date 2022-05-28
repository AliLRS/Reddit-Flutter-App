import 'package:flutter/material.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({Key key}) : super(key: key);

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit'),
      ),
      body: const ListTile(
        title: Text('Saved posts'),
      ),
    );
  }
}
