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
import javax.servlet.http.HttpServletRequest;
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

    //New Stuff
    @RequestMapping(value = "/user_profile")
    public String profilePage(HttpServletRequest request, HttpSession httpSession) {
        
        if (request.getParameter("passwordchange") == null) {
            httpSession.setAttribute("passwordUpdateRequested", false);
            //System.out.println(request.getParameter("passwordchange"));
        }
        else {
            httpSession.setAttribute("passwordUpdateRequested", true);
        }
           
        return "user_profile";
    }
    

    @RequestMapping(value = "/usr/login",method = RequestMethod.POST)
    public ModelAndView login(String username, String password, HttpSession httpSession, ModelAndView modelAndView){
        User user = userService.login(username,password);
        if (user==null){
            modelAndView.addObject("message","We're sorry. The username or password you entered is invalid.");
            modelAndView.setViewName("merror");
            return modelAndView;
        }
        httpSession.setAttribute("user",user);
        modelAndView.setViewName("redirect:/index");
        return modelAndView;
    }

    // Updating:
    @RequestMapping(value = "/usr/register",method = RequestMethod.POST)
    public String register(User user, HttpSession httpSession){
        // String username = user.getUsername();
        
        userService.addUser(user);
        httpSession.setAttribute("user",user);
        return "redirect:/index";
    }
    
    // Change Pass Attempt:
    @RequestMapping(value = "/user_profile/changepass",method = RequestMethod.POST)
    public String changePassword(@RequestParam("oldPassword")String oldPassword, @RequestParam("newPassword")String newPassword, @RequestParam("confirmPassword")String confirmPassword, HttpSession httpSession){
        User user  = (User) httpSession.getAttribute("user");
        //System.out.println(user.getPassword());
        
        if (user.getPassword().equals(oldPassword)) {
            //System.out.println("1");
            if (newPassword.equals(confirmPassword)) {
                userService.changePassword(user, newPassword);
                //System.out.println("2");
                
                httpSession.setAttribute("passwordUpdateSuccess", true);
                httpSession.setAttribute("error", "");
            } 
            else {
                httpSession.setAttribute("error", "Passwords do not match");
                httpSession.setAttribute("passwordUpdateSuccess", false);
                //System.out.println("3");
            }

        } 
        else {
            httpSession.setAttribute("error", "Old password is wrong");
            httpSession.setAttribute("passwordUpdateSuccess", false);
        }

        return "redirect:/user_profile?passwordchange=true";
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
                ,@RequestParam("text")String text, @RequestParam("teacherRating")Integer overallRating){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        ReviewTeacher reviewTeacher = new ReviewTeacher();
        reviewTeacher.setDate(new Date());
        reviewTeacher.setUser(userService.findById(id));
        reviewTeacher.setTeacher(teacherRepository.findOne(teacherId));
        reviewTeacher.setText(text);
        reviewTeacher.setOverallRating(overallRating);
        teacherReviewService.addReview(reviewTeacher);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/subject/add")
    public String addSubjectReviews(HttpSession httpSession, @RequestParam("subjectId") Integer subjectId
            ,@RequestParam("text")String text, @RequestParam("difficulty")Integer difficulty, @RequestParam("mark")String mark, @RequestParam("subjectRatingId")Integer overallRating){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        ReviewSubject reviewSubject = new ReviewSubject();
        reviewSubject.setDate(new Date());
        reviewSubject.setUser(userService.findById(id));
        reviewSubject.setSubject(subjectRepository.findOne(subjectId));
        reviewSubject.setText(text);
        reviewSubject.setMark(mark);
        reviewSubject.setDifficulty(difficulty);
        reviewSubject.setOverallRating(overallRating);
        subjectReviewService.addReview(reviewSubject);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/teacher/update")
    public String updateTeacherReviews(HttpSession httpSession, @RequestParam("id")Integer recordId
            ,@RequestParam("text")String text ,@RequestParam("teacherRating")Integer overallRating){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        teacherReviewService.updateReview(recordId,text,overallRating);
        return "redirect:/usr/views";
    }

    @RequestMapping("/usr/review/subject/update")
    public String updateSubjectReviews(HttpSession httpSession,@RequestParam("id")Integer recordId
            ,@RequestParam("text")String text, @RequestParam("mark")String mark, @RequestParam("difficulty")Integer difficulty, @RequestParam("subjectRatingId")Integer overallRating){
        User user  = (User) httpSession.getAttribute("user");
        Integer id = user==null?1:user.getId();
        subjectReviewService.updateReview(recordId,text,mark,difficulty,overallRating);
        return "redirect:/usr/views";
    }

    // New:
    @RequestMapping("/teacher/{id}/reviews/flag/{recordid}")
    public String flagTeacherReviews(@PathVariable("id")Integer id, @PathVariable("recordid")Integer recordId){
        teacherReviewService.getById(id);
        teacherReviewService.flagTeacherReview(recordId);
        return "redirect:/teacher/{id}/reviews";
    }
    
    // New:
    @RequestMapping("/subject/{id}/reviews/flag/{recordid}")
    public String flagSubjectReviews(@PathVariable("id")Integer id, @PathVariable("recordid")Integer recordId){
        subjectReviewService.getById(id);
        subjectReviewService.flagSubjectReview(recordId);
        return "redirect:/subject/{id}/reviews";
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
    
    //I want this to grab the users name and show it on their profile page
//    @RequestMapping("/usr/user_profile")
//    public String myProfile(String name, HttpSession httpSession){
//        httpSession.getAttribute("user", name);
//        }
}
