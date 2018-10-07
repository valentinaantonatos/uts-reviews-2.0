package com.cts.entity;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "vote_subject")
public class ReviewSubject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JoinColumn(name = "user_id")
    @ManyToOne
    private User user;

    @JoinColumn(name = "subject_id")
    @ManyToOne
    private Subject subject;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "text",length = 500)
    private String text;

    @Column(name = "date")
    private Date date;

    //New:
    @Column(name = "rating")
    private Double rating;

    //New:
    @Column(name = "difficultyRating")
    private int difficultyRating;

    @Column(name = "mark", length = 3)
    private Integer mark;

    @Column(name = "flagged")
    private boolean flagged;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    //New - Subject Mark
    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public Integer getMark() {
        return mark;
    }

    // New stuff:
    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    // New stuff:
    public int getDifficultyRating() {
        return difficultyRating;
    }

    public void setDifficultyRating(int difficultyRating) {
        this.difficultyRating = difficultyRating;
    }

    public boolean getFlagged() {
      return flagged;
    }

    public void setFlagged(boolean flagged) {
      this.flagged = flagged;
    }

}
