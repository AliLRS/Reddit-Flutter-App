import 'dart:io';

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
    FeedPage.selectedIndex = 1;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: const SearchBar(),
        ),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          try {
            getAllPosts();
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return posts[index];
              },
            );
          } catch (e) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }

  Future<void> getAllPosts() async {
    Socket serverSocket =
        await Socket.connect(StaticFields.ip, StaticFields.port);
    final data = "getAllPosts,," + StaticFields.postFix;
    serverSocket.write(data);
    serverSocket.flush();
    serverSocket.listen((res) {
      setState(() {
        final response = String.fromCharCodes(res);
        List<Post> ps = postFromJson(response);
        //if (ps != null) {
        posts = ps.map((item) {
          return PostItem(item);
        }).toList();
        posts.sort((a, b) => DateTime.parse(b.post.dateTime)
            .compareTo(DateTime.parse(a.post.dateTime)));
        //}
      });
    });
  }
}
