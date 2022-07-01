// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

List<Community> communityFromJson(String str) =>
    List<Community>.from(json.decode(str).map((x) => Community.fromJson(x)));

class Community {
  Community({
    this.name,
    this.description,
    this.communityAdmin,
    this.posts,
    this.users,
  });

  String name;
  String description;
  User communityAdmin;
  List<Post> posts;
  List<User> users;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        name: json["name"],
        description: json["description"],
        communityAdmin: json["communityAdmin"] == null
            ? null
            : User.fromJson(json["communityAdmin"]),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "communityAdmin":
            communityAdmin == null ? null : communityAdmin.toJson(),
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts.map((x) => x.toJson())),
        "users": users == null
            ? []
            : List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.username,
    this.email,
    this.password,
    this.communities,
    this.posts,
    this.savedPosts,
    this.favoriteCommunities,
  });

  String username;
  String email;
  String password;
  List<Community> communities;
  List<Post> posts;
  List<int> savedPosts;
  List<String> favoriteCommunities;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        communities: List<Community>.from(
            json["communities"].map((x) => Community.fromJson(x))),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        savedPosts: List<int>.from(json["savedPosts"].map((x) => x)),
        favoriteCommunities: List<String>.from(json["favoriteCommunities"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "communities": communities == null
            ? []
            : List<dynamic>.from(communities.map((x) => x.toJson())),
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts.map((x) => x.toJson())),
        "savedPosts": savedPosts == null
            ? []
            : List<dynamic>.from(savedPosts.map((x) => x)),
        "favoriteCommunities": favoriteCommunities == null
            ? []
            : List<dynamic>.from(favoriteCommunities),
      };
}

class Post {
  Post({
    this.id,
    this.title,
    this.content,
    this.user,
    this.dateTime,
    this.community,
    this.comments,
  });

  int id;
  String title;
  String content;
  User user;
  String dateTime;
  Community community;
  List<Comment> comments;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        dateTime: json["dateTime"],
        community: json["community"] == null
            ? null
            : Community.fromJson(json["community"]),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "user": user == null ? null : user.toJson(),
        "dateTime": dateTime,
        "community": community == null ? null : community.toJson(),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.id,
    this.content,
    this.user,
    this.post,
    this.dateTime,
  });

  int id;
  String content;
  User user;
  Post post;
  String dateTime;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        post: json["post"] == null ? null : Post.fromJson(json["post"]),
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "user": user == null ? null : user.toJson(),
        "post": post == null ? null : post.toJson(),
        "dateTime": dateTime,
      };
}
