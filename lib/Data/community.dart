import 'post.dart';
import 'user.dart';

class Community {
  Community(this.name, this.description, this.users, this.posts);

  String name;
  String description;
  User communityAdmin;
  List<User> users;
  List<Post> posts;
}
