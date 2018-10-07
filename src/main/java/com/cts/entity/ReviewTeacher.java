package com.cts.entity;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "vote_teacher")
public class ReviewTeacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JoinColumn(name = "user_id")
    @ManyToOne
    private User user;

    @JoinColumn(name = "teacher_id")
    @ManyToOne
    private Teacher teacher;

    @Column(name = "text",length = 500)
    private String text;

    @Column(name = "date")
    private Date date;

    //New:
    @Column(name = "rating")
    private Double rating;

    @Column(name = "flagged")
    private boolean flagged;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    // New stuff:
    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public boolean getFlagged() {
      return flagged;
    }

    public void setFlagged(boolean flagged) {
      this.flagged = flagged;
    }

}
