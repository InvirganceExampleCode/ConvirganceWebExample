<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" /> 
<%@taglib uri="convirgance:web" prefix="virge" %>
<div style="max-width: 640px; margin: auto;">
    <h1>Bulk Update</h1>

    <style>
    #toast.htmx-settling {
      opacity: 100;
    }

    #toast {
      background: #E1F0DA;
      opacity: 0;
      transition: opacity 3s ease-out;
    }
    </style>
    
    <div>
        <!-- Initialize state -->
        <virge:json var="contacts" scope="session">
        [
            {"name": "Joe Smith", "status": "Active", "email": "joe@smith.org"},
            {"name": "Angie MacDowell", "status": "Active", "email": "angie@macdowell.org"},
            {"name": "Fuqua Tarkenton", "status": "Active", "email": "fuqua@tarkenton.org"},
            {"name": "Kim Yee", "status": "Inactive", "email": "kim@yee.org"}
        ]
        </virge:json>
        <jsp:include page="contacts.jsp" />
    </div>

    <p>This demo shows how to implement a common pattern where rows are selected and then bulk updated.  This is
        accomplished by putting a form around a table, with checkboxes in the table, and then including the checked
        values in the form submission (<code>POST</code> request):</p>
    <pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">form </span><span style="color:#d19a66;">id</span><span>=</span><span style="color:#98c379;">"checked-contacts"
</span><span>      </span><span style="color:#d19a66;">hx-post</span><span>=</span><span style="color:#98c379;">"users.jsp"
</span><span>      </span><span style="color:#d19a66;">hx-swap</span><span>=</span><span style="color:#98c379;">"innerHTML settle:3s"
</span><span>      </span><span style="color:#d19a66;">hx-target</span><span>=</span><span style="color:#98c379;">"#toast"</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">table</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">thead</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>        &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Name&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>        &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Email&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>        &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Active&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>      &lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>      &lt;/</span><span style="color:#e06c75;">thead</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">tbody </span><span style="color:#d19a66;">id</span><span>=</span><span style="color:#98c379;">"tbody"</span><span>&gt;
</span><span>        &lt;</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>          &lt;</span><span style="color:#e06c75;">td</span><span>&gt;Joe Smith&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>          &lt;</span><span style="color:#e06c75;">td</span><span>&gt;joe@smith.org&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>          &lt;</span><span style="color:#e06c75;">td</span><span>&gt;&lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">type</span><span>=</span><span style="color:#98c379;">"checkbox" </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">"joe@smith.org"</span><span>&gt;&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>        &lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>        ...
</span><span>      &lt;/</span><span style="color:#e06c75;">tbody</span><span>&gt;
</span><span>    &lt;/</span><span style="color:#e06c75;">table</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">type</span><span>=</span><span style="color:#98c379;">"submit" </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">"Bulk Update" </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn primary"</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">output </span><span style="color:#d19a66;">id</span><span>=</span><span style="color:#98c379;">"toast"</span><span>&gt;&lt;/</span><span style="color:#e06c75;">output</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">form</span><span>&gt;
</span></code></pre>
    <p>The server will bulk-update the statuses based on the values of the checkboxes.
        We respond with a small toast message about the update to inform the user, and
        use an <code>&lt;output&gt;</code> element to politely announce the update for accessibility. Note
        that the <code>&lt;output&gt;</code> element is appropriate for announcing the result of an action
        in a specific form, but if you need to announce general-purpose messages that are
        not connected to a form it would make sense to use an ARIA live region, eg
        <code>&lt;p id="toast" aria-live="polite"&gt;&lt;/p&gt;</code>.</p>
    <pre data-lang="css" style="background-color:#1f2329;color:#abb2bf;" class="language-css "><code class="language-css" data-lang="css"><span style="color:#d19a66;">#toast.htmx-settling </span><span>{
</span><span>  opacity: </span><span style="color:#d19a66;">100</span><span>;
</span><span>}
</span><span>
</span><span style="color:#d19a66;">#toast </span><span>{
</span><span>  background: </span><span style="color:#56b6c2;">#E1F0DA</span><span>;
</span><span>  opacity: </span><span style="color:#d19a66;">0</span><span>;
</span><span>  transition: opacity </span><span style="color:#d19a66;">3s </span><span>ease-out;
</span><span>}
</span></code></pre>
    <p>The cool thing is that, because HTML form inputs already manage their own state,
        we don’t need to re-render any part of the users table. The active users are
        already checked and the inactive ones unchecked!</p>
    <p>You can see a working example of this code above.</p>
</div>
<jsp:include page="../include/footer.jsp" />