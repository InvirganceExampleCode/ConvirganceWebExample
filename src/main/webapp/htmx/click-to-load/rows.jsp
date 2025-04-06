<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<%!
private class UUIDGenerator
{
    public String toString()
    {
        return java.util.UUID.randomUUID().toString();
    }
}
%>
<% pageContext.setAttribute("uuid", new UUIDGenerator()); %>

<virge:set var="id" value="${param.page * 10}" />
<virge:json var="counter">[0,1,2,3,4,5,6,7,8,9]</virge:json>

<virge:iterate var="index" items="${counter}">
<tr>
    <td>Agent Smith</td>
    <td>void${id + index}@null.org</td>
    <td>${uuid}</td>
</tr>
</virge:iterate>
<tr id="replaceMe">
    <td colspan="3">
        <center>
            <button class="btn primary" hx-get="rows.jsp?page=${param.page + 1}" hx-target="#replaceMe" hx-swap="outerHTML">
                Load More Agents... <img class="htmx-indicator" src="images/bars.svg">
            </button>
        </center>
    </td>
</tr>