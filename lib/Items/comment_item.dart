import 'package:flutter/material.dart';
import 'package:reddit/Data/models.dart';
import 'package:shamsi_date/shamsi_date.dart';

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
          title: Text('u/${comment.user.username} - ${Jalali.fromDateTime(DateTime.parse(comment.dateTime)).year}/' +
              '${Jalali.fromDateTime(DateTime.parse(comment.dateTime)).month}/' +
              '${Jalali.fromDateTime(DateTime.parse(comment.dateTime)).day}' +
              ' ${Jalali.fromDateTime(DateTime.parse(comment.dateTime)).hour}:' +
              '${Jalali.fromDateTime(DateTime.parse(comment.dateTime)).minute}'),
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
        ),
      ],
    );
  }
}
