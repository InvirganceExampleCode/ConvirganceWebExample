<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form hx-post="save.jsp" hx-target="this" hx-swap="outerHTML">
  <div>
    <label>First Name</label>
    <input type="text" name="firstName" value="${contact.firstName}">
  </div>
  <div class="form-group">
    <label>Last Name</label>
    <input type="text" name="lastName" value="${contact.lastName}">
  </div>
  <div class="form-group">
    <label>Email Address</label>
    <input type="email" name="email" value="${contact.email}">
  </div>
  <button class="btn">Submit</button>
  <button class="btn" hx-get="contact.jsp">Cancel</button>
</form>