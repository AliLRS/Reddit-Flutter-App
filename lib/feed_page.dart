import 'package:flutter/material.dart';
import 'package:reddit/post_item.dart';
import 'widgets.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
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
        title: Container(
          color: Colors.white,
          child: const SearchBar(),
        ),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return const PostItem();
          }),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }
}

class Post {
  String title;
  String discribe;
  String User;
  String Community;
}
