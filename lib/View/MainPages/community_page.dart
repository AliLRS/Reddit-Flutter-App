import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/Items/post_item.dart';
import 'package:reddit/widgets.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage(this.community, {Key key}) : super(key: key);
  Community community;
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String followResponse = '', getPostResponse = '';
  bool _followed;
  List<PostItem> posts = [];
  @override
  initState() {
    super.initState();
    _followed = StaticFields.activeUser.communities.contains(widget.community);
    //List<PostItem> posts =
    //widget.community.posts.map((val) => PostItem(val)).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.community.name),
        actions: [
          TextButton(
            child: Text(
              _followed ? 'Unfollow' : 'Follow',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              followCommunity();
              if (followResponse == 'followed') {
                setState(() {
                  _followed = true;
                });
              } else {
                setState(() {
                  _followed = false;
                });
              }
            },
          )
        ],
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
                child: Text(
                    widget.community.users == null
                        ? '0 users'
                        : '${widget.community.users.length} users',
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

  void followCommunity() async {
    await Socket.connect(StaticFields.ip, StaticFields.port)
        .then((serverSocket) {
      final data = "followCommunity,," +
          json.encode(widget.community.toJson()) +
          ',,' +
          userToJson(StaticFields.activeUser) +
          StaticFields.postFix;
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((res) {
        followResponse = String.fromCharCodes(res);
        print('response: $followResponse');
      });
    });
  }

  void getPosts(Community community) async {
    await Socket.connect(StaticFields.ip, StaticFields.port)
        .then((serverSocket) {
      final data =
          "getPosts,," + json.encode(community.toJson()) + StaticFields.postFix;
      serverSocket.write(data);
      serverSocket.flush();
      serverSocket.listen((res) {
        getPostResponse = String.fromCharCodes(res);
        print('response: $getPostResponse');
      });
    });
  }
}
