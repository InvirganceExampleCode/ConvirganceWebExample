<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="convirgance:web" prefix="virge" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inline JSON</h1>
        <virge:json var="list" scope="page">
        [
            { "title": "First Name", "key": "firstName" },
            { "title": "Last Name", "key": "lastName" },
            { "title": "Address", "key": "address" },
            { "title": "City", "key": "city"}
        ]
        </virge:json>
        <table border="1" cellpadding="8">
            <thead>
                <tr>
                    <th align="left">Title</th>
                    <th align="left">Key</th>
                    <th align="left">JSON</th>
                    <th align="left">Rendered</th>
                    <th align="left">Status</th>
                </tr>
            </thead>
            <tbody>
            <virge:iterate var="item" items="${list}" status="loop">
                <tr>
                    <td>${item.title}</td>
                    <td>${item.key}</td>
                    <td>${item}</td>
                    <td>${item.title}: <input type="text" id="${item.key}" name="${item.key}"></td>
                    <td>${loop.index}: ${loop}</td>
                </tr>
            </virge:iterate>
            </tbody>
        </table>
        <br><br>
        <h1>Dynamic Query</h1>
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
        <table border="1" cellpadding="8">
            <thead>
                <tr>
                    <th align="left">ID</th>
                    <th align="left">Name</th>
                    <th align="left">Address 1</th>
                    <th align="left">Address 2</th>
                    <th align="left">City</th>
                    <th align="left">State</th>
                    <th align="left">Zip Code</th>
                    <th align="left">Credit Limit</th>
                    <th align="left">Discount Code</th>
                </tr>
            </thead>
            <tbody>
            <virge:iterate var="customer" items="${customers}">
                <tr>
                    <td>${customer.CUSTOMER_ID}</td>
                    <td>${customer.NAME}</td>
                    <td>${customer.ADDRESSLINE1}</td>
                    <td>${customer.ADDRESSLINE2}</td>
                    <td>${customer.CITY}</td>
                    <td><a href="?state=${customer.STATE}">${customer.STATE}</a></td>
                    <td><a href="?zipcode=${customer.ZIP}">${customer.ZIP}</a></td>
                    <td>${customer.CREDIT_LIMIT}</td>
                    <td><a href="?discountCode=${customer.DISCOUNT_CODE}">${customer.DISCOUNT_CODE}</a></td>
                </tr>
            </virge:iterate>
            </tbody>
        </table>
        <div><a href="?">Show All Records</a></div>
    </body>
</html>
