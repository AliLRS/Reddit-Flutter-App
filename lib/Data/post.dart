import 'package:reddit/Data/community.dart';

import 'comment.dart';
import 'user.dart';

class Post {
  int id;
  String title;
  String content;
  User user;
  Community community;
  DateTime dateTime;
  List<Comment> comments;

  Post(this.title, this.content, this.user) {
    dateTime = DateTime.now();
  }
}
