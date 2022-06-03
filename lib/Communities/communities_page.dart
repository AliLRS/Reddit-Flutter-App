import 'package:flutter/material.dart';
import 'community_item.dart';
import '../widgets.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  List<String> communityList = [
    'r/Community 1',
    'r/Community 2',
    'r/Community 3'
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
          child: SearchBar(),
        ),
      ),
      body: ListView.builder(
        itemCount: communityList.length,
        itemBuilder: (context, index) {
          return communityList[index].isEmpty
              ? const SizedBox(height: 0)
              : CommunityItem(
                  communityList[index],
                );
        },
      ),
      drawer: const PageDrawer(),
      bottomNavigationBar: const PageAppBar(),
    );
  }
}
