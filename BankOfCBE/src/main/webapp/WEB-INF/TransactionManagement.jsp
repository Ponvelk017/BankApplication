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
    <title>Transaction</title>
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
    <div class="container account">
        <div class="conditionData">
            <h2 style="padding: 1%;">You can Customize your Data</h2>
            <div>
                <form id="duration" class="conditionform ">
                    <label class="labletext" for="customerId">CustomerId</label>
                    <input class="inputtag" id="customerId" name="customerId" type="number">
                    <label class="labletext" for="fromDate">From</label>
                    <input class="inputtag" id="fromDate" name="fromDate" type="date">
                    <label class="labletext" for="toDate">To</label>
                    <input class="inputtag" id="toDate" name="toDate" type="date">
                    <label class="labletext" for="sortBy">SortBy</label>
                    <select id="sortBy" name="sortBy" class="inputtextbox">
                        <option value="desc">Latest</option>
                        <option value="asce">Earliest</option>
                    </select>
                    <label class="labletext" for="transactionType">Transaction type</label>
                    <select id="transactionType" name="transactionType" class="inputtextbox">
                        <option value="deposit">Debit</option>
                        <option value="withdraw">Credit</option>
                    </select>
                    <div class="inputbut">
                        <button type="submit">Get Records</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="container transaction">
            <div id="view">
                <div id="statement">
                    <div class="justify-content-center row">
                        <h3>User Profiles</h3>
                        <div class=" latesttransaction ">
                            <table class="table table-striped" style="padding-top: 5px; font-size: large;">
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
                                    <tr>
                                        <td>1</td>
                                        <td>1001</td>
                                        <td>12</td>
                                        <td>10000000000000012</td>
                                        <td>-</td>
                                        <td>Debit</td>
                                        <td>12-03-2024 12:00 PM</td>
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
                                        <td>1001</td>
                                        <td>12</td>
                                        <td>10000000000000012</td>
                                        <td>-</td>
                                        <td>Debit</td>
                                        <td>12-03-2024 12:00 PM</td>
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
                    <!--A modal for view transaction history  -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered .modal-dialog-custom" style="max-width:50%;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Transaction Details</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="profile"
                                        style="background-color: white; border-radius: 2%; padding-left: 0;padding-top: 4%; margin-bottom: 2%;">
                                        <div class="profile-img" style="display: flex; align-items: end;">
                                            <img src="transfer.png" alt="Profile Picture" class="profile-picture"
                                                style="margin-right: 20px; padding-bottom: 5%; width: 50%;">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Transaction Id</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> 10002</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>User Id</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> 12</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Sender Account</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> 10000000000000023</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Receiver Account</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> 10000000000002323</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Type</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p>Debit</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Date and Time</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> 12-03-2024 12:00 PM</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Status</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> Success</p>
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
                                                            <p>Amount</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p>1000</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col">
                                                            <p>Closing Balance</p>
                                                        </th>
                                                        <td>:</td>
                                                        <td>
                                                            <p> 1200000</p>
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
        </div>
    </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</script>

</html>