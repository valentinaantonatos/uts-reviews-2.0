package com.cts.controller;

import java.util.List;

import com.cts.dao.SubjectRepository;
import com.cts.dao.TeacherRepository;
import com.cts.service.SubjectReviewService;
import com.cts.service.TeacherReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cts.entity.ReviewTeacher;
import com.cts.entity.ReviewSubject;

@Controller
public class ReviewController {

    @Autowired
    TeacherRepository teacherRepository;

    @Autowired
    SubjectRepository subjectRepository;

    @Autowired
    TeacherReviewService teacherReviewService;

    @Autowired
    SubjectReviewService subjectReviewService;

    @RequestMapping("/teacher/list")
    public ModelAndView teachers(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("teachers",teacherRepository.findAll());
        modelAndView.setViewName("teachers");
        return modelAndView;
    }

    @RequestMapping("/subject/list")
    public ModelAndView subjects(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("subjects",subjectRepository.findAll());
        modelAndView.setViewName("subjects");
        return modelAndView;
    }
    
    //if(subjectRepository.isEmpty()){
//            
//        } else {
//            modelAndView.setViewName("subjects");   
//        }

    @RequestMapping("/teacher/{id}/reviews")
    public ModelAndView teacherReviews(@PathVariable("id") Integer id){
        ModelAndView modelAndView = new ModelAndView();
        
        
        List<ReviewTeacher> teacher = teacherReviewService.getByTeacherId(id);
        
        
        modelAndView.addObject("teacherReviews",teacher);
        
        
        
        
        if (teacher.isEmpty()) {
            modelAndView.setViewName("teacher_no_reviews");
        }
        else {
            modelAndView.setViewName("teacher_reviews");
        }
        
        return modelAndView;
    }

    @RequestMapping("/subject/{id}/reviews")
    public ModelAndView subjectReviews(@PathVariable("id") Integer id){
        ModelAndView modelAndView = new ModelAndView();
        
        List<ReviewSubject> subject = subjectReviewService.getBySubjectId(id);
        
        modelAndView.addObject("subjectReviews", subject);
        
        if (subject.isEmpty()) {
        modelAndView.setViewName("subject_no_reviews");
        }
        else {
            modelAndView.setViewName("subject_reviews");
        }
        
        return modelAndView;
    }
}
