<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="details.TransactionDetails"%>
<%@ page import="details.AccountDetails"%>
<%@ page import="utility.Common"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

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
<title>Transaction</title>
</head>

<body>
	<jsp:include page="EmployeeNavbar.jsp"></jsp:include>
	<div class="container account">
		<div class="conditionData">
			<h2 style="padding: 1%;">Customize Data</h2>
			<div>
				<form id="transactionForm" action="home" class="conditionform"
					method="post">
					<input name="formType" value="searchTransactionForm" type="hidden">
					<input name="pageno" id="pageno"
						value="<%=request.getAttribute("pageno")%>" type="hidden">
					<label class="labletext" for="customerId">CustomerId</label> <input
						class="inputtag" id="customerId" name="customerId" type="number"
						value="${param.customerId}"> <label class="labletext"
						for="fromDate">From</label> <input class="inputtag" id="fromDate"
						name="fromDate" type="date" value="${param.fromDate}"> <label
						class="labletext" for="toDate">To</label>
					<%
					LocalDate currentDate = LocalDate.now();
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					%>
					<input class="inputtag" id="toDate" name="toDate" type="date"
						max="<%=currentDate.format(formatter)%>" value="${param.toDate}">
					<label class="labletext" for="sortBy">SortBy</label> <select
						id="sortBy" name="sortBy" class="inputtextbox"
						value="${param.sortBy}">
						<option value="desc">Latest</option>
						<option value="asc">Earliest</option>
					</select> <label class="labletext" for="transactionType">Transaction
						type</label> <select id="transactionType" name="transactionType"
						class="inputtextbox" value="${param.transactionType}">
						<option value="all">All</option>
						<option value="deposit">Debit</option>
						<option value="withdraw">Credit</option>
					</select>
					<div class="inputbut">
						<button type="submit" onclick="submitTransaction()">Get
							Records</button>
					</div>
				</form>
			</div>
		</div>

		<div class="container transaction">
			<div id="view">
				<div id="statement">
					<div class="justify-content-center row">
						<h3>Transactions</h3>
						<div class=" latesttransaction ">
							<table class="table table-striped"
								style="padding-top: 5px; font-size: large;">
								<thead>
									<tr>
										<th scope="col">S.No</th>
										<th scope="col">Transaction Id</th>
										<th scope="col">User Id</th>
										<th scope="col">Sender Accoutn</th>
										<th scope="col">Receiver Account</th>
										<th scope="col">Type</th>
										<th scope="col">Date & Time</th>
										<th scope="col">View</th>
									</tr>
								</thead>
								<tbody>
									<%
									int sno = (((int) (request.getAttribute("pageno")) - 1) * 10) + 1;
									if (request.getAttribute("latestTransactions") != null) {
										int loop = 1;
										List<TransactionDetails> transactionRecords = (List<TransactionDetails>) request.getAttribute("latestTransactions");
										for (TransactionDetails individualTransaction : transactionRecords) {
											if (loop++ == 11) {
										break;
											}
											JSONObject transactionJson = new JSONObject();
											transactionJson.put("Id", individualTransaction.getId());
											transactionJson.put("AccountNumber", individualTransaction.getAccountId());
											transactionJson.put("TransactionAccount", individualTransaction.getTransactionAccountId());
											transactionJson.put("UserId", individualTransaction.getUserId());
											transactionJson.put("TransactionTime", individualTransaction.getTime());
											transactionJson.put("TransactionType", individualTransaction.getTranactionType());
											transactionJson.put("Description", individualTransaction.getDescription());
											transactionJson.put("Status", individualTransaction.getStatus());
											transactionJson.put("Amount", individualTransaction.getAmount());
											transactionJson.put("ClosingBalance", individualTransaction.getClosingBalance());
											transactionJson.put("IFSC", individualTransaction.getIFSCCode());
									%>
									<tr>
										<td><%=sno++%></td>
										<td><%=individualTransaction.getId()%></td>
										<td><%=individualTransaction.getUserId()%></td>
										<td><%=individualTransaction.getAccountId()%></td>
										<td><%=individualTransaction.getTransactionAccountId()%></td>
										<td><%=individualTransaction.getTransactionType()%></td>
										<td>
											<%
											String date = Common.milliToDate(individualTransaction.getTransactionTime());
											%> <%=date%>
										</td>
										<td>
											<button type="button" class="btn link-button view-details"
												data-account-id='<%=transactionJson.toString()%>'
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
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<!--A modal for view transaction history  -->
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered .modal-dialog-custom"
							style="max-width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Transaction
										Details</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="profile"
										style="background-color: white; border-radius: 2%; padding-left: 0; padding-top: 4%; margin-bottom: 2%;">
										<div class="profile-img"
											style="display: flex; align-items: end;">
											<img src="Images/transfer.png" alt="Profile Picture"
												class="profile-picture"
												style="margin-right: 20px; padding-bottom: 5%; width: 50%;">
											<table>
												<tbody>
													<tr>
														<th scope="col">
															<p>Transaction Id</p>
														</th>
														<td>:</td>
														<td>
															<p id="transaction-id"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>User Id</p>
														</th>
														<td>:</td>
														<td>
															<p id="user-id"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Sender Account</p>
														</th>
														<td>:</td>
														<td>
															<p id="account-number"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Receiver Account</p>
														</th>
														<td>:</td>
														<td>
															<p id="receiver-account"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Type</p>
														</th>
														<td>:</td>
														<td>
															<p id="type"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Date and Time</p>
														</th>
														<td>:</td>
														<td>
															<p id="time"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Status</p>
														</th>
														<td>:</td>
														<td>
															<p id="status"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>IFSC Code</p>
														</th>
														<td>:</td>
														<td>
															<p id="ifsc"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Amount</p>
														</th>
														<td>:</td>
														<td>
															<p id="amount"></p>
														</td>
													</tr>
													<tr>
														<th scope="col">
															<p>Closing Balance</p>
														</th>
														<td>:</td>
														<td>
															<p id="closing-balance"></p>
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
					<%

					%>
					<div class="pagination">
						<div class="left">
							<button type="submit" class="btn link-button" 	onclick="submitTransactionPrevious()"
								<%if ((int) (request.getAttribute("pageno")) <= 1) {%> disabled
								<%}%>>
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="currentColor" class="bi bi-arrow-left-circle-fill"
									viewBox="0 0 16 16">
                                <path
										d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                            </svg>
							</button>
						</div>
						<div class="right">

							<button type="submit" class="btn link-button"
								onclick="submitTransactionNext()"
								<%if (((List<TransactionDetails>) request.getAttribute("latestTransactions")).size() >= 10) {%>
								idsabled <%}%>>
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="currentColor" class="bi bi-arrow-right-circle-fill"
									viewBox="0 0 16 16">
                                <path
										d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                            </svg>
							</button>
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

</body>
<script>
(document).getElementsByClassName("transaction-nav")[0].classList
.add("selected-link");

	//view modal for account
	document.querySelectorAll('.view-details').forEach(button => {
	    button.addEventListener('click', function () {
	    	 const transactionDetails = JSON.parse(this.getAttribute('data-account-id'));
		    	console.log(transactionDetails.Type);
	    	 document.getElementById('transaction-id').innerHTML = transactionDetails.Id;
	    	 document.getElementById('user-id').innerHTML = transactionDetails.UserId;
	    	 document.getElementById('account-number').innerHTML = transactionDetails.AccountNumber;
	    	 document.getElementById('receiver-account').innerHTML = transactionDetails.TransactionAccount;
	    	 document.getElementById('type').innerHTML = transactionDetails.TransactionType;
     	 	 var date =new Date(transactionDetails.TransactionTime);
  			 var year = date.getFullYear();
  			 var month = ('0' + (date.getMonth() + 1)).slice(-2); 
  			 var day = ('0' + date.getDate()).slice(-2);
  			 var formattedDate = year + '-' + month + '-' + day;
	    	 document.getElementById('time').innerHTML = formattedDate;
	    	 document.getElementById('status').innerHTML = ((transactionDetails.Status)=='1')?'Active':'InActive';
	    	 document.getElementById('amount').innerHTML = transactionDetails.Amount;
	    	 document.getElementById('closing-balance').innerHTML = transactionDetails.ClosingBalance;
	    	 document.getElementById('ifsc').innerHTML = transactionDetails.IFSC;
	    });
	});
	
	function submitTransaction(){
		var form = document.getElementById("transactionForm");
		form.submit()
	}
	
	function submitTransactionNext(){
		document.getElementById("pageno").value = +document.getElementById("pageno").value+1;
		var form = document.getElementById("transactionForm");
		form.submit()
	}
	
	function submitTransactionPrevious(){
		document.getElementById("pageno").value = +document.getElementById("pageno").value-1;
		var form = document.getElementById("transactionForm");
		form.submit()
	}
	
	
</script>
</html>