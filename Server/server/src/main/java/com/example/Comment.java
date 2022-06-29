package com.example;
import com.fasterxml.jackson.annotation.*;
import java.util.Date;

public class Comment {
    private long id;
    private String content;
    private User user;
    private Post post;
    private Date dateTime;

    @JsonProperty("id")
    public long getID() { return id; }
    @JsonProperty("id")
    public void setID(long value) { this.id = value; }

    @JsonProperty("content")
    public String getContent() { return content; }
    @JsonProperty("content")
    public void setContent(String value) { this.content = value; }

    @JsonProperty("user")
    public User getuser() { return user; }
    @JsonProperty("user")
    public void setuser(User value) { this.user = value; }

    @JsonProperty("post")
    public Post getPost() { return post; }
    @JsonProperty("post")
    public void setPost(Post value) { this.post = value; }

    @JsonProperty("dateTime")
    public Date getDateTime() { return dateTime; }
    @JsonProperty("dateTime")
    public void setDateTime(Date value) { this.dateTime = value; }
}
