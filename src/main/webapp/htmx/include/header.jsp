<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(!Boolean.valueOf(request.getHeader("HX-Boosted"))) { %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HTMx Demos</title>
        <link href="${pageContext.request.contextPath}/htmx/css/example.css" rel="stylesheet">
        <script src="https://unpkg.com/htmx.org@2.0.4" integrity="sha384-HGfztofotfshcF7+8n44JQL2oJmowVChPTg48S+jvZoztPfvwD79OC/LTtG6dMp+" crossorigin="anonymous"></script>
    </head>
    <body>
        <div hx-boost="true">
<% } %>