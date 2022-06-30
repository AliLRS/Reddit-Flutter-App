package com.example;
import com.fasterxml.jackson.annotation.*;

import java.io.Serializable;

public class User implements Serializable {
    private String username;
    private String email;
    private String password;
    private Community[] communities;
    private Post[] posts;
    private long[] savedPosts;
    private String[] favoriteCommunities;

    @JsonProperty("username")
    public String getUsername() { return username; }
    @JsonProperty("username")
    public void setUsername(String value) { this.username = value; }

    @JsonProperty("email")
    public String getEmail() { return email; }
    @JsonProperty("email")
    public void setEmail(String value) { this.email = value; }

    @JsonProperty("password")
    public String getPassword() { return password; }
    @JsonProperty("password")
    public void setPassword(String value) { this.password = value; }

    @JsonProperty("communities")
    public Community[] getCommunities() { return communities; }
    @JsonProperty("communities")
    public void setCommunities(Community[] value) { this.communities = value; }

    @JsonProperty("posts")
    public Post[] getPosts() { return posts; }
    @JsonProperty("posts")
    public void setPosts(Post[] value) { this.posts = value; }

    @JsonProperty("savedPosts")
    public long[] getSavedPosts() { return savedPosts; }
    @JsonProperty("savedPosts")
    public void setSavedPosts(long[] value) { this.savedPosts = value; }

    @JsonProperty("favoriteCommunities")
    public String[] getfavoriteCommunities() { return favoriteCommunities; }
    @JsonProperty("favoriteCommunities")
    public void setfavoriteCommunities(String[] value) { this.favoriteCommunities = value; }

}
