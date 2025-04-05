<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SQL Query - JSP Example</title>
        <link href="css/example.css" rel="stylesheet">
    </head>
    <body>
        <h1>SQL Query</h1>
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
                    <td>${virge:html(customer.CUSTOMER_ID)}</td>
                    <td>${virge:html(customer.NAME)}</td>
                    <td>${virge:html(customer.ADDRESSLINE1)}</td>
                    <td>${virge:html(customer.ADDRESSLINE2)}</td>
                    <td>${virge:html(customer.CITY)}</td>
                    <td><a href="?state=${virge:html(customer.STATE)}">${virge:html(customer.STATE)}</a></td>
                    <td><a href="?zipcode=${virge:html(customer.ZIP)}">${virge:html(customer.ZIP)}</a></td>
                    <td>${virge:html(customer.CREDIT_LIMIT)}</td>
                    <td><a href="?discountCode=${virge:html(customer.DISCOUNT_CODE)}">${virge:html(customer.DISCOUNT_CODE)}</a></td>
                </tr>
            </virge:iterate>
            </tbody>
        </table>
        <div style="margin: 6px;">
            <a href="?">Show All Records</a>
        </div>
        
        
        <hr>
        
        
        <p>
            This example demonstrates an inline SQL Query being used to render a table.
        </p>
        <p>
            An <code>JSONObject</code> is created to pull data from page parameters with blank string
            defaults for the case where a parameter was not passed. The <code>JSONObject</code>
            is then bound to the query, overriding the default of pulling values from
            the JSP scopes. (i.e. page, request, session, application)
        </p>
        <p>
            Values are encoded using the
            <code><span class="el">&dollar;{<span class="name">virge</span>:html(<i>value</i>)}</span></code>
            function to prevent HTML injection.
        </p>
        <p>
            <code>
<span class="tag">&lt;%@</span><span class="name">taglib</span> <span class="key">uri</span><span class="tag">=</span><span class="value">"convirgance:web"</span> <span class="key">prefix</span><span class="tag">=</span><span class="value">"virge"</span><span class="tag"> %&gt;</span>

<span class="tag">&lt;</span><span class="name">virge:object</span> <span class="key">var</span><span class="tag">=</span><span class="value">"binding"</span><span class="tag">&gt;</span>
    <span class="tag">&lt;</span><span class="name">virge:key</span> <span class="key">name</span><span class="tag">=</span><span class="value">"zipcode"</span> <span class="key">value</span><span class="tag">=</span><span class="value">"<span class="el">&dollar;{param.zipcode}</span>"</span> <span class="key">default</span><span class="tag">=</span><span class="value">""</span><span class="tag"> /&gt;</span>
    <span class="tag">&lt;</span><span class="name">virge:key</span> <span class="key">name</span><span class="tag">=</span><span class="value">"state"</span> <span class="key">value</span><span class="tag">=</span><span class="value">"<span class="el">&dollar;{param.state}</span>"</span> <span class="key">default</span><span class="tag">=</span><span class="value">""</span><span class="tag"> /&gt;</span>
    <span class="tag">&lt;</span><span class="name">virge:key</span> <span class="key">name</span><span class="tag">=</span><span class="value">"discountCode"</span> <span class="key">value</span><span class="tag">=</span><span class="value">"<span class="el">&dollar;{param.discountCode}</span>"</span> <span class="key">default</span><span class="tag">=</span><span class="value">""</span><span class="tag"> /&gt;</span>
<span class="tag">&lt;</span>/<span class="name">virge:object</span><span class="tag">&gt;</span>

<span class="tag">&lt;</span><span class="name">virge:query</span> <span class="key">var</span><span class="tag">=</span><span class="value">"customers"</span> <span class="key">jndi</span><span class="tag">=</span><span class="value">"jdbc/sample"</span> <span class="key">binding</span><span class="tag">=</span><span class="value">"<span class="el">&dollar;{binding}</span>"</span><span class="tag">&gt;</span>
select * from APP.CUSTOMER
where (:zipcode = '' or ZIP = :zipcode)
and (:state = '' or STATE = :state)
and (:discountCode = '' or DISCOUNT_CODE = :discountCode)
<span class="tag">&lt;</span>/<span class="name">/virge:query</span><span class="tag">&gt;</span>

<span class="tag">&lt;</span><span class="name">virge:iterate</span> <span class="key">var<span class="tag">=</span><span class="value">"customer"</span> <span class="key">items</span><span class="tag">=</span><span class="value">"<span class="el">&dollar;{customers}</span>"</span><span class="tag">&gt;</span>
    <span class="html">&lt;tr&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.CUSTOMER_ID)}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.NAME)}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.ADDRESSLINE1)}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.ADDRESSLINE2)}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.CITY)}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;&lt;a <span class="field">href=</span><span class="text">"?state=<span class="el">&dollar;{<span class="name">virge</span>:html(customer.STATE)}</span>"</span>><span class="el">&dollar;{<span class="name">virge</span>:html(customer.STATE)}</span><span class="html">&lt;/a></span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;&lt;a <span class="field">href=</span><span class="text">"?zipcode=<span class="el">&dollar;{<span class="name">virge</span>:html(customer.ZIP)}</span>"</span>></span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.ZIP)}</span><span class="html">&lt;/a></span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.CREDIT_LIMIT)}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;&lt;a <span class="field">href=</span><span class="text">"?discountCode=<span class="el">&dollar;{<span class="name">virge</span>:html(customer.DISCOUNT_CODE)}</span>"</span>></span><span class="el">&dollar;{<span class="name">virge</span>:html(customer.DISCOUNT_CODE)}</span><span class="html">&lt;/a>&lt;/td&gt;</span>
    <span class="html">&lt;/tr&gt;</span>
<span class="tag">&lt;</span><span class="name">/virge:iterate</span><span class="tag">&gt;</span>
            </code>
        </p>
    </body>
</html>
