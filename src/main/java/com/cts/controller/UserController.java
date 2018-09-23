package com.cts.controller;

import com.cts.dao.SubjectRepository;
import com.cts.dao.TeacherRepository;
import com.cts.entity.*;
import com.cts.service.SubjectReviewService;
import com.cts.service.TeacherReviewService;
import com.cts.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    TeacherRepository teacherRepository;

    @Autowired
    SubjectRepository subjectRepository;

    @Autowired
    TeacherReviewService teacherReviewService;

    @Autowired
    SubjectReviewService subjectReviewService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/")
    public String index(){
        return "login";
    }

    @RequestMapping(value = "/index")
    public String indexPage(){
        return "index";
    }

    @RequestMapping(value = "/register")
    public String registerPage(){
        return "register";
    }

    @RequestMapping(value = "/usr/login",method = RequestMethod.POST)
    public ModelAndView login(String username, String password, HttpSession httpSession, ModelAndView modelAndView){
        User user = userService.login(username,password);
        if (user==null){
            modelAndView.addObject("message","Username or password is invalid!");
            modelAndView.setViewName("merror");
            return modelAndView;
        }
        httpSession.setAttribute("user",user);
        modelAndView.setViewName("redirect:/index");
        return modelAndView;
    }

    @RequestMapping(value = "/usr/register",method = RequestMethod.POST)
    public String register(User user, HttpSession httpSession){
        userService.addUser(user);
        httpSession.setAttribute("user",user);
        return "redirect:/index";
    }

    @RequestMapping("/usr/views")
    public ModelAndView userViews(HttpSession httpSession){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        ModelAndView modelAndView = new ModelAndView();
        if (user!=null){
            modelAndView.addObject("teacherReviews",teacherReviewService.getByUserId(id));
            modelAndView.addObject("subjectReviews", subjectReviewService.getByUserId(id));
            modelAndView.setViewName("user_reviews");
            return modelAndView;
        }
        modelAndView.addObject("teacherReviews",teacherReviewService.getByUserId(id));
        modelAndView.addObject("subjectReviews", subjectReviewService.getByUserId(id));
        //modelAndView.setViewName("error");
        modelAndView.setViewName("user_reviews");
        return modelAndView;
    }

    @RequestMapping("/usr/review/teacher/list")
    public @ResponseBody
    List<Teacher> teachers(HttpSession httpSession){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        return teacherRepository.findAll();
    }

    @RequestMapping("/usr/review/teacher/{id}")
    public @ResponseBody
    ReviewTeacher getTeacherReview(HttpSession httpSession,@PathVariable("id")Integer recordId){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        return teacherReviewService.getById(recordId);
    }

    @RequestMapping("/usr/review/subject/{id}")
    public @ResponseBody
    ReviewSubject getSubjectReview(HttpSession httpSession,@PathVariable("id")Integer recordId){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        return subjectReviewService.getById(recordId);
    }

    @RequestMapping("/usr/review/subject/list")
    public @ResponseBody
    List<Subject> subjects(HttpSession httpSession){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        return subjectRepository.findAll();
    }

    @RequestMapping("/usr/review/teacher/add")
    public String addTeacherReviews(HttpSession httpSession, @RequestParam("teacherId") Integer teacherId
                ,@RequestParam("text")String text){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        ReviewTeacher reviewTeacher = new ReviewTeacher();
        reviewTeacher.setDate(new Date());
        reviewTeacher.setUser(userService.findById(id));
        reviewTeacher.setTeacher(teacherRepository.findOne(teacherId));
        reviewTeacher.setText(text);
        teacherReviewService.addReview(reviewTeacher);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/subject/add")
    public String addSubjectReviews(HttpSession httpSession, @RequestParam("subjectId") Integer subjectId
            ,@RequestParam("text")String text){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        ReviewSubject reviewSubject = new ReviewSubject();
        reviewSubject.setDate(new Date());
        reviewSubject.setUser(userService.findById(id));
        reviewSubject.setSubject(subjectRepository.findOne(subjectId));
        reviewSubject.setText(text);
        subjectReviewService.addReview(reviewSubject);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/teacher/update")
    public String updateTeacherReviews(HttpSession httpSession, @RequestParam("id")Integer recordId
            ,@RequestParam("text")String text){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        teacherReviewService.updateReview(recordId,text);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/subject/update")
    public String updateSubjectReviews(HttpSession httpSession,@RequestParam("id")Integer recordId
            ,@RequestParam("text")String text){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        subjectReviewService.updateReview(recordId,text);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/teacher/delete/{id}")
    public String deleteTeacherReviews(@PathVariable("id") Integer id){
        teacherReviewService.deleteReview(id);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/subject/delete/{id}")
    public String deleteSubjectReviews(@PathVariable("id") Integer id){
        subjectReviewService.deleteReview(id);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/logout")
    public String deleteSubjectReviews(HttpSession httpSession){
        httpSession.removeAttribute("user");
        httpSession.invalidate();
        return "redirect:/";
    }
}
