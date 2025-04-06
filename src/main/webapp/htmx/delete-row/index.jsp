<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<jsp:include page="../include/header.jsp" />

<div style="max-width: 640px; margin: auto;">
    <h1>Delete Row</h1>
    
    <div>
        <!-- Initialize state / Resets on full page reset -->
        <virge:json var="contacts" scope="session">
        [
            { "id": 1, "name": "Joe Smith", "email": "joe@smith.org", "status": "Active" },
            { "id": 2, "name": "Angie MacDowell", "email": "angie@macdowell.org", "status": "Active" },
            { "id": 3, "name": "Fuqua Tarkenton", "email": "fuqua@tarkenton.org", "status": "Active" },
            { "id": 4, "name": "Kim Yee", "email": "kim@yee.org", "status": "Inactive" }
        ]
        </virge:json>
        <jsp:include page="table.jsp" />
    </div>
    <br>
    <p>This example shows how to implement a delete button that removes a table row upon completion.  First let’s look at the
        table body:</p>
    <pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">table </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"table delete-row-example"</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">thead</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Name&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Email&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Status&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>    &lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">thead</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">tbody </span><span style="color:#d19a66;">hx-confirm</span><span>=</span><span style="color:#98c379;">"Are you sure?" </span><span style="color:#d19a66;">hx-target</span><span>=</span><span style="color:#98c379;">"closest tr" </span><span style="color:#d19a66;">hx-swap</span><span>=</span><span style="color:#98c379;">"outerHTML swap:1s"</span><span>&gt;
</span><span>    ...
</span><span>  &lt;/</span><span style="color:#e06c75;">tbody</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">table</span><span>&gt;
</span></code></pre>
    <p>The table body has a <a href="https://htmx.org/attributes/hx-confirm/"><code>hx-confirm</code></a> attribute to confirm the delete action.  It also
        set the target to be the <code>closest tr</code> that is, the closest table row, for all the buttons (<a href="https://htmx.org/attributes/hx-target/"><code>hx-target</code></a>
        is inherited from parents in the DOM.)  The swap specification in <a href="https://htmx.org/attributes/hx-swap/"><code>hx-swap</code></a> says to swap the
        entire target out and to wait 1 second after receiving a response.  This last bit is so that we can use the following
        CSS:</p>
    <pre data-lang="css" style="background-color:#1f2329;color:#abb2bf;" class="language-css "><code class="language-css" data-lang="css"><span style="color:#e06c75;">tr</span><span style="color:#d19a66;">.htmx-swapping </span><span style="color:#e06c75;">td </span><span>{
</span><span>  opacity: </span><span style="color:#d19a66;">0</span><span>;
</span><span>  transition: opacity </span><span style="color:#d19a66;">1s </span><span>ease-out;
</span><span>}
</span></code></pre>
    <p>To fade the row out before it is swapped/removed.</p>
    <p>Each row has a button with a <a href="https://htmx.org/attributes/hx-delete/"><code>hx-delete</code></a> attribute containing the url on which to issue a <code>DELETE</code>
        request to delete the row from the server. This request responds with a <code>200</code> status code and empty content, indicating that the
        row should be replaced with nothing.</p>
    <pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;Angie MacDowell&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;angie@macdowell.org&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;Active&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn danger" </span><span style="color:#d19a66;">hx-delete</span><span>=</span><span style="color:#98c379;">"/contact/1"</span><span>&gt;
</span><span>      Delete
</span><span>    &lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span></code></pre>
    <style>
        tr.htmx-swapping td {
            opacity: 0;
            transition: opacity 1s ease-out;
        }
    </style>

</div>

<jsp:include page="../include/footer.jsp" />
