import 'post.dart';
import 'user.dart';

class Community {
  Community(this.id, this.name, this.description, this.users, this.posts);

  int id;
  String name;
  String description;
  User communityAdmin;
  List<User> users;
  List<Post> posts;
}
