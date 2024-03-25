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
    <title>Home</title>
    <style>

    </style>
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

    <div class="container">
        <h1 style="text-align: center; padding-top: 3%;padding-bottom: 2%;">Your Profile</h1>
        <div class="profile" style="background-color: white; border-radius: 2%; padding-left: 0; margin-bottom: 2%;">
            <div class="profile-img" style="display: flex;">
                <img src="profile.jpg" alt="Profile Picture" class="profile-picture"
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
                                <p> Ram</p>
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
                                <p> 9090909990</p>
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
                                <p> Ram@gmail.com</p>
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
                                <p> 12-09-1999</p>
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
                                <p> ASDFG12345</p>
                            </td>
                        </tr>
                        </tr>
                    </tbody>
                </table>
                <div
                    style="display: flex; flex-direction: column; justify-content: flex-end; margin-right: 2%;margin-bottom: 2%;">
                    <button type="submit" id="edit-button" class="link-button"><svg xmlns="http://www.w3.org/2000/svg"
                            width="50" height="50" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path
                                d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
                                d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                        </svg>
                        Edit
                    </button>

                </div>

            </div>
        </div>
        <div id="edit-profile" style="display: none; background-color: white; padding-top: 3%;">
            <div class="d-flex  transactionbox row">
                <h3>Edit your Details</h3>
                <div class="col-5 align-items-center" style="padding-top: 4%;">
                    <form id="deposit" class="text-center forms" method="post" style="padding-top: 5%;">
                        <label for="accountno">Name:</label>
                        <input class="textbox" type="text" id="name" name="name" placeholder="Ram">
                        <label for="accountno">Mobile:</label>
                        <input class="textbox" type="text" id="mobile" name="mobile" placeholder="909090909090"><br>
                        <label for="accountno">Email:</label>
                        <input class="textbox" type="email" id="email" name="email" placeholder="Ram@gmail.com"><br>
                        <label for="accountno">Date Of Birth:</label>
                        <input class="textbox" type="text" id="dob" name="dob" placeholder="13-09-1999"><br>
                        <label for="accountno">Aadhar Number:</label>
                        <input class="textbox" type="text" id="aadhar" name="aadhar" placeholder="1234567890123456"><br>
                        <label for="accountno">Pan Number:</label>
                        <input class="textbox" type="text" id="pan" name="pan" placeholder="ASDFG12345"><br>
                        <button type="submit">Submit</button>
                    </form>
                </div>
                <div class="col-6" style="background-image: url(edit.png); background-size: cover;
        background-position: center;">
                </div>
            </div>
        </div>
    </div>

    </div>
    </div>
</body>
<script>
    document
        .getElementById("edit-button")
        .addEventListener(
            'click',
            function () {
                document.getElementById('edit-profile').style.display = (document
                    .getElementById('edit-profile').style.display === 'none') ? 'block'
                    : 'none';
            }); 
</script>

</html>