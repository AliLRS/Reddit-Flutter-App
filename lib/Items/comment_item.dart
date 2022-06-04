import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: Icon(Icons.ac_unit),
          ),
          title: Text('u/user'),
        ),
        ListTile(
          title: Text('Line1\nLine2\nLine3'),
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
                flex: 3,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                    const Text('16'),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.thumb_down)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.reply)),
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
