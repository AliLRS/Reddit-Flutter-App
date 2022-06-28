import 'community.dart';
import 'post.dart';

class User {
  static User activeUser;
  static List<User> allUsers = [User("Ali", "Ali@gmail.com", "Ali12345")];

  String username;
  String email;
  String password;
  List<Community> communities;
  List<Post> posts;
  List<Post> savedPosts;

  User(this.username, this.email, this.password) {
    communities = [];
    posts = [];
  }

  void addCommunity(Community community) {
    communities.add(community);
  }

  void addPost(Post post) {
    posts.add(post);
  }
}
