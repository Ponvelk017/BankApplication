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
import customLogics.TransactionFunctions;
import customLogics.UserFunctions;
import details.AccountDetails;
import details.BranchDetails;
import details.CustomerDetails;
import details.TransactionDetails;
import utility.Common;
import utility.InvalidInputException;


public class GlobalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HttpSession userSession;

	private RedisCache cache = RedisCache.getInstance();

	private UserFunctions userFunctions = new UserFunctions();
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

					List<TransactionDetails> latestTransaction = transactionFunctions.getLatestDetails(10, loggedUserId,
							"Id");
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
				Map<Integer, CustomerDetails> users = userFunctions.getUsers(10, 0);
				request.setAttribute("user", users);
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/UserManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeAccount": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/AccountManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeTransfer": {
				RequestDispatcher homeDispatcher = request.getRequestDispatcher("/WEB-INF/TransactionManagement.jsp");
				homeDispatcher.forward(request, response);
			}
				break;
			case "EmployeeBranch": {
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
								if (userType.equals("0")) {
									userSession.setAttribute("UserId", Integer.parseInt(userId));
									RequestDispatcher homeDispatcher = request
											.getRequestDispatcher("/WEB-INF/Home.jsp");
									homeDispatcher.forward(request, response);
								} else if (userType.equals("1")) {

									userSession.setAttribute("UserId", Integer.parseInt(userId));
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
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (InvalidInputException e) {
			e.printStackTrace();
		}
	}
}
