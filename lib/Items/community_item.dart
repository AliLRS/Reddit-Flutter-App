import '../MainPages/community_page.dart';
import 'package:flutter/material.dart';

class CommunityItem extends StatelessWidget {
  CommunityItem(this.community, {Key key}) : super(key: key);
  String community;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Text('C'),
      ),
      title: GestureDetector(
        child: Text(community),
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
