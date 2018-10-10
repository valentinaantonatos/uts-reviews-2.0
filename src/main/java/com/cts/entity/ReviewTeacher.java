package com.cts.entity;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "vote_teacher")
public class ReviewTeacher {

  public ReviewTeacher(){
    text = "Default";
    overallRating = 0;
    flagged = "Unflagged";
  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @JoinColumn(name = "user_id")
  @ManyToOne
  private User user;

  @JoinColumn(name = "teacher_id")
  @ManyToOne
  private Teacher teacher;

  @Column(name = "text",length = 1000)
  private String text;

  @Column(name = "date")
  private Date date;

  //New:
  @Column(name = "overall_rating")
  private Integer overallRating;

  @Column(name = "flagged")
  private String flagged;

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
  public Integer getOverallRating() {
    return overallRating;
  }

  public void setOverallRating(Integer overallRating) {
    this.overallRating = overallRating;
  }

  public String getFlagged() {
    return flagged;
  }

  public void setFlagged(String flagged) {
    this.flagged = flagged;
  }

}
