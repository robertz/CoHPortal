<cfoutput>
<div class="content-container">
    <h5>Account Invitations</h5>
    <p>
        If you would like to invite someone please give them to following token so they can create their account.
    </p>
    <p>Invitation Token: <strong>YOUR TOKEN HERE</strong></p>
</div>

<div class="content-container">

    <cfif prc.ents.recordCount>
        <div class="row">
            <div class="col-1"><strong>Level</strong></div>
            <div class="col-3"><strong>Name</strong></div>
            <div class="col-2"><strong>Class</strong></div>
            <div class="col-4">Power Set</div>
            <div class="col-2"><strong>Influence</strong></div>
        </div>
        <cfloop query="#prc.ents#">
            <div class="row">
                <div class="col-1">#displayLevel(level)#</div>
                <div class="col-3">#name#</div>
                <div class="col-2">#characterClass(class)#</div>
                <div class="col-4">#replace(originalPrimary & "/" & originalSecondary, "_", " ", "all")#</div>
                <div class="col-2">#numberFormat(influencePoints)#</div>
            </div>
        </cfloop>
    <cfelse>
        <p>You do not have any characters</p>
    </cfif>
</div>
</cfoutput>