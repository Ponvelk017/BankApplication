<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Account</title>
</head>

<body>
	<jsp:include page="EmployeeNavbar.jsp"></jsp:include>
	<div class="container account">
		<div class="tempp" style="padding-bottom: 1%;">
			<h2>Complaints</h2>
			<div class="container transaction">
				<div id="edit">
					<div id="statement">
						<div class="justify-content-center row" style="display: flex;">
							<h3>Issues faced by customer</h3>
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
											<th scope="col">Complaint Id</th>
											<th scope="col">User Id</th>
											<th scope="col">Branch IFSC</th>
											<th scope="col">Issue Type</th>
											<th scope="col">Description</th>
											<th scope="col">View</th>
											<th scope="col">Resolve</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>1023</td>
											<td>10</td>
											<td>SDFG12345</td>
											<td>Accounts</td>
											<td>Problem faced during transaction</td>
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
													data-bs-toggle="modal"
													data-bs-target="#staticBackdropDeposit">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor"
														class="bi bi-exclamation-octagon-fill" viewBox="0 0 16 16">
                                                        <path
															d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                                    </svg>
												</button>
											</td>
										</tr>
										<tr>
											<td>1</td>
											<td>1023</td>
											<td>10</td>
											<td>SDFG12345</td>
											<td>Accounts</td>
											<td>Problem faced during transaction</td>
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
													data-bs-toggle="modal"
													data-bs-target="#staticBackdropDeposit">
													<svg xmlns="http://www.w3.org/2000/svg" width="30"
														height="30" fill="currentColor"
														class="bi bi-exclamation-octagon-fill" viewBox="0 0 16 16">
                                                        <path
															d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                                    </svg>
												</button>
											</td>
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
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Complaint
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
											<p>Complaint Id</p>
										</th>
										<td>:</td>
										<td>
											<p>10001</p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>User Id</p>
										</th>
										<td>:</td>
										<td>
											<p>12</p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>IFSC Code</p>
										</th>
										<td>:</td>
										<td>
											<p>ASDFG12345</p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Issue Type</p>
										</th>
										<td>:</td>
										<td>
											<p>Account</p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Description</p>
										</th>
										<td>:</td>
										<td>
											<p>Problem faced during transaction</p>
										</td>
									</tr>
									<tr>
										<th scope="col">
											<p>Resolved</p>
										</th>
										<td>:</td>
										<td>
											<p>No</p>
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
								<form id="deposit" class="text-center forms" method="post"
									style="padding-top: 5%;">
									<label for="accountno">Account Number:</label> <select
										id="accountno" name="accountno" class="textbox">
										<option value="1000000000000012">1000000000000012</option>
										<option value="1000000000000016">1000000000000016</option>
									</select> <label style="padding-top: 2%;" for="amount">Amount:</label> <input
										class="textbox" type="text" id="amount" name="amount"
										placeholder="Enter Amount" required><br>
									<button type="submit">Deposit</button>
								</form>
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
								<form id="withdraw" class="text-center forms" method="post"
									style="padding-top: 5%;">
									<label for="accountno">Account Number:</label> <select
										id="accountno" name="accountno" class="textbox">
										<option value="1000000000000012">1000000000000012</option>
										<option value="1000000000000016">1000000000000016</option>
									</select> <label style="padding-top: 2%;" for="amount">Amount:</label> <input
										class="textbox" type="text" id="amount" name="amount"
										placeholder="Enter Amount" required><br> <label
										style="padding-top: 2%;" for="accountno">Remarks:</label> <input
										class="textbox" type="text" id="remark" name="remark"
										placeholder="Enter Remarks" required><br>
									<button type="submit">Withdraw</button>
								</form>
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
								<form id="withdraw" class="text-center forms" method="post"
									style="padding-top: 5%;">
									<label for="accountno">Account Number:</label> <select
										id="accountno" name="accountno" class="textbox">
										<option value="1000000000000012">1000000000000012</option>
										<option value="1000000000000016">1000000000000016</option>
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

</body>
<script>
    var buttonContentPairs = [
        { buttonId: "add-button", contentId: "addaccount" },
        { buttonId: "view-button", contentId: "view" },
        { buttonId: "edit-button", contentId: "edit" },
        { buttonId: "status-button", contentId: "status" }
    ];

    buttonContentPairs.forEach(pair => {
        var button = document.getElementById(pair.buttonId);
        var content = document.getElementById(pair.contentId);

        button.addEventListener('click', function () {
            console.log("hi");
            if (content.style.display !== 'block') {
                buttonContentPairs.forEach(otherPair => {
                    var otherContent = document.getElementById(otherPair.contentId);
                    if (otherContent.style.display === 'block' && otherPair.contentId !== pair.contentId) {
                        otherContent.style.display = 'none';
                    }
                });
                content.style.display = 'block';
            }
        });
    });
</script>

</script>

</html>