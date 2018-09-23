package com.cts.service;

import com.cts.dao.UserRepository;
import com.cts.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Transactional
    public User addUser(User u){
        Integer maxId = userRepository.getMaxId();
        u.setId(maxId+1);
        return userRepository.save(u);
    }

    public User findById(Integer id){
        return userRepository.findOne(id);
    }

    public User login(String username, String password){
        return userRepository.login(username,password);
    }

}
