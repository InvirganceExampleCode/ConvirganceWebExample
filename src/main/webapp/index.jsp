<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SQL Query - JSP Example</title>
        <link href="css/example.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alumni+Sans:ital,wght@0,100..900;1,100..900&family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap" rel="stylesheet">
        <style>
            .title {
                display: flex;
            }
            
            .title * {
                flex: 1;
            }
            
            .title *:nth-child(1) { text-align: left; }
            .title *:nth-child(2) { text-align: right; }
            
            .invirgance-logo {
                font-family: "Alumni Sans", sans-serif;
                font-optical-sizing: auto;
                font-size: 150%;
                font-weight: 400;
            }
            
            td code {
                background: #3465a41f;
                border-radius: 2px;
                padding: 2px 5px;
                font-size: 95%;
            }
            
            tr td:nth-child(3) {
                text-align: right;
            }
            
            tr td:nth-child(3) a {
                background-image: url(images/github.png);
                background-size: 24px;
                display: inline-block;
                width: 24px;
                height: 24px;
            }
        </style>
    </head>
    <body>
        <div class="title">
            <h1><span class="invirgance-logo">Convirgance (Web Services)</span></h1>
            <h1>Example Code</h1>
        </div>
        
        <h2>Welcome</h2>
        <p>This project contains numerous examples of how to use Convirgance
        (Web Services) framework to build your application. Convirgance is
        extremely flexible and can adapt to whatever your favorite front-end
        technology is.</p>
        
        <h2>Web Services</h2>
        <table>
            <thead>
                <tr>
                    <th>Example</th>
                    <th>Description</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="customers/database">/customers/database</a></td>
                    <td>Demonstrates a simple yet sophisticated web service which lists and filters customer data from a database table</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/customers/database.xml"></a></td>
                </tr>
                <tr>
                    <td><a href="customers/classpath">/customers/classpath</a></td>
                    <td>Shows that data can be pulled from a project file in the classpath with <a target="_blank" href="https://docs.invirgance.com/javadocs/convirgance/latest/com/invirgance/convirgance/transform/filter/package-summary.html">Filter</a> transformations applied</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/customers/classpath.xml"></a></td>
                </tr>
                <tr>
                    <td><a href="customers/filesystem">/customers/filesystem</a></td>
                    <td>Data retrieved from a file in the filesystem. System property <code>database.root</code> must be set for the service to find the data.</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/customers/filesystem.xml"></a></td>
                </tr>
                <tr>
                    <td><a href="servlet/database">/servlet/database</a></td>
                    <td>Same database query as <code>/customers/database</code> but running as a regular servlet using base Convirgance library</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/java/CustomersByZipCode.java"></a></td>
                </tr>
            </tbody>
        </table>
        
        <h3>Filtered Web Services</h3>
        <table>
            <thead>
                <tr>
                    <th>Example</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr><td><a href="customers/database?zipcode=48128">/customers/database?zipcode=48128</a></td><td>Demonstrates a simple yet sophisticated web service which lists and filters customer data from a database table</td></tr>
                <tr><td><a href="customers/classpath?discountCode=L">/customers/classpath?discountCode=L</a></td><td>Shows that data can be pulled from a project file in the classpath with <a target="_blank" href="https://docs.invirgance.com/javadocs/convirgance/latest/com/invirgance/convirgance/transform/filter/package-summary.html">Filter</a> transformations applied</td></tr>
                <tr><td><a href="customers/filesystem?state=FL">/customers/filesystem?state=FL</a></td><td>Data retrieved from a file in the filesystem. System property <code>database.root</code> must be set for the service to find the data.</td></tr>
                <tr><td><a href="servlet/database?state=CA&discountCode=L">/servlet/database?state=CA&discountCode=L</a></td><td>Base Convirgance library showing multiple filters applied</td></tr>
            </tbody>
        </table>
        
        <h2>JSP Demos</h2>
                <table>
            <thead>
                <tr>
                    <th>Example</th>
                    <th>Description</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="json.jsp">json.jsp</a></td>
                    <td>Example showing how a JSON structure can be used to drive page rendering</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/json.jsp"></a></td>
                </tr>
                <tr>
                    <td><a href="database.jsp">database.jsp</a></td>
                    <td>Embeds a SQL Query directly into the JSP page and then renders the results</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/database.jsp"></a></td>
                </tr>
                <tr>
                    <td><a href="service.jsp">service.jsp</a></td>
                    <td>Calls a Convirgance Web Service and renders the results to the page</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/service.jsp"></a></td>
                </tr>
                <tr>
                    <td><a href="htmx/">&lt;/&gt;htmx</a></td>
                    <td>Demos showing how to utilize htmx technology with Convirgance (Web Services)</td>
                    <td><a target="_blank" href="https://github.com/InvirganceExampleCode/ConvirganceWebExample/blob/main/src/main/webapp/htmx/"></a></td>
                </tr>
            </tbody>
        </table>
        
        <h3>REST and Hypermdia Web Services</h3>
        <table>
            <thead>
                <tr>
                    <th>Example</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr><td><a href="customers/zipcode/48128">/customers/customers/zipcode/48128</a></td><td>Demonstrates using <code>PathVariable</code> for REST interfaces.</td></tr>
                <tr><td><a href="customers/view/zipcode/48128">/customers/view/zipcode/48128</a></td><td>Renders an HTML page using the <code>HypermediaService</code> to provide REST pathing</td></tr>
                <tr><td><a href="customers/rest">/customers/rest</a></td><td>Executes a different service depending on the HTTP Method. Clicking the link will show a <code>GET</code> request.</td></tr>
            </tbody>
        </table>
    </body>
</html>
