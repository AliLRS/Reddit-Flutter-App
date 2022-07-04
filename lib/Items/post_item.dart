import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:reddit/View/MainPages/add_comment_page.dart';
import 'package:reddit/View/MainPages/post_page.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PostItem extends StatelessWidget {
  PostItem(this.post, {Key key}) : super(key: key);
  Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.ac_unit),
                ),
                title: Text('r/${post.community.name}'),
                subtitle: Text('u/${post.user.username} - ${Jalali.fromDateTime(DateTime.parse(post.dateTime)).year}/' +
                    '${Jalali.fromDateTime(DateTime.parse(post.dateTime)).month}/' +
                    '${Jalali.fromDateTime(DateTime.parse(post.dateTime)).day}' +
                    ' ${Jalali.fromDateTime(DateTime.parse(post.dateTime)).hour}:' +
                    '${Jalali.fromDateTime(DateTime.parse(post.dateTime)).minute}'),
              ),
              ListTile(
                title: Text(post.title),
                subtitle: Text(post.content),
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
                    post.likers == null
                        ? Text('0')
                        : Text(post.likers.length.toString()),
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
                                  builder: (context) => AddCommentPage(post)));
                        },
                        icon: const Icon(Icons.comment)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_add),
                    ),
                    const Text('Save'),
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
