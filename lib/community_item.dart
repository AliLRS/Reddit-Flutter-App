import 'package:flutter/material.dart';

class CommunityItem extends StatelessWidget {
  const CommunityItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('C'),
      ),
      title: Text('r/Community name', style: const TextStyle(fontSize: 17)),
      trailing: Icon(Icons.star_outline_rounded),
    );
  }
}
