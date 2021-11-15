/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Role;
import models.User;
import services.RoleService;
import services.UserService;

/**
 *
 * @author 775262
 */
public class UserServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserService us = new UserService();
        RoleService rs = new RoleService();
        List<Role> roles = (List<Role>) session.getAttribute("rolls");
        if (roles == null) {
            try {
                roles = (List<Role>) rs.getAll();
                session.setAttribute("roles", roles);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        List<User> users = (List<User>) request.getAttribute("users");
        if (users == null) {
            try {
                users = us.getAll();
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if (request.getParameter("key") != null) {
            User user = us.getUser(users, request.getParameter("key").replace(" ", "+"));
            request.setAttribute("user", user);
        }
        
        if (request.getParameter("delete") != null) {
            User user = us.getUser(users, request.getParameter("delete").replace(" ", "+"));
            try {
                us.delete(user);
                users = us.getAll();
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        request.setAttribute("users", users);
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            UserService us = new UserService();
            List<User> users = us.getAll();
            String action = request.getParameter("action");
            
            if (action.equals("add")) {
                String email = request.getParameter("email");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String password = request.getParameter("password");
                int role = Integer.parseInt(request.getParameter("role"));
                boolean isActive = request.getParameter("isActive") != null;
                User user = new User(email, isActive, fname, lname, password, role);
                us.insert(user);
            }
            
            if (action.equals("edit")) {
                
                String email = request.getParameter("email-e");
                String fname = request.getParameter("fname-e");
                String lname = request.getParameter("lname-e");
                String password = request.getParameter("password-e");
                int role = Integer.parseInt(request.getParameter("role-e"));
                boolean isActive = request.getParameter("isActive-e") != null;
                User user = new User(email, isActive, fname, lname, password, role);
                Logger.getAnonymousLogger().log(Level.SEVERE, password);
                us.update(user);
                
            }
            users = us.getAll();
            request.setAttribute("users", users);
            
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }
    
}
