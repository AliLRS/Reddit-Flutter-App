import 'package:reddit/Data/user.dart';
import 'package:reddit/Items/post_item.dart';
import 'package:flutter/material.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  List<PostItem> posts =
      User.activeUser.savedPosts.map((val) => PostItem(val)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return posts[index];
          }),
    );
  }
}
