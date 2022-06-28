import 'package:flutter/material.dart';
import 'package:reddit/Items/community_item.dart';

class CommunitySearchResultPage extends StatefulWidget {
  const CommunitySearchResultPage({Key key}) : super(key: key);

  @override
  State<CommunitySearchResultPage> createState() =>
      _CommunitySearchResultPageState();
}

class _CommunitySearchResultPageState extends State<CommunitySearchResultPage> {
  List<CommunityItem> communityList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: communityList.length,
          itemBuilder: (context, index) {
            return communityList[index];
          }),
    );
  }
}
