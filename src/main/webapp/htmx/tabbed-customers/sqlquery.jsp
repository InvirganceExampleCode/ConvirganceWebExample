<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<virge:object var="binding">
    <virge:key name="zipcode" value="${param.zipcode}" default="" />
    <virge:key name="state" value="${param.state}" default="" />
    <virge:key name="discountCode" value="${param.discountCode}" default="" />
</virge:object>

<virge:query var="customers" scope="request" jndi="jdbc/sample" binding="${binding}">
select * from APP.CUSTOMER
where (:zipcode = '' or ZIP = :zipcode)
and (:state = '' or STATE = :state)
and (:discountCode = '' or DISCOUNT_CODE = :discountCode)
</virge:query>

<div style="margin: -6px 6px 13px 6px;;">
    The example directly executes the SQL query using a taglib tag in the JSP page.
</div>

<virge:set var="page" scope="request" value="sqlquery" />
<jsp:include page="table.jsp" />