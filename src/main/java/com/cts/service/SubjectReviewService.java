package com.cts.service;

import com.cts.dao.ReviewSubjectRepository;
import com.cts.entity.ReviewSubject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class SubjectReviewService {

    @Autowired
    ReviewSubjectRepository reviewSubjectRepository;

    public ReviewSubject getById(Integer id){
        return reviewSubjectRepository.findOne(id);
    }

    public List<ReviewSubject> getBySubjectId(Integer subjectId){
        return reviewSubjectRepository.findBySubjectId(subjectId);
    }

    public List<ReviewSubject> getByUserId(Integer userId){
        return reviewSubjectRepository.findByUserId(userId);
    }

    @Transactional
    public void addReview(ReviewSubject reviewSubject){
        reviewSubjectRepository.save(reviewSubject);
    }

    @Transactional
    public void updateReview(Integer id, String text){
        ReviewSubject reviewSubject = reviewSubjectRepository.findOne(id);
        reviewSubject.setText(text);
        reviewSubject.setDate(new Date());
        reviewSubjectRepository.save(reviewSubject);
    }

    @Transactional
    public void deleteReview(Integer id){
        reviewSubjectRepository.delete(id);
    }
}
