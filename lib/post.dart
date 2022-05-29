import 'user.dart';

class Post {
  String title;
  String text;
  DateTime dateTime;
  User user;

  Post(this.title, this.text, this.dateTime, this.user);
}