<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<virge:service var="customers" scope="request" path="/customers/database">
    <virge:parameter name="zipcode" value="${param.zipcode}" default="" />
    <virge:parameter name="state" value="${param.state}" default="" />
    <virge:parameter name="discountCode" value="${param.discountCode}" default="" />
</virge:service>
<div style="margin: -6px 6px 12px 6px;;">
    The example calls the <code>/customers/database</code> service to obtain the
    results from a SQL database.
</div>
<virge:set var="page" scope="request" value="database" />
<jsp:include page="table.jsp" />