package com.cts.dao;

import com.cts.entity.ReviewTeacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewTeacherRepository extends JpaRepository<ReviewTeacher, Integer>{

    List<ReviewTeacher> findByTeacherId(Integer subjectId);

    List<ReviewTeacher> findByUserId(Integer userId);

    ReviewTeacher findByUserIdAndTeacherId(Integer userId, Integer subjectId);

}
