<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<virge:set var="activated" value="${0}" />
<virge:set var="deactivated" value="${0}" />

<virge:array var="contacts" scope="session">
    <virge:iterate var="contact" items="${contacts}">
        
        <virge:set var="activated" value="${(param[contact.email] eq 'on' and contact.status eq 'Inactive' ? 1 : 0) + activated}" />
        <virge:set var="deactivated" value="${(empty param[contact.email] and contact.status eq 'Active' ? 1 : 0) + deactivated}" />
        
        <virge:object>
            <virge:key name="name" value="${contact.name}" />
            <virge:key name="email" value="${contact.email}" />
            <virge:key name="status" value="${param[contact.email] eq 'on' ? 'Active' : 'Inactive'}" />
        </virge:object>
    </virge:iterate>
</virge:array>

Activated ${activated} and deactivated ${deactivated} users


    
