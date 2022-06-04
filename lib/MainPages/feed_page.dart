import 'package:reddit/Items/post_item.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
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
        title: Container(
          color: Colors.white,
          child: const SearchBar(),
        ),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return posts[index];
          }),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }
}
