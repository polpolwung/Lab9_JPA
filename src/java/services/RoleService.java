/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.RoleDB;
import models.Role;

/**
 *
 * @author polwu
 */
public class RoleService {
 
    public Role getAll()throws Exception{
        return new RoleDB().getAll();
    }
            
}
