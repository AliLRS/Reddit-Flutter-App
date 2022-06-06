import 'package:flutter/material.dart';
import '../Items/community_item.dart';
import '../widgets.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
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
    setState(() {
      //communityList.sort((a, b) => a.expireDate.compareTo(b.expireDate));
    });
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: const SearchBar(),
        ),
      ),
      body: ListView.builder(
          itemCount: communityList.length,
          itemBuilder: (context, index) {
            return communityList[index];
          }),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }
}
