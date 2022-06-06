import 'package:flutter/material.dart';

import '../MainPages/post_page.dart';

class PostItem extends StatelessWidget {
  PostItem(this.post, {Key key}) : super(key: key);
  String post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Column(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.ac_unit),
                ),
                title: Text('r/community'),
                subtitle: const Text('u/user' ' - ' '6/6/2022'),
              ),
              ListTile(
                title: Text('title'),
                subtitle: Text(
                  'description\n...\n...\n...',
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PostPage(post);
            }));
          },
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
                flex: 2,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.comment)),
                    const Text('2'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                    const Text('Share'),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
