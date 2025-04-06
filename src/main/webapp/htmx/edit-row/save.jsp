<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<virge:array var="contacts" scope="session">
    <virge:iterate var="contact" items="${contacts}">

        <virge:object>
            <virge:key name="id" value="${param.id eq contact.id ? contact.id : null}" default="${contact.id}" />
            <virge:key name="name" value="${param.id eq contact.id ? param.name : null}" default="${contact.name}" />
            <virge:key name="email" value="${param.id eq contact.id ? param.email : null}" default="${contact.email}" />
            <virge:key name="status"value="${param.id eq contact.id ? param.status : null}"  default="${contact.status}" />
        </virge:object>

    </virge:iterate>
</virge:array>

<jsp:include page="row.jsp" />