<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="convirgance:web" prefix="virge" %>
<jsp:include page="../include/header.jsp" />

<div style="max-width: 640px; margin: auto;">  
    <h1>Click to Load</h1>
    
    <div>
        <div id="demo-canvas">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>ID</th>
                    </tr>
                </thead>
                <tbody>
                    <jsp:include page="rows.jsp?page=1" />
                </tbody>
            </table>
        </div>
    </div>
    <br
    <p>This example shows how to implement click-to-load the next page in a table of data.  The crux of the demo is
        the final row:</p>
    <pre data-lang="html" style="background-color:#1f2329;color:#abb2bf;" class="language-html "><code class="language-html" data-lang="html"><span>&lt;</span><span style="color:#e06c75;">tr </span><span style="color:#d19a66;">id</span><span>=</span><span style="color:#98c379;">"replaceMe"</span><span>&gt;
</span><span>  &lt;</span><span style="color:#e06c75;">td </span><span style="color:#d19a66;">colspan</span><span>=</span><span style="color:#98c379;">"3"</span><span>&gt;
</span><span>    &lt;</span><span style="color:#e06c75;">button </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">'btn primary' </span><span style="color:#d19a66;">hx-get</span><span>=</span><span style="color:#98c379;">"rows.jsp?page=2"
</span><span>                        </span><span style="color:#d19a66;">hx-target</span><span>=</span><span style="color:#98c379;">"#replaceMe"
</span><span>                        </span><span style="color:#d19a66;">hx-swap</span><span>=</span><span style="color:#98c379;">"outerHTML"</span><span>&gt;
</span><span>         Load More Agents... &lt;</span><span style="color:#e06c75;">img </span><span style="color:#d19a66;">class</span><span>=</span><span style="color:#98c379;">"htmx-indicator" </span><span style="color:#d19a66;">src</span><span>=</span><span style="color:#98c379;">"/img/bars.svg"</span><span>&gt;
</span><span>    &lt;/</span><span style="color:#e06c75;">button</span><span>&gt;
</span><span>  &lt;/</span><span style="color:#e06c75;">td</span><span>&gt;
</span><span>&lt;/</span><span style="color:#e06c75;">tr</span><span>&gt;
</span></code></pre>
    <p>This row contains a button that will replace the entire row with the next page of
        results (which will contain a button to load the <em>next</em> page of results).  And so on.</p>

</div>

<jsp:include page="../include/footer.jsp" />