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
    <title>Account</title>
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
                    <button type="submit" id="view-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-person-vcard-fill"
                            viewBox="0 0 16 16">
                            <path
                                d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5M9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8m1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5m-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96q.04-.245.04-.5M7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0" />
                        </svg><br>
                        view Account
                    </button>
            </li>
            <li class="nav-item">
                <div class="nav-link nav-linka text-center">
                    <button type="submit" id="add-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-bag-plus-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0M8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5z" />
                        </svg><br>
                        Add new Account
                    </button>
                </div>
            </li>
            <li class="nav-item">
                <div class="nav-link nav-linka text-center">
                    <button type="submit" id="edit-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path
                                d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
                                d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                        </svg><br>
                        Account Handling
                    </button>
                </div>
            </li>
            <li class="nav-item">
                <div class="nav-link nav-linka text-center">
                    <button type="submit" id="status-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-file-lock2-fill"
                            viewBox="0 0 16 16">
                            <path d="M7 6a1 1 0 0 1 2 0v1H7z" />
                            <path
                                d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2m-2 6v1.076c.54.166 1 .597 1 1.224v2.4c0 .816-.781 1.3-1.5 1.3h-3c-.719 0-1.5-.484-1.5-1.3V8.3c0-.627.46-1.058 1-1.224V6a2 2 0 1 1 4 0" />
                        </svg><br>
                        Inactive Accounts
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
                            <form id="customer" class="text-center forms" method="post" style="padding-top: 5%;">

                                <label for="accountno">Customer Id:</label>
                                <input class="textbox" type="text" id="id" name="id"
                                    placeholder="Enter  Customer Id"><br>
                                <label for="accountno">Branch Id:</label>
                                <input class="textbox" type="text" id="ifsc" name="ifsc" placeholder="Enter IFSC">
                                <label for="accountno">Account Type:</label>
                                <select id="acctypeountno" name="type" class="textbox">
                                    <option value="Savings">Savings</option>
                                    <option value="Salary">Salary</option>
                                    <option value="Current">Current</option>
                                </select><br>
                                <label for="accountno">Initial Balance:</label>
                                <input class="textbox" type="text" id="balance" name="balance"
                                    placeholder="Enter Balance(Optional)"><br>
                                <label for="msg">The Account Number will be Auto generated once you add these
                                    details.</label>
                                <br>
                                <button type="submit">Add</button>
                            </form>
                        </div>
                        <div class="col-6" style="background-image: url(newaccount.png); background-size: cover;
                background-position: center;">
                        </div>
                    </div>
                </div>
                <div id="view" style="display: block;">
                    <div id="statement">
                        <div class="justify-content-center row" style="display: flex;">
                            <h3>Accounts</h3>
                            <div class="duration">
                                <form id="duration" class="durationform" style="justify-content: end;gap: 3%;">
                                    Account Number
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
                                            <th scope="col">Account Number</th>
                                            <th scope="col">User Id</th>
                                            <th scope="col">Branch IFSC</th>
                                            <th scope="col">View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>1000000000000023</td>
                                            <td>10</td>
                                            <td>SDFG12345</td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>1000000000000023</td>
                                            <td>10</td>
                                            <td>SDFG12345</td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="pagination">
                            <div class="left">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                                    class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                                </svg>
                            </div>
                            <div class="right">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                                    class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
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
                                <form id="duration" class="durationform" style="justify-content: end;gap: 3%;">
                                    Account Number
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
                                            <th scope="col">Account Number</th>
                                            <th scope="col">User Id</th>
                                            <th scope="col">Branch IFSC</th>
                                            <th scope="col">Balance</th>
                                            <th scope="col">View</th>
                                            <th scope="col">Deposit</th>
                                            <th scope="col">Withdraw</th>
                                            <th scope="col">Transfer</th>
                                            <th scope="col">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>1000000000000023</td>
                                            <td>10</td>
                                            <td>SDFG12345</td>
                                            <td>20000</td>
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
                                                    data-bs-target="#staticBackdropDeposit">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-piggy-bank-fill"
                                                        viewBox="0 0 16 16">
                                                        <path
                                                            d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069q0-.218-.02-.431c.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a1 1 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.74.74 0 0 0-.375.562c-.024.243.082.48.32.654a2 2 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595m7.173 3.876a.6.6 0 0 1-.098.21l-.044-.025c-.146-.09-.157-.175-.152-.223a.24.24 0 0 1 .117-.173c.049-.027.08-.021.113.012a.2.2 0 0 1 .064.199m-8.999-.65a.5.5 0 1 1-.276-.96A7.6 7.6 0 0 1 7.964 3.5c.763 0 1.497.11 2.18.315a.5.5 0 1 1-.287.958A6.6 6.6 0 0 0 7.964 4.5c-.64 0-1.255.09-1.826.254ZM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0" />
                                                    </svg>
                                                </button></td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdropWithdraw">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
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
                                                </button></td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdropTransfer">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-arrow-left-right"
                                                        viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd"
                                                            d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5m14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5" />
                                                    </svg>
                                                </button></td>
                                            <td><button class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                                                        width="30" height="30" fill="currentColor"
                                                        class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                        <path
                                                            d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                                                    </svg></button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>1000000000000023</td>
                                            <td>10</td>
                                            <td>SDFG12345</td>
                                            <td>20000</td>
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
                                                    data-bs-target="#staticBackdropDeposit">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-piggy-bank-fill"
                                                        viewBox="0 0 16 16">
                                                        <path
                                                            d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069q0-.218-.02-.431c.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a1 1 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.74.74 0 0 0-.375.562c-.024.243.082.48.32.654a2 2 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595m7.173 3.876a.6.6 0 0 1-.098.21l-.044-.025c-.146-.09-.157-.175-.152-.223a.24.24 0 0 1 .117-.173c.049-.027.08-.021.113.012a.2.2 0 0 1 .064.199m-8.999-.65a.5.5 0 1 1-.276-.96A7.6 7.6 0 0 1 7.964 3.5c.763 0 1.497.11 2.18.315a.5.5 0 1 1-.287.958A6.6 6.6 0 0 0 7.964 4.5c-.64 0-1.255.09-1.826.254ZM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0" />
                                                    </svg>
                                                </button></td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdropWithdraw">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
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
                                                </button></td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdropTransfer">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-arrow-left-right"
                                                        viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd"
                                                            d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5m14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5" />
                                                    </svg>
                                                </button></td>
                                            <td><button class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                                                        width="30" height="30" fill="currentColor"
                                                        class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                        <path
                                                            d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                                                    </svg></button></td>
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
                                <form id="duration" class="durationform" style="justify-content: end;gap: 3%;">
                                    SearchBy
                                    <select id="accountno" name="accountno" class="textbox">
                                        <option value="Deleted">Deleted</option>
                                        <option value="Blocked">Blocked</option>
                                    </select>
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
                                            <th scope="col">Account Number</th>
                                            <th scope="col">User Id</th>
                                            <th scope="col">Branch IFSC</th>
                                            <th scope="col">View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>1000000000000023</td>
                                            <td>10</td>
                                            <td>SDFG12345</td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>1000000000000023</td>
                                            <td>10</td>
                                            <td>SDFG12345</td>
                                            <td> <button type="button" class="btn link-button" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="pagination">
                            <div class="left">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                                    class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                                </svg>
                            </div>
                            <div class="right">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                                    class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
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
                            <form id="deposit" class="text-center forms" method="post" style="padding-top: 5%;">
                                <label for="accountno">Account Number:</label>
                                <select id="accountno" name="accountno" class="textbox">
                                    <option value="1000000000000012">1000000000000012</option>
                                    <option value="1000000000000016">1000000000000016</option>
                                </select>
                                <label style="padding-top: 2%;" for="duration">Duration:</label>
                                <select id="duration" name="duration" class="textbox">
                                    <option value="1">1 Month</option>
                                    <option value="2">2 Months</option>
                                    <option value="3">3 Months</option>
                                </select><br>
                                <button type="submit">Take Statement</button>
                            </form>
                        </div>
                        <div class="col-6" style="background-image: url(statement.png); background-size: cover;
                background-position: center;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- Details of the user for view in view profile and edit options -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered .modal-dialog-custom" style="max-width:50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Account Detail</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="profile"
                        style="background-color: white; border-radius: 2%; padding-left: 0;padding-top: 4%; margin-bottom: 2%;">
                        <div class="profile-img" style="display: flex; align-items: end;">
                            <img src="accountprofile.png" alt="Profile Picture" class="account-profile-picture"
                                style="margin-right: 20px; padding-bottom: 5%;">
                            <table>
                                <tbody>
                                    <tr>
                                        <th scope="col">
                                            <p>Name</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p> P.Ramanujam</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>Mobile Number</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p> 9090909990</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>Email</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p> Rama@gmail.com</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>Date of Birth</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p> 12-09-1999</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>Address</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p> 123,VadaPalani,Chennai-678901</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>Aadhar Number</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p> 1234567890123456</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>PAN Number</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p>ASDFG12345</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <p>User Status</p>
                                        </th>
                                        <td>:</td>
                                        <td>
                                            <p>Active</p>
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

    <!--A modal for deposit  -->
    <div class="modal fade" id="staticBackdropDeposit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered .modal-dialog-custom" style="max-width:50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Deposit Amount</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="deposit">
                        <div class="d-flex  transactionbox row">
                            <h3>You are one step ahead to Deposit</h3>
                            <div class="col-5 align-items-center" style="padding-top: 4%;">
                                <form id="deposit" class="text-center forms" method="post" style="padding-top: 5%;">
                                    <label for="accountno">Account Number:</label>
                                    <select id="accountno" name="accountno" class="textbox">
                                        <option value="1000000000000012">1000000000000012</option>
                                        <option value="1000000000000016">1000000000000016</option>
                                    </select>
                                    <label style="padding-top: 2%;" for="amount">Amount:</label>
                                    <input class="textbox" type="text" id="amount" name="amount"
                                        placeholder="Enter Amount" required><br>
                                    <button type="submit">Deposit</button>
                                </form>
                            </div>
                            <div class="col-6" style="background-image: url(deposit.png); background-size: cover;
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
    <!--A modal for Withdraw  -->
    <div class="modal fade" id="staticBackdropWithdraw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered .modal-dialog-custom" style="max-width:50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Withdraw Amount</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="withdraw">
                        <div class="d-flex justify-content-center transactionbox row">
                            <h3>You are one step ahead to Withdraw</h3>
                            <div class="col-5 align-items-center" style="padding-top: 4%;">
                                <form id="withdraw" class="text-center forms" method="post" style="padding-top: 5%;">
                                    <label for="accountno">Account Number:</label>
                                    <select id="accountno" name="accountno" class="textbox">
                                        <option value="1000000000000012">1000000000000012</option>
                                        <option value="1000000000000016">1000000000000016</option>
                                    </select>
                                    <label style="padding-top: 2%;" for="amount">Amount:</label>
                                    <input class="textbox" type="text" id="amount" name="amount"
                                        placeholder="Enter Amount" required><br>
                                    <label style="padding-top: 2%;" for="accountno">Remarks:</label>
                                    <input class="textbox" type="text" id="remark" name="remark"
                                        placeholder="Enter Remarks" required><br>
                                    <button type="submit">Withdraw</button>
                                </form>
                            </div>
                            <div class="col-6" style="background-image: url(withdraw.png); background-size: cover;
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
    <!--A modal for Transfer  -->
    <div class="modal fade" id="staticBackdropTransfer" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered .modal-dialog-custom" style="max-width:50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Transfer Amount</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="inter">
                        <div class="d-flex justify-content-center transactionbox row">
                            <h3>You are one step ahead to Transfer</h3>
                            <div class="col-5 align-items-center" style="padding-top: 4%;">
                                <form id="withdraw" class="text-center forms" method="post" style="padding-top: 5%;">
                                    <label for="accountno">Account Number:</label>
                                    <select id="accountno" name="accountno" class="textbox">
                                        <option value="1000000000000012">1000000000000012</option>
                                        <option value="1000000000000016">1000000000000016</option>
                                    </select>
                                    <label style="padding-top: 2%;" for="recaccount">Receiver Account Number:</label>
                                    <input class="textbox" type="text" id="recaccount" name="recaccount"
                                        placeholder="Enter Receiver Account Number" required><br>
                                    <label style="padding-top: 2%;" for="amount">Amount:</label>
                                    <input class="textbox" type="text" id="amount" name="amount"
                                        placeholder="Enter Amount" required><br>
                                    <label style="padding-top: 2%;" for="accountno">Remarks:</label>
                                    <input class="textbox" type="text" id="remark" name="remark"
                                        placeholder="Enter Remarks" required><br>
                                    <button type="submit">Transfer</button>
                                </form>
                            </div>
                            <div class="col-6" style="background-image: url(transfer.jpg); background-size: cover;
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