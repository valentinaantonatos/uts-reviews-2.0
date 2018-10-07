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

    @Column(name = "text",length = 500)
    private String text;

    @Column(name = "date")
    private Date date;
    
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
    
     public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
     public Boolean getFlagged() {
        return flagged;
    }

    public void setFlagged(Boolean flagged) {
        this.flagged = flagged;
    }


}
