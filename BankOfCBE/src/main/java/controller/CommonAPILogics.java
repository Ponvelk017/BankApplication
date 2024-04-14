package controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.JSONArray;
import org.json.JSONObject;

import customLogics.AccountFunctions;
import customLogics.BranchFunction;
import customLogics.CustomerFunctions;
import customLogics.EmployeeFunctions;
import customLogics.UserFunctions;
import details.AccountDetails;
import details.BranchDetails;
import details.CustomerDetails;
import utility.InvalidInputException;

public class CommonAPILogics {

	UserFunctions userFunctions = new UserFunctions();
	CustomerFunctions customerFunctions = new CustomerFunctions();
	EmployeeFunctions employeeFunctions = new EmployeeFunctions();
	AccountFunctions accountFunctions = new AccountFunctions();
	BranchFunction branchFunctions = new BranchFunction();

	public JSONObject getDetails(String urlContents[]) throws InvalidInputException {
		String userType = "0";
		CustomerDetails customerDetails = new CustomerDetails();
		customerDetails.setId(Integer.parseInt(urlContents[1]));
		Map<Integer, CustomerDetails> searchedUser = customerFunctions.getCustomerProfile(customerDetails, userType);
		JSONObject allAccount = new JSONObject();
		JSONObject customerJson = new JSONObject();
		if (searchedUser.isEmpty()) {
			return allAccount;
		} else {
			for (Entry<?, ?> customer : searchedUser.entrySet()) {
				customerDetails = (CustomerDetails) customer.getValue();
				customerJson.put("Id", customerDetails.getId());
				customerJson.put("Name", customerDetails.getName());
				customerJson.put("DOB", customerDetails.getDOB());
				customerJson.put("Mobile", customerDetails.getMobile());
				customerJson.put("Email", customerDetails.getEmail());
				customerJson.put("Gender", customerDetails.getGender());
				customerJson.put("Type", customerDetails.getType());
				customerJson.put("Status", customerDetails.getStatus());
				customerJson.put("Address", customerDetails.getAddress());
				customerJson.put("Pan", customerDetails.getPan());
				customerJson.put("Aadhar", customerDetails.getAadhar());
			}
			allAccount.put("customer-details", customerJson);
			if (urlContents.length > 2 && urlContents[2].equals("accounts")) {
				Map<Long, AccountDetails> searchedAccounts;
				if (urlContents.length > 3) {
					AccountDetails accountDetails = new AccountDetails();
					accountDetails.setAccountNumber(Long.parseLong(urlContents[3]));
					searchedAccounts = accountFunctions.accountDetails(accountDetails);
				} else {
					AccountDetails accountDetails = new AccountDetails();
					accountDetails.setUserId(Integer.parseInt(urlContents[1]));
					searchedAccounts = accountFunctions.accountDetails(accountDetails);
				}
				if (searchedAccounts.isEmpty()) {
					JSONObject accountJson = new JSONObject();
					accountJson.put("message", "Account not found");
					allAccount.put("Accounts", accountJson);
				} else {
					JSONArray accounts = new JSONArray();
					for (Entry<?, ?> account : searchedAccounts.entrySet()) {
						JSONObject accountJson = new JSONObject();
						AccountDetails accountDetails = (AccountDetails) account.getValue();
						accountJson.put("Account Number", accountDetails.getAccountNumber());
						accountJson.put("UserId", accountDetails.getUserId());
						List<BranchDetails> branches = branchFunctions.getBranchDetails(accountDetails.getBranchId());
						JSONObject branchJson = new JSONObject();
						for (BranchDetails branchDetails : branches) {
							branchJson.put("Id", branchDetails.getId());
							branchJson.put("IFSC-Code", branchDetails.getIfscCode());
							branchJson.put("Address", branchDetails.getAddress());
							branchJson.put("ManagerId", branchDetails.getManagerId());
							branchJson.put("Contact", branchDetails.getPhoneNumber());
						}
						accountJson.put("Branch", branchJson);
						accountJson.put("Status", accountDetails.getStatus());
						accountJson.put("Account-Type", accountDetails.getAccountType());
						accountJson.put("Balance", accountDetails.getBalance());
						accounts.put(accountJson);
					}
					allAccount.put("Accounts", accounts);
				}
			}
		}
		return allAccount;
	}
}
