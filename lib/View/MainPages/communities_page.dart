import 'package:flutter/material.dart';
import 'package:reddit/Items/community_item.dart';
import 'package:reddit/widgets.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  List<CommunityItem> communityList = [];
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
