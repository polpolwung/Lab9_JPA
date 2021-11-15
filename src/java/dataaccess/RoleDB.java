/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;


import models.Role;
import javax.persistence.EntityManager;
import static models.Role_.roleId;

public class RoleDB {
    
    public Role getAll() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Role role = em.find(Role.class, roleId);
            return role;
        } finally {
            em.close();
        }
            }
    
}
