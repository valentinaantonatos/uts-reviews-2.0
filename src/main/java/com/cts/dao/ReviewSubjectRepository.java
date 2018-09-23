package com.cts.dao;

import com.cts.entity.ReviewSubject;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewSubjectRepository extends JpaRepository<ReviewSubject,Integer>{

    List<ReviewSubject> findBySubjectId(Integer subjectId);

    List<ReviewSubject> findByUserId(Integer userId);

    ReviewSubject findByUserIdAndSubjectId(Integer userId, Integer subjectId);
}
