<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<table class="table delete-row-example">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Status</th>
            <th></th>
        </tr>
    </thead>
    <tbody hx-confirm="Are you sure?" hx-target="closest tr" hx-swap="outerHTML swap:1s">
    <virge:iterate var="contact" items="${contacts}">
        <tr>
            <td>${virge:html(contact.name)}</td>
            <td>${virge:html(contact.email)}</td>
            <td>${virge:html(contact.status)}</td>
            <td>
                <button class="btn danger" hx-post="delete.jsp?id=${contact.id}">
                    Delete
                </button>
            </td>
        </tr>
    </virge:iterate>
    </tbody>
</table>