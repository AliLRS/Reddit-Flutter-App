import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/View/MainPages/community_page.dart';

class CommunityItem extends StatelessWidget {
  CommunityItem(this.community, {Key key}) : super(key: key);
  Community community;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(community.name[0]),
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
      trailing: StaticFields.activeUser.favoriteCommunities == null
          ? Icon(Icons.star_outline_rounded)
          : (StaticFields.activeUser.favoriteCommunities == null
              ? Icon(Icons.star_rounded)
              : Icon(Icons.star_outline_rounded)),
    );
  }
}
