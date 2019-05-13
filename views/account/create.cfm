<cfoutput>
<div class="content-container" style="width: 400px; margin: 0 auto;">

    <cfif structKeyExists(rc, "error")>
        <div class="alert alert-danger">
            #rc.error#
        </div>
    </cfif>

    <form action="/account/process" method="post">

        <label for="username">Invitation Token:</label>
        <input id="token" name="token" type="text" class="form-control" value="#prc.token#" />

        <label for="username">Username:</label>
        <input id="username" name="username" type="text" class="form-control" value="#prc.username#" pattern="^[a-zA-Z0-9]+$" maxlength="14" />

        <label for="password">Password:</label>
        <input id="password" name="password" type="password" class="form-control" value="#prc.password#" />

        <br/>
        <button type="submit" class="btn btn-primary btn-block">Create Account</button>
    </form>
</div>
<script>
$(document).ready(function(){
    $( 'body' ).on( 'keypress', ':input[pattern]', function( ev ) {
    var regex  = new RegExp( $(this).attr( 'pattern' ) );
    var newVal = $(this).val() + String.fromCharCode(!ev.charCode ? ev.which : ev.charCode);

    if ( regex.test( newVal ) ) {
        return true;
    } else {
        ev.preventDefault();
        return false;
    }
} );
})
</script>
</cfoutput>