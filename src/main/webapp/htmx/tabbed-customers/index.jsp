<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<script>
function setActiveTab(tab)
{
    document.querySelectorAll(".tab").forEach(function(element) {
       element.setAttribute("aria-selected", false); 
    });

    tab.setAttribute("aria-selected", true); 
}
</script>
<h1>Tabbed Customer List</h1>
<p style="margin-left: 1rem; margin-right: 1rem;">
    This example demonstrates a complex htmx interface with a tabbed
    interface and three separate methods of obtaining rendered data.
</p>
<p style="margin-left: 1rem; margin-right: 1rem;">
    All
    examples also support filtering, allowing a high level of interactivity
    with the tables.
</p>
<div class="tabs-container">
    <div class="tabs" hx-target="#tab-content" role="tablist">
        <button class="tab" role="tab" aria-controls="tab-contents" aria-selected="true" hx-get="sqlquery.jsp" hx-on:htmx-after-on-load="setActiveTab(this);">SQL Query</button>
        <button class="tab" role="tab" aria-controls="tab-contents" aria-selected="false" hx-get="database.jsp" hx-on:htmx-after-on-load="setActiveTab(this);">Database Service</button>
        <button class="tab" role="tab" aria-controls="tab-contents" aria-selected="false" hx-get="classpath.jsp" hx-on:htmx-after-on-load="setActiveTab(this);">Classpath Service</button>
    </div>

    <div class="tab-content active" id="tab-content" hx-target="#tab-content">
        <jsp:include page="sqlquery.jsp" />
    </div>
</div>
<jsp:include page="../include/footer.jsp" />
