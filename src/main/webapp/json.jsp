<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inline JSON - JSP Example</title>
        <link href="css/example.css" rel="stylesheet">
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
        <hr>
        <p>
            This example demonstrates inline JSON being used to render a table. The
            contents of the loop <code>status</code> variable are demonstrated in the 
            <i>Status</i> column.
        </p>
        <p>
            <code>
<span class="tag">&lt;%@</span><span class="name">taglib</span> <span class="key">uri</span><span class="tag">=</span><span class="value">"convirgance:web"</span> <span class="key">prefix</span><span class="tag">=</span><span class="value">"virge"</span><span class="tag"> %&gt;</span>

<span class="tag">&lt;</span><span class="name">virge:json</span> <span class="key">var</span><span class="tag">=</span><span class="value">"list"</span> <span class="key">scope</span><span class="tag">=</span><span class="value">"page"</span><span class="tag">&gt;</span>
[
    { "title": "First Name", "key": "firstName" },
    { "title": "Last Name", "key": "lastName" },
    { "title": "Address", "key": "address" },
    { "title": "City", "key": "city"}
]
<span class="tag">&lt;</span>/<span class="name">virge:json</span><span class="tag">&gt;</span>

<span class="tag">&lt;</span><span class="name">virge:iterate</span> <span class="key">var<span class="tag">=</span>"item"</span> <span class="key">items</span><span class="tag">=</span><span class="value">"&dollar;{list}"</span> <span class="key">status</span><span class="tag">=</span><span class="value">"loop"</span><span class="tag">&gt;</span>
    <span class="html">&lt;tr&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{item.title}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{item.key}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{item}</span><span class="html">&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{item.title}</span>: <span class="html">&lt;input <span class="field">type=</span><span class="text">"text"</span> <span class="field">id=</span><span class="text">"<span class="el">&dollar;{item.key}</span>"</span> <span class="field">name=</span><span class="text">"<span class="el">&dollar;{item.key}</span>"</span>>&lt;/td&gt;</span>
        <span class="html">&lt;td&gt;</span><span class="el">&dollar;{loop.index}</span>: <span class="el">&dollar;{loop}</span><span class="html">&lt;/td&gt;</span>
    <span class="html">&lt;/tr&gt;</span>
<span class="tag">&lt;</span><span class="name">/virge:iterate</span><span class="tag">&gt;</span>
            </code>
        </p>
    </body>
</html>
