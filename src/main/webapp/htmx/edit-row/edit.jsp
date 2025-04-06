<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<jsp:include page="find.jsp" />
<tr hx-trigger='cancel' class='editing' hx-get="row.jsp?id=${contact.id}">
    
    <td>
        <input type="hidden" name="id" value="${contact.id}">
        <input name='name' value="${virge:html(contact.name)}">
    </td>
    <td><input name='email' value='${virge:html(contact.email)}'></td>
    <td>
        <button class="btn primary" hx-get="row.jsp?id=${contact.id}">
            Cancel
        </button>
        <button class="btn danger" hx-post="save.jsp" hx-include="closest tr">
            Save
        </button>
    </td>
</tr>