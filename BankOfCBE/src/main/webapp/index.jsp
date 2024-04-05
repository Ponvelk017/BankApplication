<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="include/StyleSheet.css" />
<title>Signing-Page</title>
<style>
body {
	padding-top: 0
}

.singnin {
	width: 100%
}
</style>
</head>

<body>
	<div class="container-fluid singnin row">
		<div class="card" id="signupCard" style="height: 35rem">
			<img class="bankLogo align-center" src="Images/bankofcbe.png"
				alt="Bank Logo">
			<h5 class="card_title">Sign in</h5>
			<p class="card-text">
				<%
				if (request.getAttribute("message") != null) {
				%>
			
			<p style="color: red;"><%=request.getAttribute("message")%></p>
			<%
			}
			%>
			<form id="sign-in" class="forms"
				action="<%=request.getContextPath()%>/home" method="post">
				<input name="formType" value="login" type="hidden"> <label
					for="email">User Id:</label> <input class="textbox" type="text"
					id="id" name="id" placeholder="Enter User Id" required> <label
					for="password">Password:</label> <input class="textbox"
					type="password" id="password" name="password"
					placeholder="Enter Password" required><br>
				<button type="submit">log in</button>
			</form>
		</div>

	</div>
</body>

</html>