<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<%-- 
    This doesn't actually have to do anything. However, we're implementing the
    session update so you can change and enhance this demo and understand better
    what it's intended to do.
--%>

<virge:array var="contacts" scope="session">
    <virge:iterate var="contact" items="${contacts}">
        
        <virge:object>
            <virge:key name="id" value="${contact.id}" />
            <virge:key name="name" value="${contact.name}" />
            <virge:key name="email" value="${contact.email}" />
            <virge:key name="status" value="${contact.status}" />
            <virge:key name="deleted" value="${param.id eq contact.id ? true : null}" default="${contact.deleted}" />
        </virge:object>
        
    </virge:iterate>
</virge:array>

<%-- Uncomment to print out the updated data --%>
<%-- 
<script>console.log(${virge:json(contacts)});</script>
 --%>