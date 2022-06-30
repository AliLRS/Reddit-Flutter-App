import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/Items/community_item.dart';

class CommunitySearchResultPage extends StatefulWidget {
  CommunitySearchResultPage(this.search, {Key key}) : super(key: key);
  String search;
  @override
  State<CommunitySearchResultPage> createState() =>
      _CommunitySearchResultPageState();
}

class _CommunitySearchResultPageState extends State<CommunitySearchResultPage> {
  List<CommunityItem> communityList, resultList;
  @override
  void initState() {
    super.initState();
    getCommunities();
    for (CommunityItem c in communityList) {
      if (c.community.name
          .toLowerCase()
          .contains(widget.search.toLowerCase())) {
        resultList.add(c);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: resultList.length,
          itemBuilder: (context, index) {
            return resultList[index];
          }),
    );
  }

  void getCommunities() async {
    Socket serverSocket =
        await Socket.connect(StaticFields.ip, StaticFields.port);
    final data = "getCommunities,," + StaticFields.postFix;
    serverSocket.write(data);
    serverSocket.flush();
    serverSocket.listen((res) {
      setState(() {
        final response = String.fromCharCodes(res);
        communityList = communityFromJson(response).map((item) {
          return CommunityItem(item);
        }).toList();
      });
    });
  }
}
