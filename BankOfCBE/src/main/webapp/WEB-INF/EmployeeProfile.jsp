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
	<jsp:include page="EmployeeNavbar.jsp"></jsp:include>

	<div class="container">
		<h1 style="text-align: center; padding-top: 3%; padding-bottom: 2%;">Your
			Profile</h1>
		<div class="profile"
			style="background-color: white; border-radius: 2%; padding-left: 0; margin-bottom: 2%;">
			<div class="profile-img" style="display: flex;">
				<img src="Images/profile.jpg" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; padding-bottom: 5%;">
				<table>
					<tbody>
						<tr>
							<th scope="col">
								<p>Name</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>Ram</p>
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
								<p>9090909990</p>
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
								<p>Ram@gmail.com</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Date of Birth</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>12-09-1999</p>
							</td>
						</tr>
						<tr>
							<th scope="col">
								<p>Branch IFSC Code</p>
							</th>
							<td>
								<p>:</p>
							</td>
							<td>
								<p>ASDFG12345</p>
							</td>
						</tr>
						</tr>
					</tbody>
				</table>
				<div
					style="display: flex; flex-direction: column; justify-content: flex-end; margin-right: 2%; margin-bottom: 2%;">
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
						Change Password
					</button>
					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered .modal-dialog-custom"
							style="max-width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Change
										Password</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div id="withdraw">
										<div class="d-flex justify-content-center transactionbox row">
											<h3>Update Your Password</h3>
											<div class="col-5 align-items-center"
												style="padding-top: 4%;">
												<form id="chang-password" class="text-center forms" method="post"
													style="padding-top: 5%;">
													<input name="formType" value="changePassword"
														type="hidden"> 
													<label for="accountno">Old Password:</label> <input
														class="textbox" type="password" id="name"
														name="oldPassword"> <label for="accountno">New
														Password:</label> <input class="textbox" type="password"
														id="mobile" name="newPassword"><br>
													<button type="submit">Submit</button>
												</form>
												<p class="message" id="editmessage"></p>
											</div>
											<div class="col-6"
												style="background-image: url(Images/password.jpg); background-size: cover; background-position: center;">
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
	(document).getElementsByClassName("profile-nav")[0].classList
			.add("selected-link");
	
	 $(document).ready(function(){
	      	$("#chang-password").submit(function(event){
	      		event.preventDefault();
	      		var formdata = $(this).serialize();
	      		console.log(formdata);
	      		$.ajax({
	      			type:'POST',
	      			url:'home',
	      			data:formdata,
	      			success:function(response){
	      				if (response.error) {
	                      	(document).getElementById("editmessage").innerHTML = 'Something went wrong, Try Again';
	                      	(document).getElementById("editmessage").style.color = 'red';
	                      } else {
	                    	  if (response.status){
		                      	document.getElementById("chang-password").reset();
		                      	(document).getElementById("editmessage").innerHTML = 'successful';
		                      	(document).getElementById("editmessage").style.color = 'green';
	                    	  }
	                    	  else{
	                    			document.getElementById("chang-password").reset();
			                      	(document).getElementById("editmessage").innerHTML = response.message;
			                      	(document).getElementById("editmessage").style.color = 'red';
	                    	  }
	                      }
	      			},
	                  error: function(xhr, status, error) {
	                  	window.alert("Something Went Wrong, Try after sometime....");
	                  }
	      		});
	      	});
	      }); 
</script>

</html>