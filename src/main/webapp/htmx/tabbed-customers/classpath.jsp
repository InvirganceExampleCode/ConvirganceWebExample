<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>

<virge:service var="customers" scope="request" path="/customers/classpath">
    <virge:parameter name="zipcode" value="${param.zipcode}" default="" />
    <virge:parameter name="state" value="${param.state}" default="" />
    <virge:parameter name="discountCode" value="${param.discountCode}" default="" />
</virge:service>
<div style="margin: -6px 6px 12px 6px;;">
    The example calls the <code>/customers/classpath</code> service to pull data
    from a file in the project classpath.
</div>
<virge:set var="page" scope="request" value="classpath" />
<jsp:include page="table.jsp" />