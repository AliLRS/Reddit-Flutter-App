import 'package:flutter/material.dart';
import 'package:reddit/Items/post_item.dart';

class PostSearchResultPage extends StatefulWidget {
  const PostSearchResultPage({Key key}) : super(key: key);

  @override
  State<PostSearchResultPage> createState() => _PostSearchResultPageState();
}

class _PostSearchResultPageState extends State<PostSearchResultPage> {
  List<PostItem> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return posts[index];
          }),
    );
  }
}
