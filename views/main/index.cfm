<cfoutput>

<div class="content-container">
    <h5>News</h5>
    <p>5x experience this weekend only!</p>
</div>

<div class="content-container">
    <h5>#prc.players.recordCount# User#prc.players.recordCount eq 1 ? "" : "s"# Online</h5>
    <div class="row">
        <div class="col-3">Name</div>
        <div class="col-1">Lvl</div>
        <div class="col-3">Class</div>
        <div class="col-5">Power Set</div>
    </div>
    <cfif prc.players.recordCount>
        <cfloop query="#prc.players#">
            <div class="row">
                <div class="col-3">#name#</div>
                <div class="col-1">#displayLevel(level)#</div>
                <div class="col-3">#characterClass(class)#</div>
                <div class="col-5">#replace(originalPrimary & "/" & originalSecondary, "_", " ", "all")#</div>
            </div>
        </cfloop>
    <cfelse>
        There are no users currently online.
    </cfif>
</div>

<div class="content-container">
    <h5>Installing the Game Client</h5>
    <ul>
        <li>
            Download the Tequila or the CreamSoda (<a href="https://github.com/thunderspynetwork/creamsoda/releases" target="_blank">link</a>) client.
        </li>
        <li>Add the manifest for the DHE server (http://patch.kisdigital.com/manifest.xml)</li>
        <li>Once all the files have downloaded click play and login with your game account</li>
    </ul>
</div>
</cfoutput>