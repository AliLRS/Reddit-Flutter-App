import 'package:flutter/material.dart';
import 'package:reddit/Data/community.dart';
import 'package:reddit/Items/community_item.dart';
import 'package:reddit/Items/post_item.dart';
import 'package:reddit/widgets.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage(this.community, {Key key}) : super(key: key);
  Community community;
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<PostItem> posts = [];
  @override
  initState() {
    super.initState();
    List<PostItem> posts =
        widget.community.posts.map((val) => PostItem(val)).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.community.name),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const CircleAvatar(
                  radius: 30,
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, bottom: 5),
                child: Text(widget.community.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, bottom: 5),
                child: Text('${widget.community.users.length} members',
                    style: TextStyle(color: Colors.grey)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, bottom: 5),
                child: Text(widget.community.description,
                    style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
          _draggableScrollableSheet(),
        ],
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }

  DraggableScrollableSheet _draggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return posts[index];
              },
            ),
          ),
        );
      },
    );
  }
}
