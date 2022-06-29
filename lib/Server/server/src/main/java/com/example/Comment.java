package com.example;
import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class Comment {
    private long id;
    private String content;
    private User user;
    private LocalDate dateTime;

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

    @JsonProperty("dateTime")
    public LocalDate getDateTime() { return dateTime; }
    @JsonProperty("dateTime")
    public void setDateTime(LocalDate value) { this.dateTime = value; }
}
