/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.UserDB;
import models.User;
import java.util.*;

/**
 *
 * @author polwu
 */
public class UserService {

    public User getUser(List<User> lst, String email) {
        return lst.stream().filter(user -> email.equals(user.getEmail().replace(" ", ""))).findFirst().orElse(null);
    }

    public List<User> getAll() throws Exception {
        return new UserDB().getAll();
    }

    public void insert(User user) throws Exception {
        new UserDB().insert(user);
    }

    public void update(User user) throws Exception {
        new UserDB().update(user);
    }

    public void delete(User user) throws Exception {
        new UserDB().delete(user);
    }

}
