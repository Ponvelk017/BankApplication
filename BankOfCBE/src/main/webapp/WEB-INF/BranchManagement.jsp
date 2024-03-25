<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="stylesheet" href="HomeStyle.css" />
    <link rel="stylesheet" href="UserManagement.css" />
    <title>Branch</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="logo.png" style="width: 22%; height: 22%;" class="d-inline-block align-top" alt="Bank Logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse flex-wrap" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link active" href="EmployeeHome.html"><svg xmlns="http://www.w3.org/2000/svg"
                            width="30" height="30" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
                            <path
                                d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z" />
                        </svg> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserManagement.html"><svg xmlns="http://www.w3.org/2000/svg" width="30"
                            height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                            <path
                                d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
                        </svg> Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AccountManagement.html"><svg xmlns="http://www.w3.org/2000/svg" width="30"
                            height="30" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                            <path
                                d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5" />
                            <path
                                d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z" />
                        </svg>Accounts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="TransactionManagement.html"><svg xmlns="http://www.w3.org/2000/svg"
                            width="30" height="30" fill="currentColor" class="bi bi-arrow-left-right"
                            viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5m14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5" />
                        </svg>Transactions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="BranchManagement.html"><svg xmlns="http://www.w3.org/2000/svg" width="30"
                            height="30" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                            <path
                                d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6" />
                        </svg>Branchs<a>
                </li>
                <li class="nav-item profile">
                    <a class="nav-link" href="EmployeeProfile.html"><svg xmlns="http://www.w3.org/2000/svg" width="30"
                            height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                            <path fill-rule="evenodd"
                                d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
                        </svg>Profile</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- sidebar of the account page-->

    <nav class="col-md-2  bg-light sidebar">
        <ul class="nav flex-column">
            <li class="nav-item">
                <div class="nav-link nav-linka text-center">
                    <button type="submit" id="edit-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-house-gear-fill"
                            viewBox="0 0 16 16">
                            <path
                                d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708z" />
                            <path
                                d="M11.07 9.047a1.5 1.5 0 0 0-1.742.26l-.02.021a1.5 1.5 0 0 0-.261 1.742 1.5 1.5 0 0 0 0 2.86 1.5 1.5 0 0 0-.12 1.07H3.5A1.5 1.5 0 0 1 2 13.5V9.293l6-6 4.724 4.724a1.5 1.5 0 0 0-1.654 1.03" />
                            <path
                                d="m13.158 9.608-.043-.148c-.181-.613-1.049-.613-1.23 0l-.043.148a.64.64 0 0 1-.921.382l-.136-.074c-.561-.306-1.175.308-.87.869l.075.136a.64.64 0 0 1-.382.92l-.148.045c-.613.18-.613 1.048 0 1.229l.148.043a.64.64 0 0 1 .382.921l-.074.136c-.306.561.308 1.175.869.87l.136-.075a.64.64 0 0 1 .92.382l.045.149c.18.612 1.048.612 1.229 0l.043-.15a.64.64 0 0 1 .921-.38l.136.074c.561.305 1.175-.309.87-.87l-.075-.136a.64.64 0 0 1 .382-.92l.149-.044c.612-.181.612-1.049 0-1.23l-.15-.043a.64.64 0 0 1-.38-.921l.074-.136c.305-.561-.309-1.175-.87-.87l-.136.075a.64.64 0 0 1-.92-.382ZM12.5 14a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3" />
                        </svg><br>
                        Edit Branch
                    </button>
            </li>
            <li class="nav-item">
                <div class="nav-link nav-linka text-center">
                    <button type="submit" id="add-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-house-add-fill" viewBox="0 0 16 16">
                            <path
                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 1 1-1 0v-1h-1a.5.5 0 1 1 0-1h1v-1a.5.5 0 0 1 1 0" />
                            <path
                                d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z" />
                            <path d="m8 3.293 4.712 4.712A4.5 4.5 0 0 0 8.758 15H3.5A1.5 1.5 0 0 1 2 13.5V9.293z" />
                        </svg><br>
                        Add new Branch
                    </button>
                </div>
            </li>
        </ul>
    </nav>
    <div class="container account">
        <div class="tempp" style="padding-bottom: 1%;">
            <div class="container transaction">
                <div id="addcustomer" style="display: none;">
                    <h3>Add New Branch</h3>
                    <div class="d-flex  transactionbox row">
                        <div id="customer" class="col-5 align-items-center">
                            <form id="customer" class="text-center forms" method="post" style="padding-top: 5%;">
                                <label for="ifsc">IFSC Code:</label>
                                <input class="textbox" type="text" id="ifsc" name="ifsc" placeholder="Enter IFSC Code">
                                <label for="accountno">Address:</label>
                                <input class="textbox" type="text" id="address" name="address"
                                    placeholder="1Enter DOB"><br>
                                <label for="accountno">Manager Id:</label>
                                <input class="textbox" type="text" id="managerid" name="managerid"
                                    placeholder="Enter  Mobile Number"><br>
                                <label for="accountno">Contact Number:</label>
                                <input class="textbox" type="text" id="contact" name="contact"
                                    placeholder="Enter Contact Number"><br>
                                <button type="submit">Add Branch</button>
                            </form>
                        </div>
                        <div class="col-6" style="background-image: url(accountdetails.png); background-size: cover;
                background-position: center;">
                        </div>
                    </div>
                </div>
                <div id="edit" style="display: block;">
                    <div id="statement">
                        <div class="justify-content-center row" style="display: flex;">
                            <h3>Edit Branch</h3>
                            <div class="duration">
                                <form id="duration" class="durationform" style="justify-content: end;gap: 3%;">
                                    Branch Id
                                    <input style="width: 30%;" name="id" type="number">
                                    <button class="link-button" type="submit"><svg xmlns="http://www.w3.org/2000/svg"
                                            width="35" height="35" fill="currentColor"
                                            class="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0" />
                                        </svg></button>
                                </form>
                            </div>
                            <div class=" latesttransaction ">
                                <table class="table table-striped" style="padding-top: 5px; font-size: large;">
                                    <thead>
                                        <tr>
                                            <th scope="col">S.No</th>
                                            <th scope="col">Branch Id</th>
                                            <th scope="col">IFSC Code</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Manager Id</th>
                                            <th scope="col">Contact Number</th>
                                            <th scope="col">View</th>
                                            <th scope="col">Edit</th>
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
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </button></td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdropedit">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-pencil-square"
                                                        viewBox="0 0 16 16">
                                                        <path
                                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                        <path fill-rule="evenodd"
                                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
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
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </button></td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdropedit">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-pencil-square"
                                                        viewBox="0 0 16 16">
                                                        <path
                                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                        <path fill-rule="evenodd"
                                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
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

                <!-- Details of the user for view in view profile of branch  -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered .modal-dialog-custom" style="max-width:50%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">User Detail</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="profile"
                                    style="background-color: white; border-radius: 2%; padding-left: 0; margin-bottom: 2%;">
                                    <div class="profile-img" style="display: flex;">
                                        <img src="branchprofile.png" alt="Profile Picture" class="profile-picture"
                                            style="margin-right: 20px; padding-bottom: 5%;width: 50%;">
                                        <table>
                                            <tbody>
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
                                                        <p>Address</p>
                                                    </th>
                                                    <td>:</td>
                                                    <td>
                                                        <p> 123,Vadapalani,chennai-678901</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">
                                                        <p>Manager Id</p>
                                                    </th>
                                                    <td>:</td>
                                                    <td>
                                                        <p>12</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="col">
                                                        <p>Contact Number</p>
                                                    </th>
                                                    <td>:</td>
                                                    <td>
                                                        <p> 1234567890</p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Details of the user for view abd edit in view profile and edit options  -->
                <div class="modal fade" id="staticBackdropedit" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" style="max-width:50%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">
                                    Branch</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="edit-profile" style="background-color: white; padding-top: 3%;">
                                    <div class="d-flex  transactionbox row">
                                        <h3>Edit Customer Details</h3>
                                        <div class="col-5 align-items-center" style="padding-top: 4%;">
                                            <form id="deposit" class="text-center forms" method="post"
                                                style="padding-top: 5%;">
                                                <label for="accountno">Address:</label>
                                                <input class="textbox" type="text" id="address" name="address"
                                                    placeholder="131,vadapalani,chennai-678901">
                                                <label for="ManagerId">Manager Id:</label>
                                                <input class="textbox" type="text" id="managerid" name="managerid"
                                                    placeholder="13"><br>
                                                <label for="accountno">Contact Number:</label>
                                                <input class="textbox" type="text" id="contact" name="contact"
                                                    placeholder="1234567890"><br>
                                                <button type="submit">Submit</button>
                                            </form>
                                        </div>
                                        <div class="col-6" style="background-image: url(branchedit.png); background-size: cover;
                background-position: center;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
<script>
    var buttonContentPairs = [
        { buttonId: "add-button", contentId: "addcustomer" },
        { buttonId: "edit-button", contentId: "edit" },
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
</script>

</script>

</html>