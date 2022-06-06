import 'package:flutter/material.dart';

import '../Items/post_item.dart';

class PostSearchResultPage extends StatefulWidget {
  const PostSearchResultPage({Key key}) : super(key: key);

  @override
  State<PostSearchResultPage> createState() => _PostSearchResultPageState();
}

class _PostSearchResultPageState extends State<PostSearchResultPage> {
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
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return posts[index];
          }),
    );
  }
}
