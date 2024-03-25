<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="details.CustomerDetails"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map.Entry"%>

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
<link rel="stylesheet" href="include/UserManagement.css" />
<title>User</title>
</head>

<body>
	<jsp:include page="EmployeeNavbar.jsp"></jsp:include>

	<!-- sidebar of the account page-->

	<nav class="col-md-2  bg-light sidebar">
		<ul class="nav flex-column">
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="view-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-person-badge-fill"
							viewBox="0 0 16 16">
                            <path
								d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2zm4.5 0a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1zM8 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6m5 2.755C12.146 12.825 10.623 12 8 12s-4.146.826-5 1.755V14a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1z" />
                        </svg>
						<br> view Profile
					</button>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="add-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-person-fill-add"
							viewBox="0 0 16 16">
                            <path
								d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                            <path
								d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4" />
                        </svg>
						<br> Add new user
					</button>
				</div>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="edit-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                        </svg>
						<br> Edit User
					</button>
				</div>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="status-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-person-fill-slash"
							viewBox="0 0 16 16">
                            <path
								d="M13.879 10.414a2.501 2.501 0 0 0-3.465 3.465zm.707.707-3.465 3.465a2.501 2.501 0 0 0 3.465-3.465m-4.56-1.096a3.5 3.5 0 1 1 4.949 4.95 3.5 3.5 0 0 1-4.95-4.95ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4" />
                        </svg>
						<br> Inactive User
					</button>
				</div>
			</li>
		</ul>
	</nav>
	<div class="container account">
		<div class="tempp" style="padding-bottom: 1%;">
			<div class="container transaction">
				<div id="addcustomer" style="display: none;">
					<div class="d-flex  transactionbox row">
						<div class="headeradd">
							<div class="newcustomer">
								<h3 id="textnewcustomer">Add a New Customer</h3>
							</div>
							<div class="newemployee" class="newemployee">
								<button id="newemploee" type="submit">Add New Employee
								</button>
							</div>
						</div>
						<div id="customer" class="col-5 align-items-center">
							<form id="customer" class="text-center forms" method="post"
								style="padding-top: 5%;">
								<label for="accountno">Name:</label> <input class="textbox"
									type="text" id="name" name="name" placeholder="Enter Name">
								<label for="accountno">Date Of Birth:</label> <input
									class="textbox" type="text" id="dob" name="dob"
									placeholder="1Enter DOB"><br> <label
									for="accountno">Mobile:</label> <input class="textbox"
									type="text" id="mobile" name="mobile"
									placeholder="Enter  Mobile Number"><br> <label
									for="accountno">Email:</label> <input class="textbox"
									type="email" id="email" name="email" placeholder="Enter Email"><br>
								<label for="accountno">Gender:</label> <input class="textbox"
									type="text" id="gender" name="gender"
									placeholder="Enter Gender"><br> <label
									for="accountno">Address:</label> <input class="textbox"
									type="text" id="address" name="address"
									placeholder="Enter Address"><br> <label
									for="accountno">Aadhar Number:</label> <input class="textbox"
									type="text" id="aadhar" name="aadhar"
									placeholder="1234567890123456"><br> <label
									for="accountno">Pan Number:</label> <input class="textbox"
									type="text" id="pan" name="pan" placeholder="ASDFG12345"><br>
								<button type="submit">Add</button>
							</form>
						</div>
						<div id="employee" class="col-5 align-items-center"
							style="display: none;">
							<form id="employee" class="text-center forms" method="post"
								style="padding-top: 5%;">
								<label for="accountno">Name:</label> <input class="textbox"
									type="text" id="name" name="name" placeholder="Enter Name">
								<label for="accountno">Date Of Birth:</label> <input
									class="textbox" type="text" id="dob" name="dob"
									placeholder="1Enter DOB"><br> <label
									for="accountno">Mobile:</label> <input class="textbox"
									type="text" id="mobile" name="mobile"
									placeholder="Enter  Mobile Number"><br> <label
									for="accountno">Email:</label> <input class="textbox"
									type="email" id="email" name="email" placeholder="Enter Email"><br>
								<label for="accountno">Gender:</label> <input class="textbox"
									type="text" id="gender" name="gender"
									placeholder="Enter Gender"><br> <label
									for="accountno">Address:</label> <input class="textbox"
									type="text" id="address" name="address"
									placeholder="Enter Address"><br> <label
									for="accountno">Working Branch:</label> <input class="textbox"
									type="text" id="branch" name="branch" placeholder="ASDFG12345"><br>
								<label for="accountno">Designation:</label> <select
									id="accountno" name="accountno" class="textbox">
									<option value="0">Employee</option>
									<option value="1">Manager</option>
								</select><br>
								<button type="submit">Add</button>
							</form>
						</div>
						<div class="col-6"
							style="background-image: url(Images/newCustomer.png); background-size: cover; background-position: center;">
						</div>
					</div>
				</div>
				<div id="view" style="display: block;">
					<div id="statement">
						<div class="justify-content-center row" style="display: flex;">
							<h3>User Profiles</h3>
							<div class="duration">
								<form id="duration" class="durationform"
									style="justify-content: end; gap: 3%;">
									Customer Id <input style="width: 30%;" name="id" type="number">
									<button class="link-button" type="submit">
										<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
											fill="currentColor" class="bi bi-arrow-down-square-fill"
											viewBox="0 0 16 16">
                                            <path
												d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg>
									</button>
								</form>
							</div>
							<div class=" latesttransaction ">
								<table class="table table-striped"
									style="padding-top: 5px; font-size: large;">
									<thead>
										<tr>
											<th scope="col">S.No</th>
											<th scope="col">Customer Id</th>
											<th scope="col">Name</th>
											<th scope="col">Mobile Number</th>
											<th scope="col">Email</th>
											<th scope="col">Address</th>
											<th scope="col">View</th>
										</tr>
									</thead>
									<tbody>
										<%
										int sno = 1;
										Map<Integer, CustomerDetails> users = (Map<Integer, CustomerDetails>) request.getAttribute("user");
										for (Entry individualUser : users.entrySet()) {
											CustomerDetails customer = (CustomerDetails) individualUser.getValue();
										%>
										<tr>
											<td><%=sno++%></td>
											<td><%=customer.getId()%></td>
											<td><%=customer.getName()%></td>
											<td><%=customer.getMobile()%></td>
											<td><%=customer.getEmail()%></td>
											<td><%=customer.getAddress()%></td>
											<td>
												<button type="button" class="btn link-button view-details"
													data-user-id="<%=customer%>
													data-bs-toggle="
													modal" data-bs-target="#staticBackdrop">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-eye-fill"
														viewBox="0 0 16 16">
														<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
														
														<path fill-rule="evenodd"
															d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" /> </svg>
												</button>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<div class="pagination">
							<div class="left">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="currentColor" class="bi bi-arrow-left-circle-fill"
									viewBox="0 0 16 16">
                                    <path
										d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                                </svg>
							</div>
							<div class="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="currentColor" class="bi bi-arrow-right-circle-fill"
									viewBox="0 0 16 16">
                                    <path
										d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                                </svg>
							</div>
						</div>
					</div>
				</div>
				<div id="edit" style="display: none;">
					<div id="statement">
						<div class="justify-content-center row" style="display: flex;">
							<h3>Edit Profiles</h3>
							<div class="duration">
								<form id="duration" class="durationform"
									style="justify-content: end; gap: 3%;">
									Customer Id <input style="width: 30%;" name="id" type="number">
									<button class="link-button" type="submit">
										<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
											fill="currentColor" class="bi bi-arrow-down-square-fill"
											viewBox="0 0 16 16">
                                            <path
												d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg>
									</button>
								</form>
							</div>
							<div class=" latesttransaction ">
								<table class="table table-striped"
									style="padding-top: 5px; font-size: large;">
									<thead>
										<tr>
											<th scope="col">S.No</th>
											<th scope="col">Customer Id</th>
											<th scope="col">Name</th>
											<th scope="col">Mobile Number</th>
											<th scope="col">Email</th>
											<th scope="col">Address</th>
											<th scope="col">View</th>
											<th scope="col">Edit</th>
											<th scope="col">Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>1</td>
											<td>P.Ramanujam</td>
											<td>9090909090</td>
											<td>rama@gmail.com</td>
											<td>123,Vadapalani,chennai-678901</td>
											<td>
												<button type="button" class="btn link-button"
													data-bs-toggle="modal" data-bs-target="#staticBackdrop">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-eye-fill"
														viewBox="0 0 16 16">
                                                        <path
															d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
															d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
												</button>
											</td>
											<td>
												<button type="button" class="btn link-button"
													data-bs-toggle="modal" data-bs-target="#staticBackdropedit">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor"
														class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                        <path
															d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                        <path
															fill-rule="evenodd"
															d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                                    </svg>
												</button>
											</td>
											<td><button class="link-button">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-trash3-fill"
														viewBox="0 0 16 16">
                                                        <path
															d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                                                    </svg>
												</button></td>
										</tr>
										<tr>
											<td>1</td>
											<td>1</td>
											<td>P.Ramanujam</td>
											<td>9090909090</td>
											<td>rama@gmail.com</td>
											<td>123,Vadapalani,chennai-678901</td>
											<td>
												<button type="button" class="btn link-button"
													data-bs-toggle="modal" data-bs-target="#staticBackdrop">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-eye-fill"
														viewBox="0 0 16 16">
                                                        <path
															d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
															d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
												</button>
											</td>
											<td>
												<button type="button" class="btn link-button"
													data-bs-toggle="modal" data-bs-target="#staticBackdropedit">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor"
														class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                        <path
															d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                        <path
															fill-rule="evenodd"
															d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                                    </svg>
												</button>
											</td>
											<td><button class="link-button">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-trash3-fill"
														viewBox="0 0 16 16">
                                                        <path
															d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                                                    </svg>
												</button></td>
										</tr>
									</tbody>
								</table>
								<div class="pagination">
									<div class="left">
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
											fill="currentColor" class="bi bi-arrow-left-circle-fill"
											viewBox="0 0 16 16">
                                            <path
												d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                                        </svg>
									</div>
									<div class="right">
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
											fill="currentColor" class="bi bi-arrow-right-circle-fill"
											viewBox="0 0 16 16">
                                            <path
												d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                                        </svg>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="status" style="display: none;">
					<div id="statement">
						<div class="justify-content-center row" style="display: flex;">
							<h3>Blocked and Deleted Users</h3>
							<div class="duration">
								<form id="duration" class="durationform"
									style="justify-content: end; gap: 3%;">
									SearchBy <select id="accountno" name="accountno"
										class="textbox">
										<option value="Deleted">Deleted</option>
										<option value="Blocked">Blocked</option>
									</select>
									<button class="link-button" type="submit">
										<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
											fill="currentColor" class="bi bi-arrow-down-square-fill"
											viewBox="0 0 16 16">
                                            <path
												d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg>
									</button>
								</form>
							</div>
							<div class=" latesttransaction ">
								<table class="table table-striped"
									style="padding-top: 5px; font-size: large;">
									<thead>
										<tr>
											<th scope="col">S.No</th>
											<th scope="col">Customer Id</th>
											<th scope="col">Name</th>
											<th scope="col">Mobile Number</th>
											<th scope="col">Email</th>
											<th scope="col">Address</th>
											<th scope="col">View</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>1</td>
											<td>P.Ramanujam</td>
											<td>9090909090</td>
											<td>rama@gmail.com</td>
											<td>123,Vadapalani,chennai-678901</td>
											<td>
												<button type="button" class="btn link-button"
													data-bs-toggle="modal" data-bs-target="#staticBackdrop">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-eye-fill"
														viewBox="0 0 16 16">
                                                        <path
															d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
															d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
												</button>
											</td>
										</tr>
										<tr>
											<td>1</td>
											<td>1</td>
											<td>P.Ramanujam</td>
											<td>9090909090</td>
											<td>rama@gmail.com</td>
											<td>123,Vadapalani,chennai-678901</td>
											<td>
												<button type="button" class="btn link-button"
													data-bs-toggle="modal" data-bs-target="#staticBackdrop">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-eye-fill"
														viewBox="0 0 16 16">
                                                        <path
															d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
															d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="pagination">
							<div class="left">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="currentColor" class="bi bi-arrow-left-circle-fill"
									viewBox="0 0 16 16">
                                    <path
										d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                                </svg>
							</div>
							<div class="right">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="currentColor" class="bi bi-arrow-right-circle-fill"
									viewBox="0 0 16 16">
                                    <path
										d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                                </svg>
							</div>
						</div>
					</div>
				</div>
				<div id="delete" style="display: none;">
					<div class="d-flex  transactionbox row">
						<h3>You are one step ahead to take Statement</h3>
						<div class="col-5 align-items-center" style="padding-top: 4%;">
							<form id="deposit" class="text-center forms" method="post"
								style="padding-top: 5%;">
								<label for="accountno">Account Number:</label> <select
									id="accountno" name="accountno" class="textbox">
									<option value="1000000000000012">1000000000000012</option>
									<option value="1000000000000016">1000000000000016</option>
								</select> <label style="padding-top: 2%;" for="duration">Duration:</label>
								<select id="duration" name="duration" class="textbox">
									<option value="1">1 Month</option>
									<option value="2">2 Months</option>
									<option value="3">3 Months</option>
								</select><br>
								<button type="submit">Take Statement</button>
							</form>
						</div>
						<div class="col-6"
							style="background-image: url(Images/statement.png); background-size: cover; background-position: center;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- Details of the user for view in view profile and edit options -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered .modal-dialog-custom"
			style="max-width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">User
						Detail</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="profile"
						style="background-color: white; border-radius: 2%; padding-left: 0; padding-top: 4%; margin-bottom: 2%;">
						<div class="profile-img" style="display: flex; align-items: end;">
							<img src="Images/profile.jpg" alt="Profile Picture"
								class="profile-picture"
								style="margin-right: 20px; padding-bottom: 5%;">
							<table>
								<tbody>
									<tr>
										<th scope="col">
											<p>Name</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerName"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Mobile Number</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerMobile"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Email</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerEmail"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Date of Birth</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerDob"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Address</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerAddres"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Aadhar Number</p>
										</th>
										<td>:</td>
										<td>
											<p id="CustomerAadhar"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>PAN Number</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerPan"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>User Status</p>
										</th>
										<td>:</td>
										<td>
											<p id="customerStatus"></p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Details of the user for view abd edit in view profile and edit options  -->
	<div class="modal fade" id="staticBackdropedit"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered"
			style="max-width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Edit the
						Details of a Customer</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="edit-profile"
						style="background-color: white; padding-top: 3%;">
						<div class="d-flex  transactionbox row">
							<h3>Edit Customer Details</h3>
							<div class="col-5 align-items-center" style="padding-top: 4%;">
								<form id="deposit" class="text-center forms" method="post"
									style="padding-top: 5%;">
									<label for="accountno">Name:</label> <input class="textbox"
										type="text" id="name" name="name" placeholder="Ram"> <label
										for="accountno">Mobile:</label> <input class="textbox"
										type="text" id="mobile" name="mobile"
										placeholder="909090909090"><br> <label
										for="accountno">Email:</label> <input class="textbox"
										type="email" id="email" name="email"
										placeholder="Ram@gmail.com"><br> <label
										for="accountno">Date Of Birth:</label> <input class="textbox"
										type="text" id="dob" name="dob" placeholder="13-09-1999"><br>
									<label for="accountno">Aadhar Number:</label> <input
										class="textbox" type="text" id="aadhar" name="aadhar"
										placeholder="1234567890123456"><br> <label
										for="accountno">Pan Number:</label> <input class="textbox"
										type="text" id="pan" name="pan" placeholder="ASDFG12345"><br>
									<button type="submit">Submit</button>
								</form>
							</div>
							<div class="col-6"
								style="background-image: url(Images/edit.png); background-size: cover; background-position: center;">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
<script>
    var buttonContentPairs = [
        { buttonId: "add-button", contentId: "addcustomer" },
        { buttonId: "view-button", contentId: "view" },
        { buttonId: "edit-button", contentId: "edit" },
        { buttonId: "status-button", contentId: "status" }
    ];

    buttonContentPairs.forEach(pair => {
        var button = document.getElementById(pair.buttonId);
        var content = document.getElementById(pair.contentId);

        button.addEventListener('click', function () {
            if (content.style.display !== 'block') {
                buttonContentPairs.forEach(otherPair => {
                    if (otherPair.contentId !== pair.contentId) {
                        document.getElementById(otherPair.contentId).style.display = 'none';
                    }
                });
                content.style.display = 'block';
            }
        });
    });

    // switch between employee and customer account creation

    document.getElementById("newemploee").addEventListener('click', function () {
        document.getElementById("customer").style.display = (document.getElementById("customer").style.display === 'none') ? 'block'
            : 'none';
        document.getElementById("employee").style.display = (document.getElementById("customer").style.display === 'none') ? 'block'
            : 'none';
        if (document.getElementById("customer").style.display === 'none') {
            document.getElementById("newemploee").innerHTML = 'Add new Customer';
            document.getElementById("textnewcustomer").innerHTML = 'Add a new Employee'
        }
        else {
            document.getElementById("newemploee").innerHTML = 'Add new Employee';
            document.getElementById("textnewcustomer").innerHTML = 'Add a new Customer'
        }
    });
    
    
    
    document.querySelectorAll('.view-details').forEach(button => {
        button.addEventListener('click', function () {
        	console.log("hi  "+customerDetails.name);
        	 var customerDetails = this.getAttribute('data-user-id');
        	 document.getElementById('customerName').innerHTML = customerDetails.name;
        });
    });
</script>

</script>

</html>