<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<table class="table delete-row-example">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th></th>
        </tr>
    </thead>
    <tbody hx-target="closest tr" hx-swap="outerHTML">
    <virge:iterate var="contact" scope="request" items="${contacts}">
        <jsp:include page="row.jsp" />
    </virge:iterate>
    </tbody>
</table>