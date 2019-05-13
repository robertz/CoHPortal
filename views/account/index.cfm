<cfoutput>
<div class="content-container" style="width: 400px; margin: 0 auto;">
    <form action="/account/login" method="post">
        <label for="username">Username:</label>
        <input id="username" class="form-control" type="text" name="username" />
        
        <label for="password">Password:</label>
        <input id="password" class="form-control" type="password" name="password" />
        <br />
        <button type="submit" class="btn btn-primary btn-block">Submit</button>
    </form>
    <br />
    <div class="text-center">
        <a href="/account/create" style="color: white; text-decoration: none;">Create Account</a>
    </div>
</div>
</cfoutput>