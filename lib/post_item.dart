import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Icon(Icons.ac_unit),
          ),
          title: Text('r/community'),
          subtitle: Text('u/user'),
        ),
        const ListTile(

          title: Text('title'),
          subtitle: Text('description\n...\n...\n...',),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.thumb_up))),
              Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.thumb_down))),
              Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.comment))),
              Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.share)))
            ],
          ),
        ),
      ],
    );
  }
}
