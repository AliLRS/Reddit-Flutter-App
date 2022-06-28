import 'package:reddit/Items/post_item.dart';
import 'package:flutter/material.dart';
import '../Data/post.dart';
import '../Data/user.dart';
import '../widgets.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<PostItem> posts = [PostItem(Post('Title', 'Content', User.activeUser))];
  //ActiveUser.user.posts.map((val) => PostItem(val)).toList() ?? [];
  @override
  initState() {
    super.initState();
    posts = [PostItem(Post('Title', 'Content', User.activeUser))];
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
