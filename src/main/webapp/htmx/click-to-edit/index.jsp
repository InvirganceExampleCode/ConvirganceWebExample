<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<jsp:include page="../include/header.jsp" />
<div style="max-width: 640px; margin: auto;">
    <h1>Click to Edit</h1>

    <div>
        <!-- Initialize state / Resets on full page reset -->
        <virge:object var="contact" scope="session">
            <virge:key name="firstName" value="Joe" />
            <virge:key name="lastName" value="Blow" />
            <virge:key name="email" value="joe@blow.com" />
        </virge:object>
        <jsp:include page="contact.jsp" />
    </div>
    
    <p>The click to edit pattern provides a way to offer inline editing of all or part of a record without a page refresh.</p>
    <ul>
        <li>This pattern starts with a UI in <code>contact.jsp</code> that shows the details of a contact.  The div has a button that will get the editing UI for the contact from <code>edit.jsp</code></li>
    </ul>
    <pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">div </span><span style="color:#d19a66;">hx-target</span><span>=</span><span style="color:#98c379;">"this" </span><span style="color:#d19a66;">hx-swap</span><span>=</span><span style="color:#98c379;">"outerHTML"</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">div</span><span>&gt;&lt;</span><span style="color:#e06c75;">label</span><span>&gt;First Name&lt;/</span><span style="color:#e06c75;">label</span><span>&gt;: Joe&lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">div</span><span>&gt;&lt;</span><span style="color:#e06c75;">label</span><span>&gt;Last Name&lt;/</span><span style="color:#e06c75;">label</span><span>&gt;: Blow&lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">div</span><span>&gt;&lt;</span><span style="color:#e06c75;">label</span><span>&gt;Email&lt;/</span><span style="color:#e06c75;">label</span><span>&gt;: joe@blow.com&lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">hx-get</span><span>=</span><span style="color:#98c379;">"/contact/1/edit" </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn primary"</span><span>&gt;
</span><span>    Click To Edit
</span><span>    &lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span></code></pre>
    <ul>
        <li>This returns a form that can be used to edit the contact</li>
    </ul>
    <pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">form </span><span style="color:#d19a66;">hx-put</span><span>=</span><span style="color:#98c379;">"/contact/1" </span><span style="color:#d19a66;">hx-target</span><span>=</span><span style="color:#98c379;">"this" </span><span style="color:#d19a66;">hx-swap</span><span>=</span><span style="color:#98c379;">"outerHTML"</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">label</span><span>&gt;First Name&lt;/</span><span style="color:#e06c75;">label</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">type</span><span>=</span><span style="color:#98c379;">"text" </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">"firstName" </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">"Joe"</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">div </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"form-group"</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">label</span><span>&gt;Last Name&lt;/</span><span style="color:#e06c75;">label</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">type</span><span>=</span><span style="color:#98c379;">"text" </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">"lastName" </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">"Blow"</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">div </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"form-group"</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">label</span><span>&gt;Email Address&lt;/</span><span style="color:#e06c75;">label</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">type</span><span>=</span><span style="color:#98c379;">"email" </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">"email" </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">"joe@blow.com"</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">div</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn"</span><span>&gt;Submit&lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn" </span><span style="color:#d19a66;">hx-get</span><span>=</span><span style="color:#98c379;">"/contact/1"</span><span>&gt;Cancel&lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">form</span><span>&gt;
</span></code></pre>
    <ul>
        <li>The form issues a <code>POST</code> back to <code>save.jsp</code>, which acts as a stand-in for a database
            update service. The page instead stores the values into a <code>session</code> object before 
            redirecting back to <code>contact.jsp</code> to display the data.</li>
    </ul>
</div>
<jsp:include page="../include/footer.jsp" />