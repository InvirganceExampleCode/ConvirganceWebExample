<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Call - JSP Example</title>
        <link href="<%= request.getContextPath() %>/css/example.css" rel="stylesheet">
    </head>
    <body>
        <h1>Service Call</h1>
        <virge:service var="customers" path="/customers/zipcode/${param.zipcode}" />
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
                    <td>${virge:html(customer.STATE)}</td>
                    <td><a href="${virge:html(customer.ZIP)}">${virge:html(customer.ZIP)}</a></td>
                    <td>${virge:html(customer.CREDIT_LIMIT)}</td>
                    <td>${virge:html(customer.DISCOUNT_CODE)}</td>
                </tr>
            </virge:iterate>
            </tbody>
        </table>
        <div style="margin: 6px;">
            <a href="all">Show All Records</a>
        </div>
        
        
        <hr>
        
        
        <p>
            This example demonstrates a simplified Hypermedia page. The path contains the
            zipcode to load. Passing <code>all</code> for the zipcode results in all 
            zipcodes being displayed.
        </p>
    </body>
</html>
