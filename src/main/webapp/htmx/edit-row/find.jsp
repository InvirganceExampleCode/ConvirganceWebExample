<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<% if(request.getParameter("id") != null) { %>
<virge:iterate var="item" items="${contacts}">

    <virge:object var="contact" scope="request">
        <virge:key name="id" value="${param.id eq item.id ? item.id : null}" default="${contact.id}" />
        <virge:key name="name" value="${param.id eq item.id ? item.name : null}" default="${contact.name}" />
        <virge:key name="email" value="${param.id eq item.id ? item.email : null}" default="${contact.email}" />
        <virge:key name="status"value="${param.id eq item.id ? item.status : null}"  default="${contact.status}" />
    </virge:object>

</virge:iterate>
<% } %>