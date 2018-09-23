package com.cts.dao;

import com.cts.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User,Integer>{

    @Query(value = "select * from user u where u.username=?1 and u.password=?2", nativeQuery = true)
    User login(String username,String password);

    @Query(value = "select max(id) from user", nativeQuery = true)
    Integer getMaxId();


}
