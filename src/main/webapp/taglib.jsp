<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="convirgance:web" prefix="virge" %>
<!DOCTYPE html>
<virge:json var="list" scope="page">
[
    { "title": "First Name", "key": "firstName" },
    { "title": "Last Name", "key": "lastName" },
    { "title": "Address", "key": "address" },
    { "title": "City", "key": "city"}
]
</virge:json>

<virge:object var="binding">
    <virge:key name="zipcode" value="${param.zipcode}" default="" />
    <virge:key name="state" value="${param.state}" default="" />
    <virge:key name="discountCode" value="${param.discountCode}" default="" />
</virge:object>

<virge:query var="customers" jndi="jdbc/sample" binding="${binding}">
select * from APP.CUSTOMER
where (:zipcode = '' or ZIP = :zipcode)
and (:state = '' or STATE = :state)
and (:discountCode = '' or DISCOUNT_CODE = :discountCode)
</virge:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inline JSON</h1>
        <table border="1" cellpadding="8">
            <thead>
                <tr>
                    <th align="left">Title</th>
                    <th align="left">Key</th>
                    <th align="left">JSON</th>
                    <th align="left">Rendered</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td>${item.title}</td>
                    <td>${item.key}</td>
                    <td>${item}</td>
                    <td>${item.title}: <input type="text" id="${item.key}" name="${item.key}"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br><br>
        <h1>Dynamic Query</h1>
        <table border="1" cellpadding="8">
            <thead>
                <tr>
                    <th align="left">ID</th>
                    <th align="left">Name</th>
                    <th align="left">Address 1</th>
                    <th align="left">Address 2</th>
                    <th align="left">City</th>
                    <th align="left">State</th>
                    <th align="left">Credit Limit</th>
                    <th align="left">Discount Code</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customers.iterator()}">
                <tr>
                    <td>${customer.CUSTOMER_ID}</td>
                    <td>${customer.NAME}</td>
                    <td>${customer.ADDRESSLINE1}</td>
                    <td>${customer.ADDRESSLINE2}</td>
                    <td>${customer.CITY}</td>
                    <td>${customer.STATE}</td>
                    <td>${customer.CREDIT_LIMIT}</td>
                    <td>${customer.DISCOUNT_CODE}</td>
                </tr>
            </c:forEach> 
            </tbody>
        </table>
    </body>
</html>
