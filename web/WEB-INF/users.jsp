<%-- 
    Document   : users
    Created on : 27-Oct-2021, 2:10:05 PM
    Author     : polwu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/main.css" />
        <title>User Database</title>
    </head>
    <body>
        <div class="container">
            <div class="body-container">

                <div class="add-container">
                    <h1>Add User</h1>
                    <form action ="user" method="POST">
                        <div>
                            <input type="text" name="email" required="true" placeholder="Email">
                        </div>
                        <div>
                            <input type="text" name="fname" required="true" placeholder="First Name">
                        </div>
                        <div>
                            <input type="text" name="lname" required="true" placeholder="Last Name">
                        </div>
                        <div>
                            <input type="password" name="password" required="true" placeholder="Password">
                        </div>
                        <div>
                            <select name="role">
                                <c:forEach items="${roles}" var="role">
                                    <option value="${role.roleID}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                            <label for="isActive">Active</label>
                            <input type="checkbox" id="isActive" name="isActive" value="true">
                        </div>
                        <input name="action" value="add" type="hidden">
                        <input class="button" type="submit" value="Add User">

                    </form>
                </div>

                <div class="table-container">
                    <h1>Users</h1>
                    <div class="table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${users}" var="user">
                                    <tr>
                                        <td>${user.email}</td>
                                        <td>${user.fName}</td>
                                        <td>${user.lName}</td>
                                        <td><a href="<c:url value="user?key=${user.email}"/>">Edit</a></td>
                                        <td><a href="<c:url value="user?delete=${user.email}"/>">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>


                        </table>
                    </div>
                </div>

                <div class="edit-container">
                    <h1>Edit User</h1>
                    <form action ="user" method="POST">
                        <div>
                            <input type="text" name="email-e" placeholder="Email" readonly value="${user.email}">
                        </div>
                        <div>
                            <input type="text" name="fname-e" required="true" placeholder="First Name" value="${user.fName}">
                        </div>
                        <div>
                            <input type="text" name="lname-e" required="true" placeholder="Last Name" value="${user.lName}">
                        </div>
                        <div>
                            <input type="password" name="password-e" required="true" placeholder="Password" value="${user.password}">
                        </div>
                        <div>
                            <select name="role-e">
                                
                                <c:forEach items="${roles}" var="role">
                                    <option value="${role.roleID}" ${user.role == role.roleID? "selected" : null}>${role.roleName}</option>
                                </c:forEach>
                                
                                
                            </select>
                            <label for="isActive-e">Active</label>
                            <input type="checkbox" id="isActive-e" name="isActive-e" value="true">
                        </div>
                        <input name="action" value="edit" type="hidden">
                        <input class="button" type="submit" value="Confirm">
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
