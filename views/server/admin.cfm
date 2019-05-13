<cfoutput>
<div class="content-container">
    <h5>Auth Accounts (#prc.accounts.recordCount#)</h5>
    <div class="row">
        <div class="col-4"><strong>Account</strong></div>
        <div class="col-6"><strong>Last Login</strong></div>
        <div class="col-2"><strong>IP</strong></div>
    </div>
    <cfloop query="#prc.accounts#">
        <div class="row">
            <div class="col-4">#account#</div>
            <div class="col-6">#dateFormat(last_login, "m/d/yyyy")# #timeFormat(last_login, "h:mm tt")#</div>
            <div class="col-2">#last_ip#</div>
        </div> 
    </cfloop>
</div>
<div class="content-container">
    <h5>Ents (#prc.ents.recordCount#)</h5>
    <cfif prc.ents.recordCount>
        <div class="row">
            <div class="col-2">Account</div>
            <div class="col-1"><strong>Level</strong></div>
            <div class="col-3"><strong>Name</strong></div>
            <div class="col-2"><strong>Class</strong></div>
            <div class="col-4"><strong>Power Set</strong></div>
        </div>
        <cfloop query="#prc.ents#">
            <div class="row">
                <div class="col-2">#authName#</div>
                <div class="col-1">#displayLevel(level)#</div>
                <div class="col-3">#name# <cfif active gt 0><i class="fa fa-circle" style="color: green;"></i></cfif></div>
                <div class="col-2">#characterClass(class)#</div>
                <div class="col-4">#replace(originalPrimary & "/" & originalSecondary, "_", " ", "all")#</div>
            </div> 
        </cfloop>
    <cfelse>
        <p>There are no characters</p>
    </cfif>
</div>
</cfoutput>