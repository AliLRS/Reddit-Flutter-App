import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';

class CommentItem extends StatelessWidget {
  CommentItem(this.comment, {Key key}) : super(key: key);
  Comment comment;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: Icon(Icons.ac_unit),
          ),
          title: Text('u/${comment.user.username}'),
        ),
        ListTile(
          title: Text(comment.content),
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
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                    const Text('16'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
