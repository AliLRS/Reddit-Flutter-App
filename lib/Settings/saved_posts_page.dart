import 'package:reddit/Items/post_item.dart';
import 'package:flutter/material.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  List<PostItem> posts = [
    PostItem('r/community1'),
    PostItem('r/community2'),
    PostItem('r/community3'),
    PostItem('r/community4'),
    PostItem('r/community5'),
    PostItem('r/community6'),
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
            return posts[index];
          }),
    );
  }
}
