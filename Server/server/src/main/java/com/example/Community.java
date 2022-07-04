package com.example;
import com.fasterxml.jackson.annotation.*;

import java.io.Serializable;

public class Community implements Serializable {
    private String name;
    private String description;
    private User communityAdmin;
    private Post[] posts;
    private User[] users;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }

    @JsonProperty("communityAdmin")
    public User getCommunityAdmin() { return communityAdmin; }
    @JsonProperty("communityAdmin")
    public void setCommunityAdmin(User value) { this.communityAdmin = value; }

    @JsonProperty("posts")
    public Post[] getPosts() { return posts; }
    @JsonProperty("posts")
    public void setPosts(Post[] value) { this.posts = value; }

    @JsonProperty("users")
    public User[] getUsers() { return users; }
    @JsonProperty("users")
    public void setUsers(User[] value) { this.users = value; }
}
