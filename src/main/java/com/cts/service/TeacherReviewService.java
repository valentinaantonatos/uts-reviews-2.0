package com.cts.service;

import com.cts.dao.ReviewTeacherRepository;
import com.cts.entity.ReviewSubject;
import com.cts.entity.ReviewTeacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class TeacherReviewService {
    @Autowired
    ReviewTeacherRepository reviewTeacherRepository;

    public ReviewTeacher getById(Integer id){
        return reviewTeacherRepository.findOne(id);
    }

    public List<ReviewTeacher> getByTeacherId(Integer id){
        return reviewTeacherRepository.findByTeacherId(id);
    }

    public List<ReviewTeacher> getByUserId(Integer id){
        return reviewTeacherRepository.findByUserId(id);
    }

    @Transactional
    public void addReview(ReviewTeacher reviewTeacher){
        ReviewTeacher t = reviewTeacherRepository.save(reviewTeacher);
        System.out.println(t.getText());
    }

    @Transactional
    public void updateReview(Integer id,String text){
        ReviewTeacher reviewTeacher = reviewTeacherRepository.findOne(id);
        reviewTeacher.setText(text);
        reviewTeacher.setDate(new Date());
        reviewTeacherRepository.save(reviewTeacher);
    }

    @Transactional
    public void deleteReview(Integer id){
        reviewTeacherRepository.delete(id);
    }
}
