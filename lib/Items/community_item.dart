import 'package:reddit/Data/community.dart';
import 'package:flutter/material.dart';
import 'package:reddit/View/MainPages/community_page.dart';

class CommunityItem extends StatelessWidget {
  CommunityItem(this.community, {Key key}) : super(key: key);
  Community community;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Text('C'),
      ),
      title: GestureDetector(
        child: Text(community.name),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommunityPage(community)));
        },
      ),
      trailing: const Icon(Icons.star_outline_rounded),
    );
  }
}
