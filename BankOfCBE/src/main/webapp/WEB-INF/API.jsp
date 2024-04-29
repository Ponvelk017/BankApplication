<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="details.APIDetails"%>
<%@ page import="utility.Common"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma", "no-cache");
response.setHeader("Expires", "0");
%>
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
<title>Branch</title>
</head>

<body>
	<jsp:include page="EmployeeNavbar.jsp"></jsp:include>
	<div class="container account">
		<div class="tempp" style="padding-bottom: 1%;">
			<div class="container transaction">
				<div id="addcustomer" style="display: none;">
					<h3>Add New Branch</h3>
					<div class="d-flex  transactionbox row">
						<div id="customer" class="col-5 align-items-center">
							<form id="customer" class="text-center forms" method="post"
								style="padding-top: 5%;">
								<label for="ifsc">IFSC Code:</label> <input class="textbox"
									type="text" id="ifsc" name="ifsc" placeholder="Enter IFSC Code">
								<label for="accountno">Address:</label> <input class="textbox"
									type="text" id="address" name="address"
									placeholder="1Enter DOB"><br> <label
									for="accountno">Manager Id:</label> <input class="textbox"
									type="text" id="managerid" name="managerid"
									placeholder="Enter  Mobile Number"><br> <label
									for="accountno">Contact Number:</label> <input class="textbox"
									type="text" id="contact" name="contact"
									placeholder="Enter Contact Number"><br>
								<button type="submit">Add Branch</button>
							</form>
						</div>
						<div class="col-6"
							style="background-image: url(Images/accountdetails.png); background-size: cover; background-position: center;">
						</div>
					</div>
				</div>
				<div id="edit" style="display: block;">
					<div id="statement">
						<div class="justify-content-center row" style="display: flex;">
							<h3>APIs</h3>
							<div class="duration">
								<form id="duration" class="durationform" action="SessionFilter"
									method="post" style="justify-content: end; gap: 3%;">
									<input name="formType" value="apiKeySearch" type="hidden">
									API Key <input style="width: 30%;" name="apiKey" type="text">
									<button class="link-button" type="submit">
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
											fill="currentColor" class="bi bi-caret-down-square-fill"
											viewBox="0 0 16 16">
											<path
												d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm4 4a.5.5 0 0 0-.374.832l4 4.5a.5.5 0 0 0 .748 0l4-4.5A.5.5 0 0 0 12 6z" /></svg>
									</button>
								</form>
							</div>
							<div class=" latesttransaction ">
								<table class="table table-striped"
									style="padding-top: 5px; font-size: large;">
									<thead>
										<tr>
											<th scope="col">S.No</th>
											<th scope="col">Id</th>
											<th scope="col">User Id</th>
											<th scope="col">API Key</th>
											<th scope="col">Is Valid</th>
											<th scope="col">Created At</th>
										</tr>
									</thead>
									<tbody>
										<%
										int sno = (((int) (request.getAttribute("pageno")) - 1) * 10) + 1;
										int loop = 1;
										if (request.getAttribute("apis") != null) {
											List<APIDetails> apiRecords = (List<APIDetails>) request.getAttribute("apis");
											for (APIDetails individualAPi : apiRecords) {
												if (loop++ == 11) {
											break;
												}
										%>
										<tr>
											<td><%=sno++%></td>
											<td><%=individualAPi.getId()%></td>
											<td><%=individualAPi.getUserId()%></td>
											<td><%=individualAPi.getApiKey()%></td>
											<td><%=(individualAPi.getIsValid().equals("1") ? "Active" : "InActive")%></td>
											<td>
												<%
												Date date = new Date(individualAPi.getCreatedAt());
										        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

												%> <%=dateFormat.format(date)%></td>
											<%
											}
											%>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
								<div class="pagination">
									<div class="left">
										<form action="SessionFilter" method="post">
											<input name="formType" value="apiPagination" type="hidden">
											<input name="offset" value="<%=sno - 11%>" type="hidden">
											<input name="pageno"
												value="<%=(int) (request.getAttribute("pageno")) - 1%>"
												type="hidden">
											<button type="submit" class="btn link-button"
												<%if ((int) (request.getAttribute("pageno")) <= 1) {%>
												disabled <%}%>>
												<svg xmlns="http://www.w3.org/2000/svg" width="40"
													height="40" fill="currentColor"
													class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
													<path
														d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" /></svg>
											</button>
										</form>
									</div>

									<div class="right">
										<form action="SessionFilter" method="post">
											<input name="formType" value="apiPagination" type="hidden">
											<input name="offset" value="<%=sno%>" type="hidden">
											<input name="pageno"
												value="<%=(int) (request.getAttribute("pageno")) + 1%>"
												type="hidden">
											<button type="submit" class="btn link-button"
												<%if (((List<APIDetails>) request.getAttribute("apis")).size() <= 10) {%>
												disabled <%}%>>
												<svg xmlns="http://www.w3.org/2000/svg" width="40"
													height="40" fill="currentColor"
													class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
													<path
														d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" /></svg>
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div
					style="display: flex; flex-direction: column; justify-content: flex-end; margin-right: 2%; margin-bottom: 2%; padding-left: 90%;">
					<button type="button" class="btn link-button"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                        </svg>
						Create New API Key
					</button>
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered .modal-dialog-custom"
							style="max-width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Create
										New API Key</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div id="withdraw">
										<div class="d-flex justify-content-center transactionbox row">
											<h3>API key Generation</h3>
											<div class="col-5 align-items-center"
												style="padding-top: 4%;">
												<form id="newAPIKey" class="text-center forms" method="post"
													style="padding-top: 5%;">
													<input type="hidden" name="formType" value="newAPIKey">
													<label for="accountno">User ID:</label> <input
														class="textbox" type="number" id="mobile" name="userId"
														required><br>
													<button type="submit">Submit</button>
												</form>
												<p class="message" id="newmessage"></p>
											</div>
											<div class="col-6"
												style="background-image: url(Images/api.png); background-size: cover; background-position: center;">
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
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

<script>
	$(document)
			.ready(
					function() {
						$("#newAPIKey")
								.submit(
										function(event) {
											event.preventDefault();
											var formdata = $(this).serialize();
											$
													.ajax({
														type : 'POST',
														url : 'SessionFilter',
														data : formdata,
														success : function(
																response) {
															if (response.error) {
																(document)
																		.getElementById("newmessage").innerHTML = 'Something went wrong, Try Again';
																(document)
																		.getElementById("newmessage").style.color = 'red';
																setTimeout(
																		function() {
																			document
																					.getElementById("newmessage").innerHTML = '';
																		}, 2000);
															} else {
																if (response.status) {
																	console
																			.log(response.status);
																	(document)
																			.getElementById("newmessage").innerHTML = 'successful. The API Key is : '
																			+ response.apiKey;
																	(document)
																			.getElementById("newmessage").style.color = 'green';
																	setTimeout(
																			function() {
																				document
																						.getElementById("newmessage").innerHTML = '';
																			},
																			5000);
																} else {
																	(document)
																			.getElementById("newmessage").innerHTML = response.message;
																	(document)
																			.getElementById("newmessage").style.color = 'red';
																	setTimeout(
																			function() {
																				document
																						.getElementById("newmessage").innerHTML = '';
																			},
																			2000);
																}
															}
														},
														error : function(xhr,
																status, error) {
															window
																	.alert("Something Went Wrong, Try after sometime....");
														}
													});
										});
					});
</script>


</html>