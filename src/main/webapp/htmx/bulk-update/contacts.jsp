<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<form id="checked-contacts"
      hx-post="users.jsp"
      hx-swap="innerHTML settle:3s"
      hx-target="#toast">
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Active</th>
            </tr>
        </thead>
        <tbody id="tbody">
            <virge:iterate var="contact" items="${contacts}">
                <tr>
                    <td>${virge:html(contact.name)}</td>
                    <td>${virge:html(contact.email)}</td>
                    <td><input type="checkbox" name="${virge:html(contact.email)}" ${contact.status == "Active" ? "checked" : ""}></td>
                </tr>
            </virge:iterate>
        </tbody>
    </table>
    <input type="submit" value="Bulk Update" class="btn primary">
    <output id="toast"></output>
</form>