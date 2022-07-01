import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/Items/post_item.dart';
import 'package:flutter/material.dart';
import 'package:reddit/widgets.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<PostItem> posts = [];
  @override
  initState() {
    super.initState();
    for (Community c in StaticFields.activeUser.communities) {
      for (Post p in c.posts) {
        posts.add(PostItem(p));
      }
    }
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
