import 'package:flutter/material.dart';
import 'package:reddit/post_item.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  List<PostItem> posts = [
    const PostItem(),
    const PostItem(),
    const PostItem(),
    const PostItem(),
    const PostItem(),
    const PostItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return const PostItem();
          }),
    );
  }
}
