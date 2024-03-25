<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="details.CustomerDetails"%>
<%@ page import="utility.Common"%>



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
	<div class="container">
		<h1 style="text-align: center; padding-top: 3%; padding-bottom: 2%;">Your
			Profile</h1>
		<div class="profile"
			style="background-color: white; border-radius: 2%; padding-left: 0; padding-top: 4%; margin-bottom: 2%;">
			<div class="profile-img" style="display: flex; align-items: end;">
				<img src="Images/profile.jpg" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; padding-bottom: 5%;">
				<%
				if (request.getAttribute("profile") != null) {
					CustomerDetails profile = (CustomerDetails) request.getAttribute("profile");
				%>
				<table>
					<tbody>
						<form>
							<tr>
								<th scope="col">
									<p>Name</p>
								</th>
								<td>
									<p>:</p>
								</td>
								<td>
									<p>
										<%=profile.getName()%>
									</p>
								</td>
							</tr>
							<tr>
								<th scope="col">
									<p>Mobile Number</p>

								</th>
								<td>
									<p>:</p>
								</td>
								<td>
									<p>
										<%=profile.getMobile()%>

									</p>
								</td>
							</tr>
							<tr>
								<th scope="col">
									<p>Email</p>
								</th>
								<td>
									<p>:</p>
								</td>
								<td>
									<p>
										<%=profile.getEmail()%>
									</p>
								</td>
							</tr>
						</form>
						<tr>
							<th scope="col">
								<p>Date of Birth</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p><%=Common.milliToDate(profile.getDOB())%></p>

							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Address</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									<%=profile.getAddress()%>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Aadhar Number</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									**********<%=profile.getAadhar().substring(10)%>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>PAN Number</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									********<%=profile.getPan().substring(8)%>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>User Status</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									<%=(profile.getStatus().equals("1")) ? "Active" : "InActive"%>
								</p>
							</td>
						</tr>
						<tr>
							<%
							}
							%>
							<td>To view Your Account Details <a href="Accounts.html">Click
									Here </a></td>
						</tr>
					</tbody>
				</table>
				<div
					style="display: flex; flex-direction: column; justify-content: flex-end; margin-right: 2%; margin-bottom: 2%;">
					<button type="submit" id="edit-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                        </svg>
						Edit
					</button>

				</div>

			</div>
		</div>
		<div id="edit-profile"
			style="display: none; background-color: white; padding-top: 3%; border-radius:2%">
			<div class="d-flex  transactionbox row">
				<h3>Edit your Details</h3>
				<div class="col-5 align-items-center" style="padding-top: 4%;">
					<form id="deposit" class="text-center forms" method="post"
						style="padding-top: 5%;">
						<label for="accountno">Name:</label> <input class="textbox"
							type="text" id="name" name="name" placeholder="Ram"> <label
							for="accountno">Mobile:</label> <input class="textbox"
							type="text" id="mobile" name="mobile" placeholder="909090909090"><br>
						<label for="accountno">Email:</label> <input class="textbox"
							type="email" id="email" name="email" placeholder="Ram@gmail.com"><br>
						<label for="accountno">Date Of Birth:</label> <input
							class="textbox" type="text" id="dob" name="dob"
							placeholder="13-09-1999"><br> <label for="accountno">Aadhar
							Number:</label> <input class="textbox" type="text" id="aadhar"
							name="aadhar" placeholder="1234567890123456"><br> <label
							for="accountno">Pan Number:</label> <input class="textbox"
							type="text" id="pan" name="pan" placeholder="ASDFG12345"><br>
						<button type="submit">Submit</button>
					</form>
				</div>
				<div class="col-6"
					style="background-image: url(edit.png); background-size: cover; background-position: center;">
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	document
			.getElementById("edit-button")
			.addEventListener(
					'click',
					function() {
						document.getElementById('edit-profile').style.display = (document
								.getElementById('edit-profile').style.display === 'none') ? 'block'
								: 'none';
					});
</script>
</html>




<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="details.CustomerDetails"%>
<%@ page import="utility.Common"%>



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
	<div class="container">
		<h1 style="text-align: center; padding-top: 3%; padding-bottom: 2%;">Your
			Profile</h1>
		<div class="profile"
			style="background-color: white; border-radius: 2%; padding-left: 0; padding-top: 4%; margin-bottom: 2%;">
			<div class="profile-img" style="display: flex; align-items: end;">
				<img src="Images/profile.jpg" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; padding-bottom: 5%;">
				<%
				if (request.getAttribute("profile") != null) {
					CustomerDetails profile = (CustomerDetails) request.getAttribute("profile");
				%>
				<table>
					<tbody>
						<form>
							<tr>
								<th scope="col">
									<p>Name</p>
								</th>
								<td>
									<p>:</p>
								</td>
								<td>
									<p><p id="originalName"><%=profile.getName()%></p>
									<p id="modifiedName" style="display: none">
										<input style="border: none; outline: none;" class="textbox"
											type="text" id="name" name="name"
											placeholder=<%=profile.getName()%>>
									</p>


								</td>
							</tr>
							<tr>
								<th scope="col">
									<p>Mobile Number</p>

								</th>
								<td>
									<p>:</p>
								</td>
								<td>
									<p>
									
									<p id="originalMobile"><%=profile.getMobile()%></p>
									<p id="modifiedMobile" style="display: none">
										<input style="border: none; outline: none;" class="textbox"
											type="text" id="name" name="name"
											placeholder=<%=profile.getMobile()%>>
									</p>
									</p>
								</td>
							</tr>
							<tr>
								<th scope="col">
									<p>Email</p>
								</th>
								<td>
									<p>:</p>
								</td>
								<td>
									<p>
									
									<p id="originalEmail"><%=profile.getEmail()%></p>
									<p id="modifiedEmail" style="display: none">
										<input style="border: none; outline: none;" class="textbox"
											type="text" id="name" name="name"
											placeholder=<%=profile.getEmail()%>>
									</p>
									</p>
								</td>
							</tr>
						</form>
						<tr>
							<th scope="col">
								<p>Date of Birth</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
								
								<p id="originalDob"><%=Common.milliToDate(profile.getDOB())%></p>
								<p id="modified"Dob style="display: none">
									<input style="border: none; outline: none;" class="textbox"
										type="text" id="name" name="name"
										placeholder=<%=Common.milliToDate(profile.getDOB())%>>
								</p>
								</p>

							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Address</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									<%=profile.getAddress()%>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Aadhar Number</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									**********<%=profile.getAadhar().substring(10)%>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>PAN Number</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									********<%=profile.getPan().substring(8)%>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>User Status</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>
									<%=(profile.getStatus().equals("1")) ? "Active" : "InActive"%>
								</p>
							</td>
						</tr>
						<tr>
							<%
							}
							%>
							<td>To view Your Account Details <a href="Accounts.html">Click
									Here </a></td>
						</tr>
					</tbody>
				</table>
				<div
					style="display: flex; flex-direction: column; justify-content: flex-end; margin-right: 2%; margin-bottom: 2%;">
					<button type="submit" id="edit-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                        </svg>
						Edit
					</button>

				</div>

			</div>
		</div>
		<div id="edit-profile"
			style="display: none; background-color: white; padding-top: 3%; border-radius: 2%">
			<div class="d-flex  transactionbox row">
				<h3>Edit your Details</h3>
				<div class="col-5 align-items-center" style="padding-top: 4%;">
					<form id="deposit" class="text-center forms" method="post"
						style="padding-top: 5%;">
						<label for="accountno">Name:</label> <input class="textbox"
							type="text" id="name" name="name" placeholder="Ram"> <label
							for="accountno">Mobile:</label> <input class="textbox"
							type="text" id="mobile" name="mobile" placeholder="909090909090"><br>
						<label for="accountno">Email:</label> <input class="textbox"
							type="email" id="email" name="email" placeholder="Ram@gmail.com"><br>
						<label for="accountno">Date Of Birth:</label> <input
							class="textbox" type="text" id="dob" name="dob"
							placeholder="13-09-1999"><br> <label for="accountno">Aadhar
							Number:</label> <input class="textbox" type="text" id="aadhar"
							name="aadhar" placeholder="1234567890123456"><br> <label
							for="accountno">Pan Number:</label> <input class="textbox"
							type="text" id="pan" name="pan" placeholder="ASDFG12345"><br>
						<button type="submit">Submit</button>
					</form>
				</div>
				<div class="col-6"
					style="background-image: url(edit.png); background-size: cover; background-position: center;">
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	document
			.getElementById("edit-button")
			.addEventListener(
					'click',
					function() {
						document.getElementById('modifiedName').style.display = (document
								.getElementById('modifiedName').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('originalName').style.display = (document
								.getElementById('originalName').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('modifiedMobile').style.display = (document
								.getElementById('modifiedMobile').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('originalMobile').style.display = (document
								.getElementById('originalMobile').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('modifiedEmail').style.display = (document
								.getElementById('modifiedEmail').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('originalEmail').style.display = (document
								.getElementById('originalEmail').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('modifiedDob').style.display = (document
								.getElementById('modifiedDob').style.display === 'none') ? 'block'
								: 'none';
						document.getElementById('originalDob').style.display = (document
								.getElementById('originalDob').style.display === 'none') ? 'block'
								: 'none';
					});
</script>

</html> --%>