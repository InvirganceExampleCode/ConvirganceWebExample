<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
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
            <td>${virge:html(customer.CUSTOMER_ID)}</td>
            <td>${virge:html(customer.NAME)}</td>
            <td>${virge:html(customer.ADDRESSLINE1)}</td>
            <td>${virge:html(customer.ADDRESSLINE2)}</td>
            <td>${virge:html(customer.CITY)}</td>
            <td><a hx-get="${page}.jsp?state=${virge:html(customer.STATE)}">${virge:html(customer.STATE)}</a></td>
            <td><a hx-get="${page}.jsp?zipcode=${virge:html(customer.ZIP)}">${virge:html(customer.ZIP)}</a></td>
            <td>${virge:html(customer.CREDIT_LIMIT)}</td>
            <td><a hx-get="${page}.jsp?discountCode=${virge:html(customer.DISCOUNT_CODE)}">${virge:html(customer.DISCOUNT_CODE)}</a></td>
        </tr>
    </virge:iterate>
    </tbody>
</table>
<div style="margin: 12px; cursor: pointer;">
    <a hx-get="${page}.jsp">Show All Records</a>
</div>