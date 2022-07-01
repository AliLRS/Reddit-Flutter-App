import 'package:reddit/Data/models.dart';
import 'package:reddit/Items/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:reddit/View/MainPages/add_comment_page.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PostPage extends StatefulWidget {
  PostPage(this.post, {Key key}) : super(key: key);
  Post post;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _commentController;
  bool _isButtonActive = false;
  List<CommentItem> _comments = [];

  @override
  initState() {
    super.initState();
    _comments = widget.post.comments.map((c) => CommentItem(c)).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.title)),
      body: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              child: Icon(Icons.ac_unit),
            ),
            title: Text('r/${widget.post.user.username}'),
            subtitle: Text('u/${widget.post.user.username} - ${Jalali.fromDateTime(DateTime.parse(widget.post.dateTime)).year}/' +
                '${Jalali.fromDateTime(DateTime.parse(widget.post.dateTime)).month}/' +
                '${Jalali.fromDateTime(DateTime.parse(widget.post.dateTime)).day}' +
                ' ${Jalali.fromDateTime(DateTime.parse(widget.post.dateTime)).hour}:' +
                '${Jalali.fromDateTime(DateTime.parse(widget.post.dateTime)).minute}'),
          ),
          ListTile(
            title: Text(widget.post.title),
            subtitle: Text(widget.post.content),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddCommentPage(widget.post)));
                        },
                        icon: const Icon(Icons.comment)),
                    Text(widget.post.comments.length.toString()),
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
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return _comments[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
