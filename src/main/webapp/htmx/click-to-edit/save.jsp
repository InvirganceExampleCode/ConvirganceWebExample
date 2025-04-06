<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:object var="contact" scope="session">
    <virge:key name="firstName" value="${param.firstName}" default="${contact.firstName}" />
    <virge:key name="lastName" value="${param.lastName}" default="${contact.lastName}" />
    <virge:key name="email" value="${param.email}" default="${contact.email}" />
</virge:object>
<jsp:forward page="contact.jsp" />