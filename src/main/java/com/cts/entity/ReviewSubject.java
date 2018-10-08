package com.cts.entity;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "vote_subject")
public class ReviewSubject {
    
    public ReviewSubject(){
        text = "Default";
        overallRating = 0.0;
        difficulty = 0;
        mark = 0;
        flagged = false;
    }

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
    @Column(name = "overall_rating")
    private Double overallRating;

    //New:
    @Column(name = "difficulty", nullable = true)
    private Integer difficulty;

    @Column(name = "mark", nullable=false)
    private Integer mark;

    @Column(name = "flagged")
    private Boolean flagged;

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
        //return mark;
        return mark == null ? 0 : mark;
    }

    // New stuff:
    public double getOverallRating() {
        return overallRating;
    }

    public void setOverallRating(double overallRating) {
        this.overallRating = overallRating;
    }

    // New stuff:
    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public Boolean getFlagged() {
      return flagged;
    }

    public void setFlagged(Boolean flagged) {
      this.flagged = flagged;
    }

}
