package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import customLogics.APIFunctions;
import customLogics.AccountFunctions;
import customLogics.BranchFunction;
import customLogics.CustomerFunctions;
import customLogics.EmployeeFunctions;
import customLogics.UserFunctions;
import details.APIDetails;
import details.EmployeeDetails;
import utility.InvalidInputException;

public class APIController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserFunctions userFunctions = new UserFunctions();
	CustomerFunctions customerFunctions = new CustomerFunctions();
	EmployeeFunctions employeeFunctions = new EmployeeFunctions();
	AccountFunctions accountFunctions = new AccountFunctions();
	BranchFunction branchFunctions = new BranchFunction();
	CommonAPILogics commonAPILogics = new CommonAPILogics();
	APIFunctions apiFunctions = new APIFunctions();

	public APIController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String urlType = (request.getPathInfo()).substring(1);
		String urlContents[] = urlType.split("/");
		System.out.println(Arrays.toString(urlContents));
		String apiKey = request.getHeader("apiKey");
		try {
			APIDetails apiDetails = apiFunctions.isValidAPIKey(apiKey);
			if (apiDetails.getApiKey() == null || !apiDetails.getApiKey().equals(apiKey)) {
				JSONObject loginJson = new JSONObject();
				loginJson.put("status", false);
				loginJson.put("message", "Invalid API Key");
				response.setContentType("application/json");
				response.getWriter().print(loginJson);
				return;
			}
		} catch (InvalidInputException e) {
		}
		if (urlContents.length == 1) {
			try {
				switch (urlContents[0]) {
				case "login": {
					String userId = request.getParameter("id");
					String password = request.getParameter("password");
					if (userId != null && password != null) {
						Map<String, Object> blockedUser;
						blockedUser = userFunctions.blockedDetails(Integer.parseInt(userId));
						JSONObject loginJson = new JSONObject();
						loginJson.put("UserId", userId);
						loginJson.put("IsAuth", userFunctions.login(Integer.parseInt(userId), password));
						loginJson.put("UserType", userFunctions.getSinglRecord("Type", Integer.parseInt(userId)));
						loginJson.put("Blocked-status", ((int) blockedUser.get("InvalidAttempts") == 2) ? true : false);
						loginJson.put("Invalid-attempts", blockedUser.get("InvalidAttempts"));
						JSONObject loginData = new JSONObject();
						loginData.put("data", loginJson);
						loginData.put("status", true);
						response.setContentType("application/json");
						response.getWriter().write(loginData.toString());
					}
				}
				}
			} catch (NumberFormatException | InvalidInputException e) {
				e.printStackTrace();
			}
		}
		if (urlContents.length >= 2) {
			try {
				switch (urlContents[0]) {
				case "customer": {
					JSONObject customer = new JSONObject();
					JSONObject customerdata = commonAPILogics.getDetails(urlContents);
					customer.put("data", customerdata);
					if (customerdata.length() > 0) {
						customer.put("status", true);
					} else {
						customer.put("status", false);
					}
					response.setContentType("application/json");
					response.getWriter().print(customer);
				}
					break;
				case "employee": {
					EmployeeDetails employeeDetails = new EmployeeDetails();
					employeeDetails.setId(Integer.parseInt(urlContents[1]));
					Map<Integer, EmployeeDetails> searchedUser = employeeFunctions.getCustomerProfile(employeeDetails);
					JSONObject allAccount = new JSONObject();
					JSONArray allDatas = new JSONArray();
					JSONObject customerJson = new JSONObject();
					System.out.println(searchedUser);
					if (searchedUser.isEmpty()) {
						allAccount.put("status", false);
						allAccount.put("message", "Employee not found");
						response.setContentType("application/json");
						response.getWriter().print(allAccount);
					} else {
						for (Entry<?, ?> customer : searchedUser.entrySet()) {
							employeeDetails = (EmployeeDetails) customer.getValue();
							customerJson.put("Id", employeeDetails.getId());
							customerJson.put("Name", employeeDetails.getName());
							customerJson.put("DOB", employeeDetails.getDOB());
							customerJson.put("Mobile", employeeDetails.getMobile());
							customerJson.put("Email", employeeDetails.getEmail());
							customerJson.put("Gender", employeeDetails.getGender());
							customerJson.put("Type", employeeDetails.getType());
							customerJson.put("Status", employeeDetails.getStatus());
							customerJson.put("Admin", employeeDetails.getAdmin());
							customerJson.put("Branch", employeeDetails.getBranch());
						}
						allDatas.put(customerJson);
					}
					System.out.println(allAccount);
					if (urlContents.length > 2 && urlContents[2].equals("customer")) {
						JSONObject accountDataJson = commonAPILogics
								.getDetails(Arrays.copyOfRange(urlContents, 2, urlContents.length));
						allDatas.put(accountDataJson);
					}
					allAccount.put("data", allDatas);
					if (allAccount.length() > 0) {
						allAccount.put("status", true);
					} else {
						allAccount.put("status", false);
					}
					response.setContentType("application/json");
					response.getWriter().print(allAccount);
				}
					break;
				}
			} catch (NumberFormatException | InvalidInputException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
