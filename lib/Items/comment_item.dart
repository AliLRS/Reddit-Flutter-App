import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.ac_unit),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('u/user'),
                  Text('comment'),
                ],
              ),
            ),
          ],
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
