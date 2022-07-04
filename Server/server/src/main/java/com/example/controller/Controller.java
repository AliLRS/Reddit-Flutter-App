package com.example.controller;
import com.example.Comment;
import com.example.Community;
import com.example.Post;
import com.example.database.Database;
import com.example.User;
import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Controller {

    private String signUp(String userJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        User[] users = Database.getUsers();
        for (User u : users){
            if (u.getUsername().equals(user.getUsername()))
                return "This username is already used";
            if (u.getEmail().equals(user.getEmail()))
                return "This email already has an account";
        }
        User[] result = Arrays.copyOf(users, users.length + 1);
        result[result.length - 1] = user;
        if (Database.writeUsers(result))
            return "done";
        return "error!";
    }

    private String login(String userJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername())) {
                if (u.getPassword().equals(user.getPassword()))
                    return gson.toJson(u);
                else
                    return "Password is incorrect";
            }
        }
        return "Username does not exist";
    }

    private String editProfile(String olderUser, String newerUser) {
        Gson gson = new Gson();
        User oldUser = gson.fromJson(olderUser, User.class);
        User newUser = gson.fromJson(newerUser, User.class);
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(oldUser.getUsername())) {
                u.setPassword(newUser.getPassword());
                u.setEmail(newUser.getEmail());
                break;
            }
        }
        if (Database.writeUsers(users))
            return "done";
        return "error!";
    }

    private String addCommunity(String communityJson) {
        Gson gson = new Gson();
        Community community = gson.fromJson(communityJson, Community.class);
        Community[] communities = Database.getCommunities();
        for (Community c : communities) {
            if (c.getName().equals(community.getName()))
                return "This name is already used";
        }
        Community[] result = Arrays.copyOf(communities, communities.length + 1);
        result[result.length - 1] = community;

        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(community.getCommunityAdmin().getUsername())) {
                Community[] userCommunities = Arrays.copyOf(u.getCommunities(), u.getCommunities().length + 1);
                userCommunities[userCommunities.length - 1] = community;
                u.setCommunities(userCommunities);
            }
        }

        if (Database.writeCommunities(result) && Database.writeUsers(users))
            return "done";
        return "error!";
    }

    private String getCommunities() {
        return new Gson().toJson(Database.getCommunities());
    }

    private String followCommunity(String communityJson, String userJson) {
        boolean isAdded = false;
        Gson gson = new Gson();
        Community community = gson.fromJson(communityJson, Community.class);
        User user = gson.fromJson(userJson, User.class);
        Community[] communities = new Community[0];
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername())){
                communities = u.getCommunities();
            }
        }
        List<Community> communityList = new ArrayList<>();
        for (Community c : communities) {
            if (!c.getName().equals(community.getName())) {
                communityList.add(c);
            }
        }
        if (communityList.size() == communities.length) {
            communityList.add(community);
            isAdded = true;
        }
        communities = new Community[communityList.size()];
        communityList.toArray(communities);
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername())){
                u.setCommunities(communities);
            }
        }
        User[] comUsers;
        Community[] dataBaseCommunity = Database.getCommunities();
        for (Community c : dataBaseCommunity) {
            if (c.getName().equals(community.getName())) {
                User[] gottenUsers = c.getUsers();
                if (isAdded) {
                    comUsers = Arrays.copyOf(gottenUsers, gottenUsers.length + 1);
                    comUsers[comUsers.length - 1] = user;
                }
                else {
                    if (gottenUsers.length < 1)
                        comUsers = new User[0];
                    else
                        comUsers = new User[gottenUsers.length - 1];
                    int index = 0;
                    for (User gottenUser : gottenUsers) {
                        comUsers[index++] = gottenUser;
                    }
                }
                c.setUsers(comUsers);
                break;
            }
        }
        if (Database.writeUsers(users) && Database.writeCommunities(dataBaseCommunity)) {
            if (isAdded)
                return "followed";
            else
                return "unfollowed";
        }
        return "error!";
    }

    private String addPost(String postJson, String communityJson, String userJson) {
        Gson gson = new Gson();
        Post post = gson.fromJson(postJson, Post.class);
        Community community = gson.fromJson(communityJson, Community.class);
        User user = gson.fromJson(userJson, User.class);
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername())) {
                Post[] userPosts = Arrays.copyOf( u.getPosts(),  u.getPosts().length + 1);
                userPosts[userPosts.length - 1]  = post;
                u.setPosts(userPosts);
                break;
            }
        }
        Community[] communities = Database.getCommunities();
        for (Community c : communities) {
            if (c.getName().equals(community.getName())) {
                Post[] communityPosts = Arrays.copyOf( c.getPosts(), c.getPosts().length + 1);
                communityPosts[communityPosts.length - 1]  = post;
                c.setPosts(communityPosts);
                break;
            }
        }
        if (Database.writeCommunities(communities) && Database.writeUsers(users))
            return "done";
        return "error!";
    }

    private String getAllPosts() {
        Gson gson = new Gson();
        Community[] communities = Database.getCommunities();
        List<Post> postList = new ArrayList<>();
        for (Community c : communities) {
            postList.addAll(Arrays.asList(c.getPosts()));
        }
        Post[] posts = new Post[postList.size()];
        postList.toArray(posts);
        return gson.toJson(posts);
    }

    private String getPosts(String communityJson) {
        Gson gson = new Gson();
        Community community = gson.fromJson(communityJson, Community.class);
        Community[] communities = Database.getCommunities();
        for (Community c : communities) {
            if (c.getName().equals(community.getName())) {
                return gson.toJson(c.getPosts());
            }
        }
        return "error!";
    }

    private String getUserPosts(String userJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        Community[] communities = user.getCommunities();
        List<Post> postList = new ArrayList<>();
        for (Community c : communities) {
            postList.addAll(Arrays.asList(c.getPosts()));
        }
        Post[] posts = new Post[postList.size()];
        postList.toArray(posts);
        return gson.toJson(posts);
    }

    private String updateUser(String userJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        User[] users = Database.getUsers();
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername()))
                return gson.toJson(u);
        }
        return "error!";
    }

    private String addComment(String postJson, String commentJson) {
        Gson gson = new Gson();
        Post post = gson.fromJson(postJson, Post.class);
        Comment comment = gson.fromJson(commentJson, Comment.class);
        Community[] communities = Database.getCommunities();
        outerLoop:
        for (Community c : communities) {
            if (c.getName().equals(post.getCommunity().getName())) {
                for (Post p : c.getPosts()) {
                    if (p.getTitle().equals(post.getTitle()) && p.getContent().equals(post.getContent())) {
                        Comment[] comments = Arrays.copyOf(p.getComments() , p.getComments().length + 1);
                        comments[comments.length - 1] = comment;
                        p.setComments(comments);
                        break outerLoop;
                    }
                }
            }
        }
        if (Database.writeCommunities(communities))
            return "done";
        return "error!";
    }

    private String getComments(String postJson) {
        Gson gson = new Gson();
        Post post = gson.fromJson(postJson, Post.class);
        Community[] communities = Database.getCommunities();
        for (Community c : communities) {
            if (c.getName().equals(post.getCommunity().getName())) {
                for (Post p : c.getPosts()) {
                    if (p.getTitle().equals(post.getTitle()) && p.getContent().equals(post.getContent())) {
                        return gson.toJson(p.getComments());
                    }
                }
            }
        }
        return "error!";
    }

    private String like(String userJson, String postJson) {
        Gson gson = new Gson();
        User user = gson.fromJson(userJson, User.class);
        Post post = gson.fromJson(postJson, Post.class);
        boolean like = true;
        List<User> userList = new ArrayList<>();
        for (User u : post.getLikers()) {
            if (u.getUsername().equals(user.getUsername())) {
                like = false;
            }
            else {
                userList.add(u);
            }
        }
        if (like) {
            userList.add(user);
        }
        User[] users = new User[userList.size()];
        userList.toArray(users);
        Community[] communities = Database.getCommunities();
        outerLoop:
        for (Community c : communities) {
            if (c.getName().equals(post.getCommunity().getName())) {
                for (Post p : c.getPosts()) {
                    if (p.getID() == post.getID()) {
                        p.setLikers(users);
                        break outerLoop;
                    }
                }
            }
        }
        if (Database.writeCommunities(communities)) {
            if (like)
                return "liked";
            else
                return "disliked";
        }
        return "error!";
    }

    public String run(String request){
        String[] split = request.split(",,");
        switch (split[0]) {
            case "signUp":
                return signUp(split[1]);
            case "login":
                return login(split[1]);
            case "editProfile":
                return editProfile(split[1], split[2]);
            case "addCommunity":
                return addCommunity(split[1]);
            case "getCommunities":
                return getCommunities();
            case "followCommunity":
                return followCommunity(split[1], split[2]);
            case "getAllPosts":
                return getAllPosts();
            case "addPost":
                return addPost(split[1], split[2], split[3]);
            case "getPosts":
                return getPosts(split[1]);
            case "getUserPosts":
                return getUserPosts(split[1]);
            case "updateUser":
                return updateUser(split[1]);
            case "addComment":
                return addComment(split[1], split[2]);
            case "getComments":
                return getComments(split[1]);
            case "like":
                return like(split[1], split[2]);
        }
        return "invalid request";
    }


}
