import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('post details')),
      body: Column(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
