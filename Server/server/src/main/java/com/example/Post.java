package com.example;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.*;

public class Post implements Serializable {
    private long id;
    private String title;
    private String content;
    private User user;
    private String dateTime;
    private Community community;
    private Comment[] comments;
    private User[] likers;

    @JsonProperty("id")
    public long getID() { return id; }
    @JsonProperty("id")
    public void setID(long value) { this.id = value; }

    @JsonProperty("title")
    public String getTitle() { return title; }
    @JsonProperty("title")
    public void setTitle(String value) { this.title = value; }

    @JsonProperty("content")
    public String getContent() { return content; }
    @JsonProperty("content")
    public void setContent(String value) { this.content = value; }

    @JsonProperty("user")
    public User getUser() { return user; }
    @JsonProperty("user")
    public void setUser(User value) { this.user = value; }

    @JsonProperty("dateTime")
    public String getDateTime() { return dateTime; }
    @JsonProperty("dateTime")
    public void setDateTime(String value) { this.dateTime = value; }

    @JsonProperty("community")
    public Community getCommunity() { return community; }
    @JsonProperty("community")
    public void setCommunity(Community value) { this.community = value; }

    @JsonProperty("comments")
    public Comment[] getComments() { return comments; }
    @JsonProperty("comments")
    public void setComments(Comment[] value) { this.comments = value; }

    @JsonProperty("likers")
    public User[] getLikers() { return likers; }
    @JsonProperty("likers")
    public void setLikers(User[] value) { this.likers = value; }
}
