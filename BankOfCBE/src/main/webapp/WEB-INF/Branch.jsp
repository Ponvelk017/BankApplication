<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="details.AccountDetails"%>
<%@ page import="details.BranchDetails"%>
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
<title>Home</title>
<style>
</style>
</head>

<body>

	<jsp:include page="Navbar.jsp"></jsp:include>
	<%
	Map<Long, AccountDetails> accounts = new HashMap<Long, AccountDetails>();
	if (request.getAttribute("accounts") != null) {
		accounts = (Map<Long, AccountDetails>) request.getAttribute("accounts");
	}
	%>
	<div class="container">
		<h1 class="branchDet" style="padding-bottom: 0">Branch Details</h1>
		<%
		if (accounts.size() > 1) {
		%>
		<div class="account-branch"
			style="display: flex; flex-direction: column; align-items: end;">
			<h4>Account's Branch Details</h4>
			<form id="BranchForm" action="SessionFilter" method="post">
				<input name="formType" value="BranchForm" type="hidden"> <select
					id="accountno" name="accountno" class="textbox">
					<%
					for (Entry individualAccounts : accounts.entrySet()) {
					%>
					<option value="<%=individualAccounts.getKey()%>"><%=individualAccounts.getKey()%></option>
					<%
					}
					%>
				</select>
				<button class="link-button" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
						fill="black" class="bi bi-arrow-down-square-fill"
						viewBox="0 0 16 16">
                                        <path
							d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                    </svg>
				</button>
			</form>
		</div>
		<%
		}
		%>
		<div class="profile-det">
			<div class="profile-img" style="display: flex; align-items: end;">
				<img src="Images/branch.jpg" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; padding-bottom: 8%; border-radius: 0;">
				<table>
					<%
					BranchDetails branchDetails = new BranchDetails();
					if (request.getAttribute("branch") != null) {
						branchDetails = (BranchDetails) request.getAttribute("branch");
					}
					%>
					<tbody>
						<tr>
							<th scope="col">
								<p>Branch Id</p>
							</th>
							<td>:</td>
							<td>
								<p><%=branchDetails.getId()%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Accoutn Number</p>
							</th>
							<td>:</td>
							<td>
								<p><%=request.getAttribute("selectedAccountNumber")%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Branch IFSC Code</p>
							</th>
							<td>:</td>
							<td>
								<p><%=branchDetails.getIfscCode()%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Address</p>
							</th>
							<td>:</td>
							<td>
								<p><%=branchDetails.getAddress()%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Contact Number</p>
							</th>
							<td>:</td>
							<td>
								<p><%=branchDetails.getPhoneNumber()%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Manager Name</p>
							</th>
							<td>:</td>
							<td>
								<p><%=request.getAttribute("managerName")%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Manager Contact</p>
							</th>
							<td>:</td>
							<td>
								<p><%=request.getAttribute("contact")%></p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Timing</p>
							</th>
							<td>:</td>
							<td>
								<p>9:00 AM To 4:30 PM</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Lunch Break</p>
							</th>
							<td>:</td>
							<td>
								<p>1:00 Pm to 2.00 Pm</p>
							</td>
						<tr>
							<td>In case of any Queries feel free to Ask our Employees</td>
						</tr>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
	(document).getElementsByClassName("branch-sel")[0].classList
			.add("selected-link");
</script>
</html>