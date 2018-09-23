package com.cts.entity;

import javax.persistence.*;


@Entity(name = "user")
public class User {
    @Id
    private Integer id;

    @Column(name = "name",length = 45)
    private String name;

    @Column(name = "username",length = 45)
    private String username;

    @Column(name = "password",length = 45)
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String userName) {
        this.username = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
