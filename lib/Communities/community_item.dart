import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'community_page.dart';

class CommunityItem extends StatelessWidget {
  CommunityItem(this.community, {Key key}) : super(key: key);
  String community;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
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
      trailing: Icon(Icons.star_outline_rounded),
    );
  }
}
