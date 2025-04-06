<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<jsp:include page="find.jsp" />
<tr>
    <td>${contact.name}</td>
    <td>${contact.email}</td>
    <td>
      <button class="btn primary"
              hx-get="edit.jsp?id=${contact.id}"
              hx-trigger="edit"
              onClick="let editing = document.querySelector('.editing');
                       if(editing) {
                         Swal.fire({title: 'Already Editing',
                                    showCancelButton: true,
                                    confirmButtonText: 'Yep, Edit This Row!',
                                    text:'Hey!  You are already editing a row!  Do you want to cancel that edit and continue?'})
                         .then((result) => {
                              if(result.isConfirmed) {
                                 htmx.trigger(editing, 'cancel');
                                 htmx.trigger(this, 'edit');
                              }
                          });
                       } else {
                          htmx.trigger(this, 'edit');
                       }">
        Edit
      </button>
    </td>
</tr>