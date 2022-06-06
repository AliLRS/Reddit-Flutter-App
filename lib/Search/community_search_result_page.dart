import 'package:flutter/material.dart';
import '../Items/community_item.dart';

class CommunitySearchResultPage extends StatefulWidget {
  const CommunitySearchResultPage({Key key}) : super(key: key);

  @override
  State<CommunitySearchResultPage> createState() =>
      _CommunitySearchResultPageState();
}

class _CommunitySearchResultPageState extends State<CommunitySearchResultPage> {
  List<CommunityItem> communityList = [
    CommunityItem('r/community1'),
    CommunityItem('r/community2'),
    CommunityItem('r/community3'),
    CommunityItem('r/community4'),
    CommunityItem('r/community5'),
    CommunityItem('r/community6'),
    CommunityItem('r/community7'),
    CommunityItem('r/community8'),
    CommunityItem('r/community9'),
    CommunityItem('r/community10'),
  ];
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
