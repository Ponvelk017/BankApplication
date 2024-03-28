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

import cacheLogics.RedisCache;
import customLogics.AccountFunctions;
import customLogics.BranchFunction;
import customLogics.CustomerFunctions;
import customLogics.EmployeeFunctions;
import customLogics.TransactionFunctions;
import customLogics.UserFunctions;
import details.AccountDetails;
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
				BranchDetails branchDetails = branchFunctions.getBranchDetails(firstbranchIfsc);
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
				currentUser.invalidate();
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeHome": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/EmployeeHome.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeUser": {
				String statusActive = "1", statusInactive = "0";
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 10, 0);
				request.setAttribute("user", activeUsers);
				request.setAttribute("editUser", activeUsers);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 10, 0);
				request.setAttribute("Inactiveuser", inactiveUsers);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeAccount": {
				String activeStatus = "1", inActiveStatus = "0";
				Map<Long, AccountDetails> accounts = accountFunctions.getAccounts(10, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(10, 0, inActiveStatus);
				request.setAttribute("accounts", accounts);
				request.setAttribute("editAccounts", accounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);
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
				request.setAttribute("branches", branches);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/BranchManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeProfile": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Profile.jsp");
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
		int loggedUserId = 0;
		if (currentUser.getAttributeNames().hasMoreElements()) {
			loggedUserId = (int) currentUser.getAttribute("UserId");
		}
		try {
			String formType = request.getParameter("formType");
			switch (formType) {
			case "login": {
				String userId = request.getParameter("id");
				String password = request.getParameter("password");
				userSession = request.getSession(true);
				if (userId.matches("^\\d+$")) {
					if (password != null) {
						boolean isAuth = userFunctions.login(Integer.parseInt(userId), password);
						if (isAuth) {
							String userType = userFunctions.getSinglRecord("Type", Integer.parseInt(userId));
							if (userType != null) {
								userSession.setAttribute("UserId", Integer.parseInt(userId));
								if (userType.equals("0")) {
									RequestDispatcher homeDispatcher = request
											.getRequestDispatcher("/WEB-INF/Home.jsp");
									homeDispatcher.forward(request, response);
								} else if (userType.equals("1")) {
									int isAdmin = employeeFunctions.getAdmin(Integer.parseInt(userId));
									userSession.setAttribute("isAdmin", isAdmin);
									RequestDispatcher homeDispatcher = request
											.getRequestDispatcher("/WEB-INF/EmployeeHome.jsp");
									homeDispatcher.forward(request, response);
								}
							}
						} else {
							request.setAttribute("message", "Invalid UserId or Password");
							RequestDispatcher loginDispatcher = request.getRequestDispatcher("index.jsp");
							loginDispatcher.forward(request, response);
						}
					}
				}
			}
				break;
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
					conditions.put("To", Common.dateToMilli(toDate));
					conditions.put("SortColumn", "Id");
					conditions.put("Sort", "desc");
					conditions.put("limit", 10);
					TransactionDetails transactionDetails = new TransactionDetails();
					transactionDetails.setUserId(loggedUserId);
					List<TransactionDetails> latestTransaction = transactionFunctions.getCustomDetails(
							transactionDetails, new ArrayList<String>(Arrays.asList("*")), conditions);
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
					request.setAttribute("latestTransaction", latestTransaction);
					RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
					homeDispatcher.forward(request, response);
				}

			}
				break;
			case "deposit": {
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long amount = Long.parseLong(request.getParameter("amount"));
				long transactionId = transactionFunctions.newDeposite(accountNumber, amount);
				if (transactionId <= 0) {
					request.setAttribute("message", "Something went wrong ,Deposite was not successful.Try Again");
				} else {
					request.setAttribute("message", "Deposit  was Successfull");
				}
				AccountDetails accountDetails = new AccountDetails();
				String customerName = "";
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				if (!accountRecords.isEmpty()) {
					customerName = userFunctions.getSinglRecord("Name", loggedUserId);
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
				}
				RequestDispatcher depositeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
				depositeDispatcher.forward(request, response);

			}
				break;
			case "withdraw": {
				System.out.println(request.getParameter("accountno") + " " + request.getParameter("amount"));
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long amount = Long.parseLong(request.getParameter("amount"));
				String description = request.getParameter("remark");
				long transactionId = transactionFunctions.newWithdraw(accountNumber, amount, description);
				if (transactionId <= 0) {
					request.setAttribute("message", "Something went wrong ,Withdraw was not successful.Try Again");
				} else {
					request.setAttribute("message", "Withdraw was Successfull");
				}
				AccountDetails accountDetails = new AccountDetails();
				String customerName = "";
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				if (!accountRecords.isEmpty()) {
					customerName = userFunctions.getSinglRecord("Name", loggedUserId);
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
				}
				RequestDispatcher depositeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
				depositeDispatcher.forward(request, response);
			}
				break;
			case "interTransfer": {
				System.out.println(request.getParameter("accountno") + " " + request.getParameter("recaccount"));
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long recAccountNumber = Long.parseLong(request.getParameter("recaccount"));
				long amount = Long.parseLong(request.getParameter("amount"));
				String description = request.getParameter("remark");
				Map<String, Integer> records = transactionFunctions.newTransferWithinBank(accountNumber,
						recAccountNumber, amount, description);
				if (records.size() >= 0) {
					request.setAttribute("message", "Something went wrong ,Withdraw was not successful.Try Again");
				} else {
					request.setAttribute("message", "Withdraw was Successfull");
				}
				AccountDetails accountDetails = new AccountDetails();
				String customerName = "";
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				if (!accountRecords.isEmpty()) {
					customerName = userFunctions.getSinglRecord("Name", loggedUserId);
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
				}
				RequestDispatcher depositeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
				depositeDispatcher.forward(request, response);
			}
				break;
			case "intraTransfer": {
				long accountNumber = Long.parseLong(request.getParameter("accountno"));
				long recAccountNumber = Long.parseLong(request.getParameter("recaccount"));
				long amount = Long.parseLong(request.getParameter("amount"));
				String ifsc = request.getParameter("ifsc");
				String description = request.getParameter("remark");
				long transactionId = transactionFunctions.newTransferOtherBank(accountNumber, recAccountNumber, amount,
						description, ifsc);
				if (transactionId <= 0) {
					request.setAttribute("message", "Something went wrong ,Withdraw was not successful.Try Again");
				} else {
					request.setAttribute("message", "Withdraw was Successfull");
				}
				AccountDetails accountDetails = new AccountDetails();
				String customerName = "";
				accountDetails.setUserId(loggedUserId);
				Map<Long, AccountDetails> accountRecords = accountFunctions.accountDetails(accountDetails);
				if (!accountRecords.isEmpty()) {
					customerName = userFunctions.getSinglRecord("Name", loggedUserId);
					request.setAttribute("accounts", accountRecords);
					request.setAttribute("customerName", customerName);
				}
				RequestDispatcher depositeDispatcher = request.getRequestDispatcher("/WEB-INF/Accounts.jsp");
				depositeDispatcher.forward(request, response);
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
				BranchDetails branchDetails = branchFunctions.getBranchDetails(firstbranchIfsc);
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
			case "searchUser": {
				String statusActive = "1", statusInactive = "0";
				CustomerDetails customerDetails = new CustomerDetails();
				customerDetails.setId(Integer.parseInt(request.getParameter("id")));
				Map<Integer, CustomerDetails> searchedUser = customerFunctions.getCustomerProfile(customerDetails);
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 10, 0);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 10, 0);
				request.setAttribute("user", searchedUser);
				request.setAttribute("editUser", activeUsers);
				request.setAttribute("Inactiveuser", inactiveUsers);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "CustomerDetailsEditForm": {
				String statusActive = "1", statusInactive = "0";
				CustomerDetails customerDetails = new CustomerDetails();
				customerDetails.setId(Integer.parseInt(request.getParameter("id")));
				Map<Integer, CustomerDetails> searchedUser = customerFunctions.getCustomerProfile(customerDetails);
				Map<Integer, CustomerDetails> activeUsers = userFunctions.getUsers(statusActive, false, 10, 0);
				Map<Integer, CustomerDetails> inactiveUsers = userFunctions.getUsers(statusInactive, true, 10, 0);
				request.setAttribute("user", activeUsers);
				request.setAttribute("editUser", searchedUser);
				request.setAttribute("Inactiveuser", inactiveUsers);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "newCustomer": {
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
				int result = customerFunctions
						.addCustomer(new ArrayList<CustomerDetails>(Arrays.asList(customerDetails)));
			}
				break;
			case "newEmployee": {
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
				int result = employeeFunctions
						.addEmployee(new ArrayList<EmployeeDetails>(Arrays.asList(employeeDetails)));
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
				customerFunctions.updateCustomer(Integer.parseInt(request.getParameter("userid")), customerDetails);
			}
				break;
			case "blockUser": {
				customerFunctions.updateStatus(Integer.parseInt(request.getParameter("id")),
						request.getParameter("status"));
			}
				break;
			case "deleteUser": {
				customerFunctions.deleteUser(Integer.parseInt(request.getParameter("id")));
			}
				break;

			case "fetchAccount": {
				String activeStatus = "1", inActiveStatus = "0";
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setAccountNumber(Long.parseLong(request.getParameter("id")));
				Map<Long, AccountDetails> searchedAccounts = accountFunctions.accountDetails(accountDetails);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(10, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(10, 0, inActiveStatus);
				request.setAttribute("accounts", searchedAccounts);
				request.setAttribute("editAccounts", editAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "fetchEditAccount": {
				String activeStatus = "1", inActiveStatus = "0";
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setAccountNumber(Long.parseLong(request.getParameter("id")));
				Map<Long, AccountDetails> searchedAccounts = accountFunctions.accountDetails(accountDetails);
				Map<Long, AccountDetails> editAccounts = accountFunctions.getAccounts(10, 0, activeStatus);
				Map<Long, AccountDetails> inactiveAccounts = accountFunctions.getAccounts(10, 0, inActiveStatus);
				request.setAttribute("accounts", editAccounts);
				request.setAttribute("editAccounts", searchedAccounts);
				request.setAttribute("inactiveAccounts", inactiveAccounts);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "newAccount": {
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setUserId(Integer.parseInt(request.getParameter("id")));
				accountDetails.setBranchId(request.getParameter("ifsc"));
				accountDetails.setAccountType(request.getParameter("type"));
				accountDetails.setBalance(Long.parseLong(request.getParameter("balance")));
				accountFunctions.addAccount(accountDetails);
			}
				break;
			case "blockAccount": {
				accountFunctions.updateColoumn("Status", request.getParameter("status"),
						Long.parseLong(request.getParameter("accountno")));
			}
				break;
			case "searchTransactionForm": {
				long fromdate = 0l, todate = 0l;
				int userId = 0;
				if (!request.getParameter("customerId").equals("")) {
					userId = Integer.parseInt(request.getParameter("customerId"));
				}
				if (!request.getParameter("fromDate").equals("")) {
					fromdate = Common.dateToMilli((request.getParameter("fromDate")));
				}
				if (!request.getParameter("toDate").equals("")) {
					fromdate = Common.dateToMilli((request.getParameter("toDate")));
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
				duration.put("limit", 10);
				List<TransactionDetails> record = transactionFunctions.getCustomDetails(transactioDetails,
						new ArrayList<String>(Arrays.asList("*")), duration);
				request.setAttribute("latestTransactions", record);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "editBranch": {
				BranchDetails branchDetails = new BranchDetails();
				branchDetails.setAddress(request.getParameter("address"));
				branchDetails.setManagerId(Integer.parseInt(request.getParameter("managerid")));
				branchDetails.setPhoneNumber(Long.parseLong(request.getParameter("contact")));
				branchFunctions.updateRecord(branchDetails, Integer.parseInt(request.getParameter("branchid")));
			}
				break;
			case "branchSearch": {
				BranchDetails branchDetail = branchFunctions.getBranchDetails(request.getParameter("branchid"));
				List<BranchDetails> branches = new ArrayList<BranchDetails>();
				branches.add(branchDetail);
				request.setAttribute("branches", branches);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/BranchManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "transferPagination": {
				System.out.println(request.getParameter("offset"));
				List<TransactionDetails> latestTransaction = transactionFunctions.getLatestDetails(11,
						Integer.parseInt(request.getParameter("offset")), 0, "TransactionTime");
				request.setAttribute("latestTransactions", latestTransaction);
				request.setAttribute("pageno", Integer.parseInt(request.getParameter("pageno")));
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (InvalidInputException e) {
			e.printStackTrace();
		}
	}
}
