import 'package:flutter/material.dart';
import 'widgets.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);
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
      body: const ListTile(
        title: Text('Feed'),
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }
}
