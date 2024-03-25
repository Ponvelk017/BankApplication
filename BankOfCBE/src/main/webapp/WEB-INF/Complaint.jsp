<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="include/HomeStyle.css" />
<title>Home</title>
<style>
</style>
</head>

<body>

	<jsp:include page="Navbar.jsp"></jsp:include>

	<div class="container ">
		<h1 style="display: flex; justify-content: center; padding-top: 3%;">Register
			your Complaint</h1>
		<div id="deposit">
			<div class="d-flex  transactionbox row"
				style="background-color: white; padding-bottom: 5%;">
				<h3>Sorry for the Trouble</h3>
				<h4>We are here to help you , share your Issue</h4>
				<div class="col-5 align-items-center" style="padding-top: 4%;">
					<form id="deposit" class="text-center forms" method="post"
						style="padding-top: 5%;">
						<label for="accountno">Name:</label> <input class="textbox"
							type="text" id="name" name="name" placeholder="Enter Name"
							required><br> <label style="padding-top: 2%;"
							for="amount">Customer Id:</label> <input class="textbox"
							type="text" id="id" name="id" placeholder="Enter Customer Id"
							required><br> <label for="type">Issues Type:</label>
						<select id="type" name="type" class="textbox">
							<option value="Account">Accounts</option>
							<option value="Profile">Profile</option>
							<option value="Transaction">Transaction</option>
							<option value="Bank Branch">Bank Branch</option>
						</select> <label style="padding-top: 2%;" for="amount">Issue:</label> <input
							class="textbox" type="text" id="issue" name="issue"
							placeholder="Enter Issue" required><br>
						<button type="submit">Submit</button>
					</form>
				</div>
				<div class="col-6"
					style="background-image: url(Images/complaint.png); background-size: cover; background-position: center;">
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

</html>