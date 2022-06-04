import 'package:reddit/Items/comment_item.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  PostPage(this.post, {Key key}) : super(key: key);
  String post;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<CommentItem> comments = [
    CommentItem(),
    CommentItem(),
    CommentItem(),
    CommentItem(),
    CommentItem(),
    CommentItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post)),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(Icons.ac_unit),
            ),
            title: Text(widget.post),
            subtitle: Text('u/user'),
          ),
          ListTile(
            title: Text('title'),
            subtitle: Text('description\n...\n...\n...'),
          ),
          Row(
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
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          ListView.builder(itemBuilder: (context, index) 

            return comments[index];
          }),
        ],
      ),
    );
  }
}
