<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="details.AccountDetails"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="org.json.JSONObject"%>

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
<title>Account</title>
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
							fill="currentColor" class="bi bi-person-vcard-fill"
							viewBox="0 0 16 16">
                            <path
								d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5M9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8m1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5m-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96q.04-.245.04-.5M7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0" />
                        </svg>
						<br> view Account
					</button>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="add-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-bag-plus-fill"
							viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0M8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5z" />
                        </svg>
						<br> Add new Account
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
						<br> Account Handling
					</button>
				</div>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="status-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-file-lock2-fill"
							viewBox="0 0 16 16">
                            <path d="M7 6a1 1 0 0 1 2 0v1H7z" />
                            <path
								d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2m-2 6v1.076c.54.166 1 .597 1 1.224v2.4c0 .816-.781 1.3-1.5 1.3h-3c-.719 0-1.5-.484-1.5-1.3V8.3c0-.627.46-1.058 1-1.224V6a2 2 0 1 1 4 0" />
                        </svg>
						<br> Inactive Accounts
					</button>
				</div>
			</li>
		</ul>
	</nav>
	<div class="container account">
		<div class="tempp" style="padding-bottom: 1%;">
			<div class="container transaction">
				<div id="addaccount" style="display: none;">
					<h3>Add a New Account</h3>
					<div class="d-flex  transactionbox row">
						<div id="account" class="col-5 align-items-center">
							<form id="newAccount" class="text-center forms"
								style="padding-top: 5%;">
								<input name="formType" value="newAccount" type="hidden">
								<label for="accountno">Customer Id:</label> <input
									class="textbox" type="number" id="id" name="id"
									placeholder="Enter  Customer Id"><br> <label
									for="accountno">Branch Id:</label> <input class="textbox"
									type="text" id="ifsc" name="ifsc" placeholder="Enter IFSC">
								<label for="accountno">Account Type:</label> <select
									id="acctypeountno" name="type" class="textbox">
									<option value="Saving">Saving</option>
									<option value="Salary">Salary</option>
									<option value="Current">Current</option>
								</select><br> <label for="accountno">Initial Balance:</label> <input
									class="textbox" type="number" id="balance" name="balance"
									placeholder="Enter Balance(Optional)"><br> <label
									for="msg">The Account Number will be Auto generated
									once you add these details.</label> <br>
								<button id="newaccountbtn" type="submit">Add</button>
							</form>
							<p id="newaccountmessage"></p>
						</div>
						<div class="col-6"
							style="background-image: url(Images/newaccount.png); background-size: cover; background-position: center;">
						</div>
					</div>
				</div>
				<div id="view" style="display: none;">
					<div id="statement">
						<div class="justify-content-center row" style="display: flex;">
							<h3>Accounts</h3>
							<div class="duration">
								<form id="fetchaccount" action="home" method="post"
									class="durationform" style="justify-content: end; gap: 3%;">
									<input name="formType" value="fetchAccount" type="hidden">
									Account Number <input style="width: 30%;" name="id"
										type="number">
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
											<th scope="col">Account Number</th>
											<th scope="col">User Id</th>
											<th scope="col">Branch IFSC</th>
											<th scope="col">View</th>
										</tr>
									</thead>
									<tbody>
										<%
										int sno = 1;
										Map<Long, AccountDetails> users = (Map<Long, AccountDetails>) request.getAttribute("accounts");
										for (Entry individualAccount : users.entrySet()) {
											AccountDetails accountDetails = (AccountDetails) individualAccount.getValue();
											JSONObject accountJson = new JSONObject();
											accountJson.put("AccountNumber", accountDetails.getAccountNumber());
											accountJson.put("UserId", accountDetails.getUserId());
											accountJson.put("BranchId", accountDetails.getBranchId());
											accountJson.put("Balance", accountDetails.getBalance());
											accountJson.put("AccountType", accountDetails.getAccountType());
											accountJson.put("Status", accountDetails.getStatus());
										%>
										<tr>
											<td><%=sno++%></td>
											<td><%=accountDetails.getAccountNumber()%></td>
											<td><%=accountDetails.getUserId()%></td>
											<td><%=accountDetails.getBranchId()%></td>
											<td>
												<button type="button" class="btn link-button view-details"
													data-account-id='<%=accountJson.toString()%>'
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
							<h3>Edit Accounts</h3>
							<div class="duration">
								<form id="fetchaccount" action="home" method="post"
									class="durationform" style="justify-content: end; gap: 3%;">
									<input name="formType" value="fetchEditAccount" type="hidden">
									Account Number <input style="width: 30%;" name="id"
										type="number">
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
											<th scope="col">Account Number</th>
											<th scope="col">User Id</th>
											<th scope="col">Branch IFSC</th>
											<th scope="col">Balance</th>
											<th scope="col">View</th>
											<th scope="col">Deposit</th>
											<th scope="col">Withdraw</th>
											<th scope="col">Transfer</th>
											<th scope="col">Block</th>
										</tr>
									</thead>
									<tbody>
										<%
										sno = 1;
										Map<Long, AccountDetails> editAccounts = (Map<Long, AccountDetails>) request.getAttribute("editAccounts");
										for (Entry individualAccount : editAccounts.entrySet()) {
											AccountDetails accountDetails = (AccountDetails) individualAccount.getValue();
											JSONObject accountJson = new JSONObject();
											accountJson.put("AccountNumber", accountDetails.getAccountNumber());
											accountJson.put("UserId", accountDetails.getUserId());
											accountJson.put("BranchId", accountDetails.getBranchId());
											accountJson.put("Balance", accountDetails.getBalance());
											accountJson.put("AccountType", accountDetails.getAccountType());
											accountJson.put("Status", accountDetails.getStatus());
										%>
										<tr>
											<td><%=sno++%></td>
											<td><%=accountDetails.getAccountNumber()%></td>
											<td><%=accountDetails.getUserId()%></td>
											<td><%=accountDetails.getBranchId()%></td>
											<td><%=accountDetails.getBalance()%></td>
											<td>
												<button type="button" class="btn link-button view-details"
													data-account-id='<%=accountJson.toString()%>'
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
												<button type="button" class="btn link-button deposit-modal"
													data-deposit-id='<%=accountJson.toString()%>'
													data-bs-toggle="modal"
													data-bs-target="#staticBackdropDeposit">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor"
														class="bi bi-piggy-bank-fill" viewBox="0 0 16 16">
                                                        <path
															d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069q0-.218-.02-.431c.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a1 1 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.74.74 0 0 0-.375.562c-.024.243.082.48.32.654a2 2 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595m7.173 3.876a.6.6 0 0 1-.098.21l-.044-.025c-.146-.09-.157-.175-.152-.223a.24.24 0 0 1 .117-.173c.049-.027.08-.021.113.012a.2.2 0 0 1 .064.199m-8.999-.65a.5.5 0 1 1-.276-.96A7.6 7.6 0 0 1 7.964 3.5c.763 0 1.497.11 2.18.315a.5.5 0 1 1-.287.958A6.6 6.6 0 0 0 7.964 4.5c-.64 0-1.255.09-1.826.254ZM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0" />
                                                    </svg>
												</button>
											</td>
											<td>
												<button type="button" class="btn link-button withdraw-modal"
													data-withdraw-id='<%=accountJson.toString()%>'
													data-bs-toggle="modal"
													data-bs-target="#staticBackdropWithdraw">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-cash-coin"
														viewBox="0 0 16 16">
                                                        <path
															fill-rule="evenodd"
															d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8m5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0" />
                                                        <path
															d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195z" />
                                                        <path
															d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083q.088-.517.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1z" />
                                                        <path
															d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 6 6 0 0 1 3.13-1.567" />
                                                    </svg>
												</button>
											</td>
											<td>
												<button type="button" class="btn link-button transfer-modal"
													data-transfer-id='<%=accountJson.toString()%>'
													data-bs-toggle="modal"
													data-bs-target="#staticBackdropTransfer">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor"
														class="bi bi-arrow-left-right" viewBox="0 0 16 16">
                                                        <path
															fill-rule="evenodd"
															d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5m14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5" />
                                                    </svg>
												</button>
											</td>
											<td>
												<form class="blockForm">
													<input name="accountno"
														value="<%=accountDetails.getAccountNumber()%>"
														type="hidden"> <input name="formType"
														value="blockAccount" type="hidden"> <input
														name="status" value="0" type="hidden">
													<button class="link-button block-button">
														<svg xmlns="http://www.w3.org/2000/svg" width="30"
															height="30" fill="currentColor" class="bi bi-ban"
															viewBox="0 0 16 16">
															<path
																d="M15 8a6.97 6.97 0 0 0-1.71-4.584l-9.874 9.875A7 7 0 0 0 15 8M2.71 12.584l9.874-9.875a7 7 0 0 0-9.874 9.874ZM16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0" /></svg>
													</button>
												</form>
											</td>
										</tr>
										<%
										}
										%>
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
								<form id="fetchaccount" action="home" method="post"
									class="durationform" style="justify-content: end; gap: 3%;">
									<input name="formType" value="fetchAccount" type="hidden">
									Account Number <input style="width: 30%;" name="id"
										type="number">
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
											<th scope="col">Account Number</th>
											<th scope="col">User Id</th>
											<th scope="col">Branch IFSC</th>
											<th scope="col">View</th>
											<th scope="col">UnBlock</th>
										</tr>
									</thead>
									<%
									sno = 1;
									Map<Long, AccountDetails> inactiveAccounts = (Map<Long, AccountDetails>) request.getAttribute("inactiveAccounts");
									for (Entry individualAccount : inactiveAccounts.entrySet()) {

										AccountDetails accountDetails = (AccountDetails) individualAccount.getValue();
										JSONObject inactiveAccountJson = new JSONObject();
										inactiveAccountJson.put("AccountNumber", accountDetails.getAccountNumber());
										inactiveAccountJson.put("UserId", accountDetails.getUserId());
										inactiveAccountJson.put("BranchId", accountDetails.getBranchId());
										inactiveAccountJson.put("Balance", accountDetails.getBalance());
										inactiveAccountJson.put("AccountType", accountDetails.getAccountType());
										inactiveAccountJson.put("Status", accountDetails.getStatus());
									%>
									<tr>
										<td><%=sno++%></td>
										<td><%=accountDetails.getAccountNumber()%></td>
										<td><%=accountDetails.getUserId()%></td>
										<td><%=accountDetails.getBranchId()%></td>
										<td>
											<button type="button" class="btn link-button view-details"
												data-account-id='<%=inactiveAccountJson.toString()%>'
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
											<form class="blockForm">
												<input name="accountno"
													value="<%=accountDetails.getAccountNumber()%>"
													type="hidden"> <input name="formType"
													value="blockAccount" type="hidden"> <input
													name="status" value="1" type="hidden">
												<button class="link-button block-button">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor" class="bi bi-ban"
														viewBox="0 0 16 16">
															<path
															d="M15 8a6.97 6.97 0 0 0-1.71-4.584l-9.874 9.875A7 7 0 0 0 15 8M2.71 12.584l9.874-9.875a7 7 0 0 0-9.874 9.874ZM16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0" /></svg>
												</button>
											</form>
										</td>
										<%
										}
										%>
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
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Account
						Detail</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="profile"
						style="background-color: white; border-radius: 2%; padding-left: 0; padding-top: 4%; margin-bottom: 2%;">
						<div class="profile-img" style="display: flex; align-items: end;">
							<img src="Images/accountprofile.png" alt="Profile Picture"
								class="account-profile-picture"
								style="margin-right: 20px; padding-bottom: 5%;">
							<table>
								<tbody>
									<tr>
										<th scope="col">
											<p>Account Number</p>
										</th>
										<td>:</td>
										<td>
											<p id="accountnumber"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>User Id</p>
										</th>
										<td>:</td>
										<td>
											<p id="userId"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Branch Id</p>
										</th>
										<td>:</td>
										<td>
											<p id="branch"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Account Type</p>
										</th>
										<td>:</td>
										<td>
											<p id="accounttype"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Balance</p>
										</th>
										<td>:</td>
										<td>
											<p id="viewbalance"></p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Status</p>
										</th>
										<td>:</td>
										<td>
											<p id="viewstatus"></p>
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

	<!--A modal for deposit  -->
	<div class="modal fade" id="staticBackdropDeposit"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered .modal-dialog-custom"
			style="max-width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Deposit
						Amount</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="deposit">
						<div class="d-flex  transactionbox row">
							<h3>You are one step ahead to Deposit</h3>
							<div class="col-5 align-items-center" style="padding-top: 4%;">
								<form id="depositForm" class="text-center forms"
									style="padding-top: 5%;">
									<input name="formType" value="deposit" type="hidden"> <label
										for="accountno">Account Number:</label> <input class="textbox"
										type="number" id="accountNumber" name="accountno"> <label
										style="padding-top: 2%;" for="amount">Amount:</label> <input
										class="textbox" type="text" id="amount" name="amount"
										placeholder="Enter Amount" required><br>
									<button type="submit">Deposit</button>
								</form>
								<p class="message" id="depositMessage"></p>
							</div>
							<div class="col-6"
								style="background-image: url(Images/deposit.png); background-size: cover; background-position: center;">
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
	<!--A modal for Withdraw  -->
	<div class="modal fade" id="staticBackdropWithdraw"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered .modal-dialog-custom"
			style="max-width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Withdraw
						Amount</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="withdraw">
						<div class="d-flex justify-content-center transactionbox row">
							<h3>You are one step ahead to Withdraw</h3>
							<div class="col-5 align-items-center" style="padding-top: 4%;">
								<form id="withdrawForm" class="text-center forms"
									style="padding-top: 5%;">
									<input name="formType" value="withdraw" type="hidden">
									<label for="accountno">Account Number:</label> <input
										class="textbox" type="number" id="Withdrawaccount"
										name="accountno"> <label style="padding-top: 2%;"
										for="amount">Amount:</label> <input class="textbox"
										type="text" id="amount" name="amount"
										placeholder="Enter Amount" required><br> <label
										style="padding-top: 2%;" for="accountno">Remarks:</label> <input
										class="textbox" type="text" id="remark" name="remark"
										placeholder="Enter Remarks" required><br>
									<button type="submit">Withdraw</button>
								</form>
								<p class="message" id="withdrawMessage"></p>
							</div>
							<div class="col-6"
								style="background-image: url(Images/withdraw.png); background-size: cover; background-position: center;">
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
	<!--A modal for Transfer  -->
	<div class="modal fade" id="staticBackdropTransfer"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered .modal-dialog-custom"
			style="max-width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Transfer
						Amount</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="inter">
						<div class="d-flex justify-content-center transactionbox row">
							<h3>You are one step ahead to Transfer</h3>
							<div class="col-5 align-items-center" style="padding-top: 4%;">
								<form id="transferForm" class="text-center forms" method="post"
									style="padding-top: 5%;">
									<input name="formType" value="interTransfer" type="hidden">
									<label for="accountno">Account Number:</label> <input
										class="textbox" type="number" id="transferaccount"
										name="accountno"> <label style="padding-top: 2%;"
										for="recaccount">Receiver Account Number:</label> <input
										class="textbox" type="text" id="recaccount" name="recaccount"
										placeholder="Enter Receiver Account Number" required><br>
									<label style="padding-top: 2%;" for="amount">Amount:</label> <input
										class="textbox" type="text" id="amount" name="amount"
										placeholder="Enter Amount" required><br> <label
										style="padding-top: 2%;" for="accountno">Remarks:</label> <input
										class="textbox" type="text" id="remark" name="remark"
										placeholder="Enter Remarks" required><br>
									<button type="submit">Transfer</button>
								</form>
								<p class="message" id="trasferMessage"></p>
							</div>
							<div class="col-6"
								style="background-image: url(Images/transfer.jpg); background-size: cover; background-position: center;">
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
<script>
    var buttonContentPairs = [
        { buttonId: "add-button", contentId: "addaccount" },
        { buttonId: "view-button", contentId: "view" },
        { buttonId: "edit-button", contentId: "edit" },
        { buttonId: "status-button", contentId: "status" }
    ];
    
    var openedDivId = localStorage.getItem('openedEditDiv');
	console.log(openedDivId);
    if (openedDivId) {
        document.getElementById(openedDivId).style.display = 'block';
    } else {
        document.getElementById('view').style.display = 'block';
    }
    
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
                localStorage.setItem('openedEditDiv', pair.contentId);
            }
        });
    });
    
    //view modal for account
    document.querySelectorAll('.view-details').forEach(button => {
        button.addEventListener('click', function () {
        	 const accountDetails = JSON.parse(this.getAttribute('data-account-id'));
        	 document.getElementById('accountnumber').innerHTML = accountDetails.AccountNumber;
        	 document.getElementById('userId').innerHTML = accountDetails.UserId;
        	 document.getElementById('branch').innerHTML = accountDetails.BranchId;
        	 document.getElementById('accounttype').innerHTML = accountDetails.AccountType;
        	 document.getElementById('viewbalance').innerHTML = accountDetails.Balance;
        	 document.getElementById('viewstatus').innerHTML = ((accountDetails.Status)=='1')?'Active':'InActive';
        });
    });
    
    //new Account creation
    $(document).ready(function(){
    	$("#newAccount").submit(function(event){
    		event.preventDefault();
    		var formdata = $(this).serialize();
    		$.ajax({
    			type:'POST',
    			url:'home',
    			data:formdata,
    			success:function(response){
    				if (response.error) {
                    	(document).getElementById("newaccountmessage").innerHTML = 'Something went wrong, Try Again';
                    	(document).getElementById("newaccountmessage").style.color = 'red';
                    	 setTimeout(function() {
                    	        document.getElementById("newaccountmessage").innerHTML = '';
                    	    }, 2000);
                    } else {
                    	document.getElementById("newAccount").reset();
                    	(document).getElementById("newaccountmessage").innerHTML = 'successful';
                    	(document).getElementById("newaccountmessage").style.color = 'green';
                    	 setTimeout(function() {
                    	        document.getElementById("newaccountmessage").innerHTML = '';
                    	    }, 2000);
                    }
    			},
                error: function(xhr, status, error) {
                	window.alert("Something Went Wrong, Try after sometime....");
                }
    		});
    	});
    });
    
    //deposit modal
    document.querySelectorAll('.deposit-modal').forEach(button => {
      button.addEventListener('click', function () {
      	 const accountDetails = JSON.parse(this.getAttribute('data-deposit-id'));
      	 document.getElementById('accountNumber').value = accountDetails.AccountNumber;
      });
  });
    
    //withdraw modal
    document.querySelectorAll('.withdraw-modal').forEach(button => {
      button.addEventListener('click', function () {
      	 const accountDetails = JSON.parse(this.getAttribute('data-withdraw-id'));
      	 document.getElementById('Withdrawaccount').value = accountDetails.AccountNumber;
      });
  });
    
    //transfer  modal
    document.querySelectorAll('.transfer-modal').forEach(button => {
      button.addEventListener('click', function () {
      	 const accountDetails = JSON.parse(this.getAttribute('data-transfer-id'));
      	 document.getElementById('transferaccount').value = accountDetails.AccountNumber;
      });
  });
    
    
    //depoite,wuirthdraw,transfer
      $(document).ready(function(){
        var forms = [
            { formId: 'depositForm', messageId: 'depositMessage' },
            { formId: 'withdrawForm', messageId: 'withdrawMessage' },
            { formId: 'transferForm', messageId: 'trasferMessage' },
            { formId: 'intraForm', messageId: 'intraMessage' }
        ];

        forms.forEach(function(form) {
            $('#' + form.formId).submit(function(event) {
                event.preventDefault();
                var formData = $(this).serialize();
                $.ajax({
                    type: 'POST',
                    url: 'home',
                    data: formData,
                    success: function(response) {
                        if (response.error) {
                        	(document).getElementById(form.messageId).innerHTML = 'Something went wrong, Try Again';
                        	(document).getElementById(form.messageId).style.color = 'red';
                        } else {
                        	document.getElementById(form.formId).reset();
                        	(document).getElementById(form.messageId).innerHTML = 'successful';
                        	(document).getElementById(form.messageId).style.color = 'green';
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX Error:", error);
                    }
                });
            });
        });
    });
    
    //block account
    $(document).ready(function(){
		    $(".blockForm, .deleteForm").each(function() {
		        $(this).submit(function(event){
		            event.preventDefault();
		            var formdata = $(this).serialize();
		            var formType = $(this).find('input[name="formType"]').val(); 
		            $.ajax({
		                type:'POST',
		                url:'home',
		                data:formdata,
		                success:function(response){
		                    if (response.error) {
		                        window.alert("Unsuccessful");
		                    } else {
		                        window.alert("Successful"); 
		                    }
		                },
		                error: function(xhr, status, error) {
		                    window.alert("Something Went Wrong, Try after sometime....");
		                }
		            });
		        });
		    });
		});
    
    
</script>

</script>

</html>