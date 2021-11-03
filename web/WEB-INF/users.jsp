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
        <title>User Database</title>
    </head>
    <body>
        <div class="body-container">
            <h1>Hello World!</h1>
            <div class="add-container">
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
                            <option value="1">Admin</option>
                        </select>
                        <label for="isActive">Active</label>
                        <input type="checkbox" id="isActive" name="isActive" value="true">
                    </div>
                    <input name="action" value="add" type="hidden">
                    <input type="submit" value="Add User">

                </form>
            </div>

            <div class="table-container">
                <c:forEach items="${users}" var="user">
                    <div>${user.email} ${user.fName} ${user.lName} ${user.role} <a href="<c:url value="user?key=${user.email}"/>">Edit</a> <a href="<c:url value="user?delete=${user.email}"/>">Delete</a></div>
                </c:forEach>
            </div>

            <div class="edit-container">
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
                            <option value="1">Admin</option>
                        </select>
                        <label for="isActive-e">Active</label>
                        <input type="checkbox" id="isActive-e" name="isActive-e" value="true">
                    </div>
                    <input name="action" value="edit" type="hidden">
                    <input type="submit" value="Confirm">
                </form>
            </div>
        </div>



    </body>
</html>
