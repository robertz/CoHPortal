<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>DHE Home</title>
	<meta name="description" content="Home Page">
    <meta name="author" content="DHE">
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />
	<!---css --->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />
	<link rel="stylesheet" href="/assets/css/site.css" />
</head>
<body>

	<div class="fixed-header">
		<div class="container">
			<div class="brand">
				<a href="/"><strong>DHE Server</strong></a>
			</div>
			<div class="menu-links">
				<a href="/account">My Account</a>
				<cfif session.keyExists("authId") && session.authId gt 0>
					<a href="/account/logout">Logout</a>
					<cfif session.authId eq 1>
						<a href="/server/admin">Admin</a>
					</cfif>
				</cfif>
			</div>
		</div>
	</div>

	<div class="text-center">
		<image class="text-center" src="/assets/images/coh_logo.png" />
	</div>
	
	<!---Container And Views --->
	<div class="container">#renderView()#</div>

	<!---js --->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
</cfoutput>
