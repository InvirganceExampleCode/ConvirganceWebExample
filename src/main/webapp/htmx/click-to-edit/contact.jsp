<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<virge:object var="contact" scope="session">
    <virge:key name="firstName" value="${contact.firstName}" default="Joe" />
    <virge:key name="lastName" value="${contact.lastName}" default="Blow" />
    <virge:key name="email" value="${contact.email}" default="joe@blow.com" />
</virge:object>
<div hx-target="this" hx-swap="outerHTML">
    <div><label>First Name</label>: ${virge:html(contact.firstName)}</div>
    <div><label>Last Name</label>: ${virge:html(contact.lastName)}</div>
    <div><label>Email</label>: ${virge:html(contact.email)}</div>
    <button hx-get="edit.jsp" class="btn primary">
    Click To Edit
    </button>
</div>