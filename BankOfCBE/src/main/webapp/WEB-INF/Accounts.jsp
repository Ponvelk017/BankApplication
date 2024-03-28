<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="details.TransactionDetails"%>
<%@ page import="details.AccountDetails"%>
<%@ page import="utility.Common"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map.Entry"%>



<!DOCTYPE html>
<%@page import="controller.GlobalController"%>
<%@page import="org.apache.tomcat.jni.Global"%>
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
<title>Account</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="GlobalController"> <img
			src="Images/logo.png" style="width: 22%; height: 22%;"
			class="d-inline-block align-top" alt="Bank Logo">
		</a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="<%=request.getContextPath()%>/home?page=home"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
                            <path
								d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z" />
                        </svg> Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/home?page=account"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-person-vcard"
							viewBox="0 0 16 16">
                            <path
								d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5" />
                            <path
								d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z" />
                        </svg>Accounts</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/home?page=branch"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-geo-alt-fill"
							viewBox="0 0 16 16">
                            <path
								d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6" />
                        </svg>Branch<a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/home?page=complaint""><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-exclamation-triangle-fill"
							viewBox="0 0 16 16">
                            <path
								d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                        </svg>Complaint</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/home?page=logout"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-arrow-right-square-fill"
							viewBox="0 0 16 16">  <path
								d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1" />
					</svg>Logout</a></li>
				<li class="nav-item profile"><a class="nav-link"
					href="<%=request.getContextPath()%>/home?page=profile"><svg
							xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-person-circle"
							viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                            <path fill-rule="evenodd"
								d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
                        </svg>Profile</a></li>
			</ul>
		</div>
	</nav>

	<!-- sidebar of the account page-->

	<nav class="col-md-2  bg-light sidebar">
		<ul class="nav flex-column">
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="deposit-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-piggy-bank-fill"
							viewBox="0 0 16 16">
                            <path
								d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069q0-.218-.02-.431c.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a1 1 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.74.74 0 0 0-.375.562c-.024.243.082.48.32.654a2 2 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595m7.173 3.876a.6.6 0 0 1-.098.21l-.044-.025c-.146-.09-.157-.175-.152-.223a.24.24 0 0 1 .117-.173c.049-.027.08-.021.113.012a.2.2 0 0 1 .064.199m-8.999-.65a.5.5 0 1 1-.276-.96A7.6 7.6 0 0 1 7.964 3.5c.763 0 1.497.11 2.18.315a.5.5 0 1 1-.287.958A6.6 6.6 0 0 0 7.964 4.5c-.64 0-1.255.09-1.826.254ZM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0" />
                        </svg>
						Deposit
					</button>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="withdraw-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8m5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0" />
                            <path
								d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195z" />
                            <path
								d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083q.088-.517.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1z" />
                            <path
								d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 6 6 0 0 1 3.13-1.567" />
                        </svg>
						Withdraw
					</button>
				</div>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="inter-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-arrow-left-right"
							viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5m14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5" />
                        </svg>
						Transfer within Bank
					</button>
				</div>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="intra-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-box-arrow-in-right"
							viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z" />
                            <path fill-rule="evenodd"
								d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z" />
                        </svg>
						Transfer with Other Bank
					</button>
				</div>
			</li>
			<li class="nav-item">
				<div class="nav-link nav-linka text-center">
					<button type="submit" id="statement-button" class="link-button">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
							fill="currentColor" class="bi bi-file-ruled" viewBox="0 0 16 16">
                            <path
								d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v4h10V2a1 1 0 0 0-1-1zm9 6H6v2h7zm0 3H6v2h7zm0 3H6v2h6a1 1 0 0 0 1-1zm-8 2v-2H3v1a1 1 0 0 0 1 1zm-2-3h2v-2H3zm0-3h2V7H3z" />
                        </svg>
						Statement
					</button>
				</div>
			</li>
		</ul>
	</nav>
	<div class="container account">
		<h1>Your Accounts</h1>
		<div class="row "
			style="display: flex; flex-direction: row; justify-content: space-around;">
			<%
			Map<Long, AccountDetails> accounts = new HashMap<Long, AccountDetails>();
			if (request.getAttribute("accounts") != null) {
				accounts = (Map<Long, AccountDetails>) request.getAttribute("accounts");
				for (Entry individualAccounts : accounts.entrySet()) {
					AccountDetails accountDetails = (AccountDetails) individualAccounts.getValue();
			%>
			<div class="" style="width: fit-content;">
				<div class="card">
					<div class="card-header  text-center">
						<h2>Accounts</h2>
					</div>
					<div class="card-user">
						<h3>${customerName}</h3>
					</div>
					<div class="card-number text-center">
						<h4><%=individualAccounts.getKey()%></h4>
					</div>
					<div class="row card-info">
						<div class="card-type col">
							<h4><%=accountDetails.getAccountType()%></h4>
						</div>
						<div class="card-ifsc col">
							<h4><%=accountDetails.getBranchId()%></h4>
						</div>
						<div class="card-status col">
							<h4><%=(accountDetails.getStatus().equals("1")) ? "Active" : "InActive"%></h4>
						</div>
						<div class="card-balance col">
							<h4>
								Balance :
								<%=accountDetails.getBalance()%></h4>
						</div>
					</div>
					<img class="bank-logo" src="Images/bankofcbe.png" alt="Bank logo">
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
		<div class="tempp">
			<div class="container transaction ">
				<div id="statement">
					<div class="justify-content-center row" style="display: flex;">
						<h3>You Latest Transactions</h3>
						<div class="duration">
							<form id="duration" action="<%=request.getContextPath()%>/home"
								class="durationform" method="post">
								<input name="formType" value="transactionDuration" type="hidden">
								From <input style="width: 35%;" name="from" type="date" required>
								To <input style="width: 35%;" name="to" type="date" required>
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
										<th scope="col">Transaction Id</th>
										<th scope="col">Sender Account</th>
										<th scope="col">Receiver Account</th>
										<th scope="col">User Id</th>
										<th scope="col">Transaction Type</th>
										<th scope="col">Remarks</th>
										<th scope="col">Amount</th>
										<th scope="col">Closing Balance</th>
										<th scope="col">Time and Date</th>
									</tr>
								</thead>
								<tbody>
									<%
									if (request.getAttribute("latestTransaction") != null) {
										List<TransactionDetails> transactionRecords = (List<TransactionDetails>) request.getAttribute("latestTransaction");
										for (TransactionDetails individualTransaction : transactionRecords) {
									%>
									<tr>
										<td><%=individualTransaction.getId()%></td>
										<td><%=individualTransaction.getAccountId()%></td>
										<td><%=individualTransaction.getTransactionAccountId()%></td>
										<td><%=individualTransaction.getUserId()%></td>
										<td><%=individualTransaction.getTransactionType()%></td>
										<td><%=individualTransaction.getDescription()%></td>
										<td><%=individualTransaction.getAmount()%></td>
										<td><%=individualTransaction.getClosingBalance()%></td>
										<td>
											<%
											String date = Common.milliToDate(individualTransaction.getTransactionTime());
											%> <%=date%>
										</td>
									</tr>
									<%
									}
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

				<div id="deposit" style="display: none";>
					<div class="d-flex transactionbox row">
						<h3>You are one step ahead to Deposit</h3>
						<div class="col-5 align-items-center" style="padding-top: 4%;">
							<form id="depositForm" class="text-center forms"
								style="padding-top: 5%;">
								<input name="formType" value="deposit" type="hidden"> <label
									for="accountno">Account Number:</label> <select id="accountno"
									name="accountno" class="textbox">
									<option value="" disabled selected hidden>--Select--</option>
									<%
									for (Entry individualAccounts : accounts.entrySet()) {
									%>
									<option value="<%=individualAccounts.getKey()%>"><%=individualAccounts.getKey()%></option>
									<%
									}
									%>
								</select> <label style="padding-top: 2%;" for="amount">Amount:</label> <input
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
				<div id="withdraw" style="display: none;">
					<div class="d-flex justify-content-center transactionbox row">
						<h3>You are one step ahead to Withdraw</h3>
						<div class="col-5 align-items-center" style="padding-top: 4%;">
							<form id="withdrawForm" class="text-center forms"
								style="padding-top: 5%;">
								<input name="formType" value="withdraw" type="hidden"> <label
									for="accountno">Account Number:</label> <select id="accountno"
									name="accountno" class="textbox">
									<option value="" disabled selected hidden>--Select--</option>
									<%
									for (Entry individualAccounts : accounts.entrySet()) {
									%>
									<option value="<%=individualAccounts.getKey()%>"><%=individualAccounts.getKey()%></option>
									<%
									}
									%>
								</select> <label style="padding-top: 2%;" for="amount">Amount:</label> <input
									class="textbox" type="text" id="amount" name="amount"
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
				<div id="inter" style="display: none;">
					<div class="d-flex justify-content-center transactionbox row">
						<h3>You are one step ahead to Transfer</h3>
						<div class="col-5 align-items-center" style="padding-top: 4%;">
							<form id="interForm" class="text-center forms"
								style="padding-top: 5%;">
								<input name="formType" value="interTransfer" type="hidden">
								<label for="accountno">Account Number:</label> <select
									id="accountno" name="accountno" class="textbox">
									<option value="" disabled selected hidden>--Select--</option>
									<%
									for (Entry individualAccounts : accounts.entrySet()) {
									%>
									<option value="<%=individualAccounts.getKey()%>"><%=individualAccounts.getKey()%></option>
									<%
									}
									%>
								</select> <label style="padding-top: 2%;" for="recaccount">Receiver
									Account Number:</label> <input class="textbox" type="text"
									id="recaccount" name="recaccount"
									placeholder="Enter Receiver Account Number" required><br>
								<label style="padding-top: 2%;" for="amount">Amount:</label> <input
									class="textbox" type="text" id="amount" name="amount"
									placeholder="Enter Amount" required><br> <label
									style="padding-top: 2%;" for="accountno">Remarks:</label> <input
									class="textbox" type="text" id="remark" name="remark"
									placeholder="Enter Remarks" required><br>
								<button type="submit">Transfer</button>
							</form>
							<p class="message" id="interMessage"></p>
						</div>
						<div class="col-6"
							style="background-image: url(Images/transfer.png); background-size: cover; background-position: center;">
						</div>
					</div>
				</div>
				<div id="intra" style="display: none;">
					<div class="d-flex justify-content-center transactionbox row">
						<h3>You are one step ahead to Transfer</h3>
						<div class="col-5 align-items-center" style="padding-top: 4%;">
							<form id="intraForm" class="text-center forms"
								style="padding-top: 5%;">
								<input name="formType" value="intraTransfer" type="hidden">
								<label for="accountno">Account Number:</label> <select
									id="accountno" name="accountno" class="textbox">
									<option value="" disabled selected hidden>--Select--</option>
									<%
									for (Entry individualAccounts : accounts.entrySet()) {
									%>
									<option value="<%=individualAccounts.getKey()%>"><%=individualAccounts.getKey()%></option>
									<%
									}
									%>
								</select> <label style="padding-top: 2%;" for="recaccount">Receiver
									Account Number:</label> <input class="textbox" type="text"
									id="recaccount" name="recaccount"
									placeholder="Enter Receiver Account Number" required><br>
								<label style="padding-top: 2%;" for="amount">Amount:</label> <input
									class="textbox" type="text" id="amount" name="amount"
									placeholder="Enter Amount" required><br> <label
									style="padding-top: 2%;" for="ifsc">IFSC Code:</label> <input
									class="textbox" type="text" id="ifsc" name="ifsc"
									placeholder="Enter IFSC code" required><br> <label
									style="padding-top: 2%;" for="accountno">Remarks:</label> <input
									class="textbox" type="text" id="remark" name="remark"
									placeholder="Enter Remarks" required><br>
								<button type="submit">Transfer</button>
							</form>
							<p class="message" id="intraMessage"></p>
						</div>
						<div class="col-6"
							style="background-image: url(Images/intra1.jpg); background-size: cover; background-position: center;">
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
<script>
    var buttonContentPairs = [
        { buttonId: "deposit-button", contentId: "deposit" },
        { buttonId: "withdraw-button", contentId: "withdraw" },
        { buttonId: "inter-button", contentId: "inter" },
        { buttonId: "intra-button", contentId: "intra" },
        { buttonId: "statement-button", contentId: "statement" }
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
    
    $(document).ready(function(){
        var forms = [
            { formId: 'depositForm', messageId: 'depositMessage' },
            { formId: 'withdrawForm', messageId: 'withdrawMessage' },
            { formId: 'interForm', messageId: 'interMessage' },
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


</script>
</html>