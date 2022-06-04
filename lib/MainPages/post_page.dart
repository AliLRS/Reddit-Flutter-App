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
    const CommentItem(),
    const CommentItem(),
    const CommentItem(),
    const CommentItem(),
    const CommentItem(),
    const CommentItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post)),
      body: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              child: Icon(Icons.ac_unit),
            ),
            title: Text(widget.post),
            subtitle: const Text('u/user'),
          ),
          const ListTile(
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
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 320,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return comments[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
