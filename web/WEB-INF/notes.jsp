<%-- 
    Document   : notes
    Created on : Nov 1, 2019, 12:33:33 PM
    Author     : 794473
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Notes!</h1>
        <table style="width:60%">
            <thead>
                <tr>
                    <th>Date Created</th>
                    <th>Title</th>
                </tr>
            </thead>
            
            <c:forEach items="${displayNotes}" var="note">
                <tr> 
                    <td>${note.datecreated}</td>
                    <td>${note.title}</td>
                    <td>
                        <form><input type="submit" value="Edit"> <input type="hidden" name="edit" value="${note.noteid}"></form>
                    </td>
                </tr>
            </c:forEach>             
        </table>
        
        <c:if test="${control eq 'Add'}">
            <h2>Add Note</h2>
            <form method="post" action="notes">
                <input type="text" placeholder="title" name="titleBox" value="${note.title}">
                <br>
                <br>
                <textarea rows="10" cols="40" placeholder="type a note..." name="contentBox">${note.contents}</textarea>
                <br>
                <input type="submit" value="Add">
                <input type="hidden" name="option" value="Add">
            </form>
        </c:if>
        
        <c:if test="${control eq 'Edit'}">
            <h2>Edit Note</h2>
            <form method="post" action="notes">
                <input type="submit" value="Delete Note">
                <input type="hidden" name="option" value="Delete">
                <input type="hidden" name="edit" value="${note.noteid}">
            </form>  
            <form method="post" action="notes">    
                <br>
                <input type="text" placeholder="title" name="titleBox" value="${note.title}">
                <br>
                <br>
                <textarea rows="10" cols="40" placeholder="type a note..." name="contentBox">${note.contents}</textarea>
                <br>
                <input type="submit" value="Save">
                <input type="hidden" name="option" value="Save">
                <input type="hidden" name="edit" value="${note.noteid}">
            </form>
        </c:if>
             
        <c:if test="${errorMsg ne null}">
            ${errorMsg}
        </c:if>    
    </body>
</html>