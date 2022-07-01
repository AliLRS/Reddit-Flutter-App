import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/Items/community_item.dart';
import 'package:reddit/widgets.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  List<CommunityItem> communityList;
  @override
  void initState() {
    super.initState();
    getCommunities();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: const SearchBar(),
        ),
      ),
      body: communityList == null
          ? loading
          : ListView.builder(
              itemCount: communityList.length,
              itemBuilder: (context, index) {
                return communityList[index];
              },
            ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }

  Future<void> getCommunities() async {
    Socket serverSocket =
        await Socket.connect(StaticFields.ip, StaticFields.port);
    final data = "getCommunities,," + StaticFields.postFix;
    serverSocket.write(data);
    serverSocket.flush();
    serverSocket.listen((res) {
      setState(() {
        final response = String.fromCharCodes(res);
        List<Community> cs = communityFromJson(response);
        //if (cs != null) {
        communityList = cs.map((item) {
          return CommunityItem(item);
        }).toList();
        //}
      });
    });
  }

  Widget get loading => const Center(
        child: CircularProgressIndicator(),
      );
}
