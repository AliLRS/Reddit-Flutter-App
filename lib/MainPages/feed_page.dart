import 'package:reddit/Data/active_user.dart';
import 'package:reddit/Items/post_item.dart';
import 'package:flutter/material.dart';
import '../Data/post.dart';
import '../widgets.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<PostItem> posts = [PostItem(Post('Title', 'Content', ActiveUser.user))];
  //ActiveUser.user.posts.map((val) => PostItem(val)).toList() ?? [];
  @override
  initState() {
    super.initState();
    posts = [PostItem(Post('Title', 'Content', ActiveUser.user))];
  }

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
