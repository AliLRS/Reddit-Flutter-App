import 'package:flutter/material.dart';
import 'widgets.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);
  static int selectedIndex = 1;
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: const SearchBar(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              child: Icon(Icons.ac_unit),
            ),
            title: Text('r/user'),
            subtitle: Text('u/community'),
          ),
          ListTile(
            title: Text('title'),
            subtitle: Text('description\n...\n...\n...'),
          ),
          Row(
            children: [
              Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up))),
              Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_down))),
              Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.comment))),
              Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.share)))
            ],
          ),
        ],
      ),
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
