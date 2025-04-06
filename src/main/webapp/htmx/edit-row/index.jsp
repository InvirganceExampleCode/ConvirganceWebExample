<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<jsp:include page="../include/header.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Popover library providing Swal -->
<div style="max-width: 640px; margin: auto;">

  <h1>Edit Row</h1>
  
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
  <p>This example shows how to implement editable rows.  First let’s look at the table body:</p>
<pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">table </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"table delete-row-example"</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">thead</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Name&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;Email&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">th</span><span>&gt;&lt;/</span><span style="color:#e06c75;">th</span><span>&gt;
</span><span>    &lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">thead</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">tbody </span><span style="color:#d19a66;">hx-target</span><span>=</span><span style="color:#98c379;">"closest tr" </span><span style="color:#d19a66;">hx-swap</span><span>=</span><span style="color:#98c379;">"outerHTML"</span><span>&gt;
</span><span>    ...
</span><span>  &lt;/</span><span style="color:#e06c75;">tbody</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">table</span><span>&gt;
</span></code></pre>
<p>This will tell the requests from within the table to target the closest enclosing row that the request is triggered
on and to replace the entire row.</p>
<p>Here is the HTML for a row:</p>
<pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">tr</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">td</span><span>&gt;&dollar;{contact.name}&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">td</span><span>&gt;&dollar;{contact.email}&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>      &lt;</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>        &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn primary"
</span><span>                </span><span style="color:#d19a66;">hx-get</span><span>=</span><span style="color:#98c379;">"edit.jsp?id=&dollar;{contact.id}"
</span><span>                </span><span style="color:#d19a66;">hx-trigger</span><span>=</span><span style="color:#98c379;">"edit"
</span><span>                </span><span style="color:#d19a66;">onClick</span><span>=</span><span style="color:#98c379;">"let editing = document.querySelector('.editing')
</span><span style="color:#98c379;">                         if(editing) {
</span><span style="color:#98c379;">                           Swal.fire({title: 'Already Editing',
</span><span style="color:#98c379;">                                      showCancelButton: true,
</span><span style="color:#98c379;">                                      confirmButtonText: 'Yep, Edit This Row!',
</span><span style="color:#98c379;">                                      text:'Hey!  You are already editing a row!  Do you want to cancel that edit and continue?'})
</span><span style="color:#98c379;">                           .then((result) =&gt; {
</span><span style="color:#98c379;">                                if(result.isConfirmed) {
</span><span style="color:#98c379;">                                   htmx.trigger(editing, 'cancel')
</span><span style="color:#98c379;">                                   htmx.trigger(this, 'edit')
</span><span style="color:#98c379;">                                }
</span><span style="color:#98c379;">                            })
</span><span style="color:#98c379;">                         } else {
</span><span style="color:#98c379;">                            htmx.trigger(this, 'edit')
</span><span style="color:#98c379;">                         }"</span><span>&gt;
</span><span>          Edit
</span><span>        &lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>      &lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>    &lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span></code></pre>
<p>Here we are getting a bit fancy and only allowing one row at a time to be edited, using some JavaScript.
We check to see if there is a row with the <code>.editing</code> class on it and confirm that the user wants to edit this row
and dismiss the other one.  If so, we send a cancel event to the other row so it will issue a request to go back to
its initial state.</p>
<p>We then trigger the <code>edit</code> event on the current element, which triggers the htmx request to get the editable version
of the row.</p>
<p>Note that if you didn’t care if a user was editing multiple rows, you could omit the hyperscript and custom <code>hx-trigger</code>,
and just let the normal click handling work with htmx.  You could also implement mutual exclusivity by simply targeting the
entire table when the Edit button was clicked.  Here we wanted to show how to integrate htmx and JavaScript to solve
the problem and narrow down the server interactions a bit, plus we get to use a nice SweetAlert confirm dialog.</p>
<p>Finally, here is what the row looks like when the data is being edited:</p>
<pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">tr </span><span style="color:#d19a66;">hx-trigger</span><span>=</span><span style="color:#98c379;">'cancel' </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">'editing' </span><span style="color:#d19a66;">hx-get</span><span>=</span><span style="color:#98c379;">"row.jsp?id=&dollar;{contact.id}"</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;
    &lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">'id' </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">'&dollar;{contact.id}'</span><span>&gt;
    &lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">'name' </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">'&dollar;{contact.name}'</span><span>&gt;
  &lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;&lt;</span><span style="color:#e06c75;">input </span><span style="color:#d19a66;">name</span><span>=</span><span style="color:#98c379;">'email' </span><span style="color:#d19a66;">value</span><span>=</span><span style="color:#98c379;">'&dollar;{contact.email}'</span><span>&gt;&lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn primary" </span><span style="color:#d19a66;">hx-get</span><span>=</span><span style="color:#98c379;">"row.jsp?id=&dollar;{contact.id}"</span><span>&gt;
</span><span>      Cancel
</span><span>    &lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"btn danger" </span><span style="color:#d19a66;">hx-post</span><span>=</span><span style="color:#98c379;">"save.jsp" </span><span style="color:#d19a66;">hx-include</span><span>=</span><span style="color:#98c379;">"closest tr"</span><span>&gt;
</span><span>      Save
</span><span>    &lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span></code></pre>
<p>Here we have a few things going on:  First off the row itself can respond to the <code>cancel</code> event, which will bring
back the read-only version of the row.  There is a cancel button that allows
cancelling the current edit.  Finally, there is a save button that issues a <code>PUT</code> to update the contact.  Note that
there is an <a href="https://htmx.org/attributes/hx-include/"><code>hx-include</code></a> that includes all the inputs in the closest row.  Tables rows are
notoriously difficult to use with forms due to HTML constraints (you can’t put a <code>form</code> directly inside a <code>tr</code>) so
this makes things a bit nicer to deal with.</p>
    
</div>

<jsp:include page="../include/footer.jsp" />