package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import cacheLogics.RedisCache;
import customLogics.AccountFunctions;
import customLogics.AuditLoggerFunctions;
import customLogics.BranchFunction;
import customLogics.CustomerFunctions;
import customLogics.EmployeeFunctions;
import customLogics.TransactionFunctions;
import customLogics.UserFunctions;
import dbLogics.AuditLoggerOperation;
import details.AccountDetails;
import details.AuditLoggerDetails;
import details.BranchDetails;
import details.CustomerDetails;
import details.EmployeeDetails;
import details.TransactionDetails;
import utility.Common;
import utility.InvalidInputException;

public class GlobalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HttpSession userSession;

	private RedisCache cache = RedisCache.getInstance();

	private UserFunctions userFunctions = new UserFunctions();
	private CustomerFunctions customerFunctions = new CustomerFunctions();
	private EmployeeFunctions employeeFunctions = new EmployeeFunctions();
	private AccountFunctions accountFunctions = new AccountFunctions();
	private TransactionFunctions transactionFunctions = new TransactionFunctions();
	private BranchFunction branchFunctions = new BranchFunction();
	private AuditLoggerFunctions auditLoggerFunctions = new AuditLoggerFunctions();

	public GlobalController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession currentUser = request.getSession(false);
		int loggedUserId = (int) currentUser.getAttribute("UserId");
		String page = request.getParameter("page");
		if (page == null || page.equals("")) {
			page = "home";
		}
		try {
			if (page.equals("home") && currentUser.getAttribute("UserType").equals("1")) {
				page = "EmployeeHome";
			}
			switch (page) {
			case "home": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Home.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "account": {
				AccountDetails accountDetails = new AccountDetails();
				String customerName = "";
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				if (!accountRecords.isEmpty()) {
					customerName = userFunctions.getSinglRecord("Name", loggedUserId);
					List<TransactionDetails> latestTransaction = transactionFunctions.getLatestDetails(10, 0,
							loggedUserId, "Id");
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
					request.setAttribute("latestTransaction", latestTransaction);
					request.setAttribute("pageno", 1);
					RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
					homeDispatcher.forward(request, response);
				}
			}
				break;
			case "branch": {
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				String firstbranchIfsc = "";
				long firstAccountnumber = 0l;
				for (Entry individualAccounts : accountRecords.entrySet()) {
					firstbranchIfsc = ((AccountDetails) individualAccounts.getValue()).getBranchId();
					firstAccountnumber = (long) ((AccountDetails) individualAccounts.getValue()).getAccountNumber();
					break;
				}
				List<BranchDetails> branches = branchFunctions.getBranchDetails(firstbranchIfsc);
				BranchDetails branchDetails = branches.get(0);
				String managerName = userFunctions.getSinglRecord("Name", branchDetails.getManagerId());
				String contact = userFunctions.getSinglRecord("Mobile", branchDetails.getManagerId());
				request.setAttribute("accounts", accountRecords);
				request.setAttribute("branch", branchDetails);
				request.setAttribute("managerName", managerName);
				request.setAttribute("contact", contact);
				request.setAttribute("selectedAccountNumber", firstAccountnumber);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Branch.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "complaint": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Complaint.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "profile": {
				CustomerDetails customerDetails = new CustomerDetails();
				customerDetails.setId(loggedUserId);
				CustomerDetails profile = cache.getCustomer(loggedUserId);
				request.setAttribute("profile", profile);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Profile.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "logout": {
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId("0");
				auditDetails.setDescription("Logged Out");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				auditDetails.setStatus("Success");
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				currentUser.invalidate();
				response.sendRedirect("/BankOfCBE/");
			}
				break;
			case "EmployeeHome": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/EmployeeHome.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeUser": {
				String statusActive = "1", statusInactive = "0";
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				request.setAttribute("isAdmin", isAdmin);
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 11, 0);
				request.setAttribute("user", activeUsers);
				request.setAttribute("editUser", activeUsers);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 11, 0);
				request.setAttribute("Inactiveuser", inactiveUsers);
				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeAccount": {
				String activeStatus = "1", inActiveStatus = "0";
				Map<Long, AccountDetails> accounts = accountFunctions.getAccounts(11, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(11, 0, inActiveStatus);
				request.setAttribute("accounts", accounts);
				request.setAttribute("editAccounts", accounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);
				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeTransfer": {
				List<TransactionDetails> latestTransaction = transactionFunctions.getLatestDetails(11, 0, 0,
						"TransactionTime");
				request.setAttribute("latestTransactions", latestTransaction);
				request.setAttribute("pageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeBranch": {
				List<BranchDetails> branches = branchFunctions.getBranchDetails(10, 0);
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				request.setAttribute("isAdmin", isAdmin);
				request.setAttribute("branches", branches);
				request.setAttribute("pageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/BranchManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeProfile": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/EmployeeProfile.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			}
		} catch (InvalidInputException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession currentUser = request.getSession(false);
		try {
			String formType = request.getParameter("formType");
			switch (formType) {
			case "login": {
				String userId = request.getParameter("id");
				String password = request.getParameter("password");
				Map<String, Object> blockedUser = userFunctions.blockedDetails(Integer.parseInt(userId));
				if ((int) blockedUser.get("InvalidAttempts") == 2) {
					request.setAttribute("message", "User Blocked! Your Login Attempts Exceeded");
					RequestDispatcher loginDispatcher = request.getRequestDispatcher("index.jsp");
					loginDispatcher.forward(request, response);
				}
				if (userId.matches("^\\d+$")) {
					if (password != null) {
						boolean isAuth = userFunctions.login(Integer.parseInt(userId), password);
						if (isAuth) {
							userSession = request.getSession(true);
							String userType = userFunctions.getSinglRecord("Type", Integer.parseInt(userId));
							userSession.setAttribute("UserId", Integer.parseInt(userId));
							userSession.setAttribute("UserType", userType);
							AuditLoggerDetails auditDetails = new AuditLoggerDetails();
							auditDetails.setUserId(Integer.parseInt(userId));
							auditDetails.setTargetId("0");
							auditDetails.setDescription("Logged in");
							auditDetails.setModifiedTime(System.currentTimeMillis());
							auditDetails.setStatus("Success");
							auditLoggerFunctions.insertAuditRecord(auditDetails);
							if (userType != null) {
								if (userType.equals("0")) {
									RequestDispatcher homeDispatcher = request
											.getRequestDispatcher("/WEB-INF/Home.jsp");
									homeDispatcher.forward(request, response);
								} else if (userType.equals("1")) {
									int isAdmin = employeeFunctions.getAdmin(Integer.parseInt(userId));
									userSession.setAttribute("isAdmin", isAdmin);
									String activeStatus = "1", inActiveStatus = "0";
									Map<Long, AccountDetails> accounts = accountFunctions.getAccounts(11, 0,
											activeStatus);
									Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(11, 0,
											inActiveStatus);
									request.setAttribute("accounts", accounts);
									request.setAttribute("editAccounts", accounts);
									request.setAttribute("inactiveAccounts", inactiveAccounts);
									request.setAttribute("pageno", 1);
									request.setAttribute("editPageno", 1);
									request.setAttribute("deletePageno", 1);
									RequestDispatcher homeDispatcher = request
											.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
									homeDispatcher.forward(request, response);
								}
							}
						} else {
							userFunctions.addBlockedUser(Integer.parseInt(userId),
									(int) blockedUser.get("InvalidAttempts") + 1, System.currentTimeMillis());
							userFunctions.blockedDetails(Integer.parseInt(userId));
							if ((int) blockedUser.get("InvalidAttempts") == 2) {
								request.setAttribute("message", "User Blocked! Your Login Attempts Exceeded.");
								RequestDispatcher loginDispatcher = request.getRequestDispatcher("index.jsp");
								loginDispatcher.forward(request, response);
							}
							String errorMessage = "Invalid UserId or Password . You have only "
									+ (2 - (int) blockedUser.get("InvalidAttempts") + " Attempts Remaining");
							request.setAttribute("message", errorMessage);
							RequestDispatcher loginDispatcher = request.getRequestDispatcher("index.jsp");
							loginDispatcher.forward(request, response);
						}
					}
				}
			}
				break;
			}
			int loggedUserId = 0;
			if (currentUser == null || currentUser != null && currentUser.getAttribute("UserId") == null) {
				request.setAttribute("message", "Session Expired");
				RequestDispatcher loginDispatcher = request.getRequestDispatcher("index.jsp");
				loginDispatcher.forward(request, response);
			}
			if (currentUser.getAttribute("UserId") != null) {
				loggedUserId = (int) currentUser.getAttribute("UserId");
			}
			switch (formType) {
			case "transactionDuration": {
				String fromDate = (request.getParameter("from"));
				String toDate = (request.getParameter("to"));
				String customerName = "";
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				if (!accountRecords.isEmpty()) {
					customerName = userFunctions.getSinglRecord("Name", loggedUserId);

					Map<String, Object> conditions = new HashMap<String, Object>();
					conditions.put("From", Common.dateToMilli(fromDate));
					conditions.put("To", Common.dateToMilli(toDate) + 86400000);
					conditions.put("SortColumn", "Id");
					conditions.put("Sort", "desc");
					conditions.put("limit", 11);
					conditions.put("offset", (Integer.parseInt(request.getParameter("pageno")) * 10) - 10);
					TransactionDetails transactionDetails = new TransactionDetails();
					transactionDetails.setUserId(loggedUserId);
					List<TransactionDetails> latestTransaction = transactionFunctions.getCustomDetails(
							transactionDetails, new ArrayList<String>(Arrays.asList("*")), conditions);
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
					request.setAttribute("latestTransaction", latestTransaction);
					request.setAttribute("pageno", (Integer.parseInt(request.getParameter("pageno"))));
					RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
					homeDispatcher.forward(request, response);
				}

			}
				break;
			case "transactionUserPagination": {
				List<TransactionDetails> latestTransaction = transactionFunctions.getLatestDetails(11,
						Integer.parseInt(request.getParameter("offset")), 0, "TransactionTime");
				request.setAttribute("latestTransactions", latestTransaction);
				request.setAttribute("pageno", Integer.parseInt(request.getParameter("pageno")));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "deposit": {
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long amount = Long.parseLong(request.getParameter("amount"));
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(accountFunctions.getSingleRecord("UserId", accountNumber).toString());
				auditDetails.setDescription("Deposit");
				long transactionId = transactionFunctions.newDeposite(accountNumber, amount);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (transactionId > 0) {
					responseData.put("status", true);
					responseData.put("message", "Deposit was Successful");
					auditDetails.setStatus("Success");
				} else {
					responseData.put("status", false);
					responseData.put("message", "Deposit was Unsuccessful.Please Try again!");
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("pageno", 1);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "withdraw": {
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long amount = Long.parseLong(request.getParameter("amount"));
				String description = request.getParameter("remark");
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(accountFunctions.getSingleRecord("UserId", accountNumber).toString());
				auditDetails.setDescription("Withdraw");
				long transactionId = transactionFunctions.newWithdraw(accountNumber, amount, description);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (transactionId > 0) {
					responseData.put("status", true);
					responseData.put("message", "Withdraw was Successful");
					auditDetails.setStatus("Success");
				} else {
					responseData.put("status", false);
					responseData.put("message", "Withdraw was Unsuccessful.Please Try again!");
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("pageno", 1);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());

			}
				break;
			case "interTransfer": {
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long recAccountNumber = Long.parseLong(request.getParameter("recaccount"));
				long amount = Long.parseLong(request.getParameter("amount"));
				String description = request.getParameter("remark");
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(accountFunctions.getSingleRecord("UserId", accountNumber).toString());
				auditDetails.setDescription("IntraBank Transfer");
				Map<String, Integer> records = transactionFunctions.newTransferWithinBank(accountNumber,
						recAccountNumber, amount, description);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (records.size() > 0) {
					responseData.put("status", true);
					responseData.put("message", "Transfer was Successful");
					auditDetails.setStatus("Success");
				} else {
					responseData.put("status", false);
					responseData.put("message", "Transfer was Unsuccessful.Please Try again!");
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("pageno", 1);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());

			}
				break;
			case "intraTransfer": {
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long recAccountNumber = Long.parseLong(request.getParameter("recaccount"));
				long amount = Long.parseLong(request.getParameter("amount"));
				String ifsc = request.getParameter("ifsc");
				String description = request.getParameter("remark");
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(accountFunctions.getSingleRecord("UserId", accountNumber).toString());
				auditDetails.setDescription("InterBank Transfer");
				long transactionId = transactionFunctions.newTransferOtherBank(accountNumber, recAccountNumber, amount,
						description, ifsc);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (transactionId > 0) {
					responseData.put("status", true);
					responseData.put("message", "Transfer was Successful");
					auditDetails.setStatus("Success");
				} else {
					responseData.put("status", false);
					responseData.put("message", "Transfer was Unsuccessful.Please Try again!");
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("pageno", 1);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "BranchForm": {
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				String firstbranchIfsc = "";
				for (Entry individualAccounts : accountRecords.entrySet()) {
					if (request.getParameter("accountno").equals(individualAccounts.getKey().toString())) {
						firstbranchIfsc = ((AccountDetails) individualAccounts.getValue()).getBranchId();
						break;
					}
				}
				List<BranchDetails> branches = branchFunctions.getBranchDetails(firstbranchIfsc);
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId("0");
				auditDetails.setDescription("Searched BranchDetail");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (!branches.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				BranchDetails branchDetails = branches.get(0);
				String managerName = userFunctions.getSinglRecord("Name", branchDetails.getManagerId());
				String contact = userFunctions.getSinglRecord("Mobile", branchDetails.getManagerId());
				request.setAttribute("accounts", accountRecords);
				request.setAttribute("branch", branchDetails);
				request.setAttribute("managerName", managerName);
				request.setAttribute("contact", contact);
				request.setAttribute("selectedAccountNumber", request.getParameter("accountno"));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Branch.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "none": {
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId("0");
				auditDetails.setDescription("Complaint Reposrting");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				auditDetails.setStatus("Success");
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("message", "Complaint filed");
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Complaint.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "searchUser": {
				String statusActive = "1", statusInactive = "0";
				CustomerDetails customerDetails = new CustomerDetails();
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Searched User");
				customerDetails.setId(Integer.parseInt(request.getParameter("id")));
				Map<Integer, CustomerDetails> searchedUser = customerFunctions.getCustomerProfile(customerDetails, "0");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (!searchedUser.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 10, 0);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 10, 0);
				request.setAttribute("user", searchedUser);
				request.setAttribute("editUser", activeUsers);
				request.setAttribute("Inactiveuser", inactiveUsers);
				request.setAttribute("Inactiveuser", inactiveUsers);

				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				request.setAttribute("isAdmin", isAdmin);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "searchCustomerInEdit": {
				String statusActive = "1", statusInactive = "0";
				CustomerDetails customerDetails = new CustomerDetails();
				customerDetails.setId(Integer.parseInt(request.getParameter("id")));
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Searched User");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				Map<Integer, CustomerDetails> searchedUser = customerFunctions.getCustomerProfile(customerDetails, "0");
				if (!searchedUser.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 10, 0);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 10, 0);
				request.setAttribute("user", activeUsers);
				request.setAttribute("editUser", searchedUser);
				request.setAttribute("Inactiveuser", inactiveUsers);
				request.setAttribute("Inactiveuser", inactiveUsers);

				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				request.setAttribute("isAdmin", isAdmin);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "newCustomer": {
				JSONObject responseData = new JSONObject();
				if (customerFunctions.checkPanAadhar(request.getParameter("pan"),
						request.getParameter("aadhar")) == 1) {
					responseData.put("status", false);
					responseData.put("message", "Pan Or Aadhar is already Present");
					response.setContentType("application/json");
					response.getWriter().write(responseData.toString());
					break;
				}
				CustomerDetails customerDetails = new CustomerDetails();
				customerDetails.setName(request.getParameter("name"));
				customerDetails.setDOB(Common.dateToMilli(request.getParameter("dob")));
				customerDetails.setMobile(request.getParameter("mobile"));
				customerDetails.setEmail(request.getParameter("email"));
				customerDetails.setGender(request.getParameter("gender"));
				customerDetails.setType("0");
				customerDetails.setAddress(request.getParameter("address"));
				customerDetails.setAadhar(request.getParameter("aadhar"));
				customerDetails.setPan(request.getParameter("pan"));
				customerDetails.setPassword("Welcome@123");
				customerDetails.setCreatedTime(System.currentTimeMillis());
				customerDetails.setModifiedBy(loggedUserId);
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Inserted New Customer");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				int result = customerFunctions
						.addCustomer(new ArrayList<CustomerDetails>(Arrays.asList(customerDetails)));
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
					responseData.put("message", "Customer Added Successfully");
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "Customer Addition was Unsuccessfull.Please Try Again");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "newEmployee": {
				JSONObject responseData = new JSONObject();
				if ((branchFunctions.getBranchDetails(request.getParameter("branch")).size()) == 0) {
					responseData.put("status", false);
					responseData.put("message", "No Branch found.Please Try Again with valid branch Id");
					response.setContentType("application/json");
					response.getWriter().write(responseData.toString());
					break;
				}
				EmployeeDetails employeeDetails = new EmployeeDetails();
				employeeDetails.setName(request.getParameter("name"));
				employeeDetails.setDOB(Common.dateToMilli(request.getParameter("dob")));
				employeeDetails.setMobile(request.getParameter("mobile"));
				employeeDetails.setEmail(request.getParameter("email"));
				employeeDetails.setGender(request.getParameter("gender"));
				employeeDetails.setType("1");
				employeeDetails.setBranch(request.getParameter("branch"));
				employeeDetails.setAdmin((request.getParameter("admin").equals("1")) ? true : false);
				employeeDetails.setPassword("Welcome@123");
				employeeDetails.setCreatedTime(System.currentTimeMillis());
				employeeDetails.setModifiedBy(loggedUserId);
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Inserted New Employee");
				auditDetails.setModifiedTime(System.currentTimeMillis());
				int result = employeeFunctions
						.addEmployee(new ArrayList<EmployeeDetails>(Arrays.asList(employeeDetails)));
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
					responseData.put("message", "Customer Added Successfully");
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "Customer Addition was Unsuccessfull.Please Try Again");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;

			case "editUser": {
				CustomerDetails customerDetails = new CustomerDetails();
				customerDetails.setName(request.getParameter("name"));
				customerDetails.setDOB(Common.dateToMilli(request.getParameter("dob")));
				customerDetails.setMobile(request.getParameter("mobile"));
				customerDetails.setEmail(request.getParameter("email"));
				customerDetails.setGender(request.getParameter("gender"));
				customerDetails.setAddress(request.getParameter("address"));
				customerDetails.setAadhar(request.getParameter("aadhar"));
				customerDetails.setPan(request.getParameter("pan"));
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("userid"));
				auditDetails.setDescription("Edit Customer");
				int result = customerFunctions.updateCustomer(Integer.parseInt(request.getParameter("userid")),
						customerDetails);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "blockUser": {
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Block Customer");
				int result = customerFunctions.updateStatus(Integer.parseInt(request.getParameter("id")),
						request.getParameter("status"));
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
					responseData.put("message", "The Status of the User Changed");
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "The Status of the User was not Changed.Please Try Again");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "deleteUser": {
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Delete Customer");
				customerFunctions.deleteUser(Integer.parseInt(request.getParameter("id")));
				auditDetails.setModifiedTime(System.currentTimeMillis());
				auditDetails.setStatus("Success");
				auditLoggerFunctions.insertAuditRecord(auditDetails);
			}
				break;
			case "fetchAccount": {
				System.out.println("ahubcs");
				String activeStatus = "1", inActiveStatus = "0";
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(Integer.parseInt(request.getParameter("id")));
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Searched Account");
				Map<Long, AccountDetails> searchedAccounts = accountFunctions.accountDetails(accountDetails);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (!searchedAccounts.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(10, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(10, 0, inActiveStatus);
				request.setAttribute("accounts", searchedAccounts);
				request.setAttribute("editAccounts", editAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);

				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "fetchEditAccount": {
				String activeStatus = "1", inActiveStatus = "0";
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(Integer.parseInt(request.getParameter("id")));
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Searched Account");
				Map<Long, AccountDetails> searchedAccounts = accountFunctions.accountDetails(accountDetails);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (!searchedAccounts.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(10, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(10, 0, inActiveStatus);
				request.setAttribute("accounts", editAccounts);
				request.setAttribute("editAccounts", searchedAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);

				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "newAccount": {
				JSONObject responseData = new JSONObject();
				if (userFunctions.getSinglRecord("Id", Integer.parseInt(request.getParameter("id"))) == null) {
					responseData.put("status", false);
					responseData.put("message", "No user found.Please Try Again with valid User Id");
					response.setContentType("application/json");
					response.getWriter().write(responseData.toString());
					break;
				}
				if ((branchFunctions.getBranchDetails(request.getParameter("ifsc")).size()) == 0) {
					responseData.put("status", false);
					responseData.put("message", "No Branch found.Please Try Again with valid branch Id");
					response.setContentType("application/json");
					response.getWriter().write(responseData.toString());
					break;
				}
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(Integer.parseInt(request.getParameter("id")));
				accountDetails.setBranchId(request.getParameter("ifsc"));
				accountDetails.setAccountType(request.getParameter("type"));
				accountDetails.setCreatedTime(System.currentTimeMillis());
				accountDetails.setModifiedBy(loggedUserId);
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("id"));
				auditDetails.setDescription("Creating New Account");
				if (!request.getParameter("balance").isEmpty()) {
					accountDetails.setBalance(Long.parseLong(request.getParameter("balance")));
				}
				int result = accountFunctions.addAccount(accountDetails);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
					responseData.put("message", "Account Created Successfully");
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "Account Creation was Unsuccessfully.Please Try Again");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "blockAccount": {
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("accountno"));
				auditDetails.setDescription(
						(request.getParameter("status").equals("1")) ? "Unblocking Account" : "Blocking Account");
				int result = accountFunctions.updateColoumn("Status", request.getParameter("status"),
						Long.parseLong(request.getParameter("accountno")));
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
					responseData.put("status", true);
					responseData.put("message", "The Status of the Account Changed");
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "The Status of the Account was not Changed.Please Try Again");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "searchTransactionForm": {
				long fromdate = 0l, todate = 0l;
				int userId = 0;
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId("0");
				auditDetails.setDescription("Searching Transaction Details");
				if (!request.getParameter("customerId").equals("")) {
					userId = Integer.parseInt(request.getParameter("customerId"));
					auditDetails.setTargetId(request.getParameter("id"));
				}
				if (!request.getParameter("fromDate").equals("")) {
					fromdate = Common.dateToMilli((request.getParameter("fromDate")));
				}
				if (!request.getParameter("toDate").equals("")) {
					todate = Common.dateToMilli((request.getParameter("toDate"))) + 86400000 - 1;
				}
				TransactionDetails transactioDetails = new TransactionDetails();
				if (!request.getParameter("transactionType").equals("all")) {
					transactioDetails.setTranactionType(request.getParameter("transactionType"));
				}
				transactioDetails.setUserId(userId);
				Map<String, Object> duration = new HashMap<String, Object>();
				duration.put("From", fromdate);
				duration.put("To", todate);
				duration.put("SortColumn", "TransactionTime");
				duration.put("Sort", request.getParameter("sortBy"));
				duration.put("limit", 11);
				duration.put("offset", (Integer.parseInt(request.getParameter("pageno")) * 10) - 10);
				List<TransactionDetails> record = transactionFunctions.getCustomDetails(transactioDetails,
						new ArrayList<String>(Arrays.asList("*")), duration);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (!record.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("latestTransactions", record);
				request.setAttribute("pageno", (Integer.parseInt(request.getParameter("pageno"))));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "editBranch": {
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("branchid"));
				auditDetails.setDescription("Editing Branch");
				BranchDetails branchDetails = new BranchDetails();
				branchDetails.setAddress(request.getParameter("address"));
				branchDetails.setManagerId(Integer.parseInt(request.getParameter("managerid")));
				branchDetails.setPhoneNumber(Long.parseLong(request.getParameter("contact")));
				int result = branchFunctions.updateRecord(branchDetails,
						Integer.parseInt(request.getParameter("branchid")));
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "branchSearch": {
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(request.getParameter("branchid"));
				auditDetails.setDescription("Search Branch");
				List<BranchDetails> branches = branchFunctions.getBranchDetails(request.getParameter("branchid"));
				auditDetails.setModifiedTime(System.currentTimeMillis());
				if (!branches.isEmpty()) {
					auditDetails.setStatus("Success");
				} else {
					auditDetails.setStatus("Failed");
				}
				auditDetails.setModifiedTime(System.currentTimeMillis());
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				request.setAttribute("branches", branches);
				request.setAttribute("pageno", 1);
				request.setAttribute("isAdmin", isAdmin);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/BranchManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "transferPagination": {
				List<TransactionDetails> latestTransaction = transactionFunctions.getLatestDetails(11,
						Integer.parseInt(request.getParameter("offset")), 0, "TransactionTime");
				request.setAttribute("latestTransactions", latestTransaction);
				request.setAttribute("pageno", Integer.parseInt(request.getParameter("pageno")));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "userPagination": {
				String statusActive = "1", statusInactive = "0";
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 11,
						Integer.parseInt(request.getParameter("offset")));
				request.setAttribute("user", activeUsers);
				request.setAttribute("editUser", activeUsers);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 11, 0);
				request.setAttribute("Inactiveuser", inactiveUsers);
				request.setAttribute("pageno", Integer.parseInt(request.getParameter("pageno")));
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				request.setAttribute("isAdmin", isAdmin);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "userEditPagination": {
				String statusActive = "1", statusInactive = "0";
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 11, 0);
				request.setAttribute("user", activeUsers);
				Map<Integer, CustomerDetails> editUsers = userFunctions.getUsers(statusActive, false, 11,
						Integer.parseInt(request.getParameter("offset")));
				request.setAttribute("editUser", editUsers);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 11, 0);
				request.setAttribute("Inactiveuser", inactiveUsers);
				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", Integer.parseInt(request.getParameter("pageno")));
				request.setAttribute("deletePageno", 1);
				String isAdmin = currentUser.getAttribute("isAdmin") + "";
				request.setAttribute("isAdmin", isAdmin);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "accountPagination": {
				String activeStatus = "1", inActiveStatus = "0";
				Map<Long, AccountDetails> accounts = accountFunctions.getAccounts(11,
						Integer.parseInt(request.getParameter("offset")), activeStatus);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(11, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(11, 0, inActiveStatus);
				request.setAttribute("accounts", accounts);
				request.setAttribute("editAccounts", editAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);
				request.setAttribute("pageno", Integer.parseInt(request.getParameter("pageno")));
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "accountEditPagination": {
				String activeStatus = "1", inActiveStatus = "0";
				Map<Long, AccountDetails> accounts = accountFunctions.getAccounts(11, 0, activeStatus);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(11,
						Integer.parseInt(request.getParameter("offset")), activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(11, 0, inActiveStatus);
				request.setAttribute("accounts", accounts);
				request.setAttribute("editAccounts", editAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);

				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", Integer.parseInt(request.getParameter("pageno")));
				request.setAttribute("deletePageno", 1);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;

			case "accountDeletePagination": {
				String activeStatus = "1", inActiveStatus = "0";
				Map<Long, AccountDetails> accounts = accountFunctions.getAccounts(11, 0, activeStatus);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(11, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(11,
						Integer.parseInt(request.getParameter("offset")), inActiveStatus);
				request.setAttribute("accounts", accounts);
				request.setAttribute("editAccounts", editAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);

				request.setAttribute("pageno", 1);
				request.setAttribute("editPageno", 1);
				request.setAttribute("deletePageno", Integer.parseInt(request.getParameter("pageno")));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "branchPagination": {
				List<BranchDetails> branches = branchFunctions.getBranchDetails(10,
						Integer.parseInt(request.getParameter("offset")));
				request.setAttribute("branches", branches);
				request.setAttribute("pageno", Integer.parseInt(request.getParameter("pageno")));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/BranchManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "changePassword": {
				String originalPassword = userFunctions.getSinglRecord("Password", loggedUserId);
				String oldpassword = Common.encryptPassword(request.getParameter("oldPassword"));
				int result = 0;
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(loggedUserId + "");
				auditDetails.setDescription("Change Password");
				JSONObject responseData = new JSONObject();
				if (originalPassword.equals(oldpassword)) {
					result = userFunctions.coloumnUpdation("Password", request.getParameter("newPassword"),
							loggedUserId);
					auditDetails.setModifiedTime(System.currentTimeMillis());
					if (result > 0) {
						auditDetails.setStatus("Success");
						responseData.put("status", true);
						responseData.put("message", "Updates Successfully");
					} else {
						auditDetails.setStatus("Failed");
						responseData.put("status", false);
						responseData.put("message", "Failed");
					}
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "Password Does't Match");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "newBranch": {
				BranchDetails branchDetails = new BranchDetails();
				AuditLoggerDetails auditDetails = new AuditLoggerDetails();
				auditDetails.setUserId(loggedUserId);
				auditDetails.setTargetId(loggedUserId + "");
				auditDetails.setDescription("Add Branch");
				branchDetails.setIfscCode(request.getParameter("ifsc"));
				branchDetails.setAddress(request.getParameter("address"));
				branchDetails.setManagerId(Integer.parseInt(request.getParameter("manager")));
				branchDetails.setPhoneNumber(Long.parseLong(request.getParameter("contact")));
				branchDetails.setCreatedTime(System.currentTimeMillis());
				branchDetails.setModifiedBy(loggedUserId);
				int result = branchFunctions.addBranch(branchDetails);
				auditDetails.setModifiedTime(System.currentTimeMillis());
				JSONObject responseData = new JSONObject();
				if (result > 0) {
					auditDetails.setStatus("Success");
					responseData.put("status", true);
					responseData.put("message", "Updates Successfully");
				} else {
					auditDetails.setStatus("Failed");
					responseData.put("status", false);
					responseData.put("message", "Failed");
				}
				auditLoggerFunctions.insertAuditRecord(auditDetails);
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (InvalidInputException e) {
			e.printStackTrace();
		}
	}
}
