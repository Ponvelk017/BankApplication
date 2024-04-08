package customLogics;

import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cacheLogics.RedisCache;
import customDB.Cache;
import dbLogics.CustomerOperations;
import details.CustomerDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class CustomerFunctions {

	private Cache customerCache = RedisCache.getInstance();
	private CustomerOperations customerOpertaion = new CustomerOperations();

	public static String validateDetails(CustomerDetails customer, int modifiedBy) throws InvalidInputException {
		InputCheck.checkNull(customer);
		if (customer.getName().matches("^[A-Za-z.]+")) {
			if ((customer.getMobile() + "").matches("^[0-9]{10}$")) {
				if (customer.getEmail().matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
						+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")) {
					LocalDate currentDate = LocalDate.now();
					LocalDate dob = LocalDate.ofInstant(Instant.ofEpochMilli(customer.getDOB()),
							ZoneId.systemDefault());
					Period period = Period.between(dob, currentDate);
					if (period.getYears() >= 18) {
						return "success";
					} else {
						return "Age should be more than 18";
					}
				} else {
					return "Invalid Email";
				}
			} else {
				return "Mobile number should contain only 10 numbers";
			}
		} else {
			return "Name should only contain Alphabets";
		}
	}

	public int addCustomer(CustomerDetails customers) throws InvalidInputException {
		InputCheck.checkNull(customers);
		int result = customerOpertaion.insertCustomer(customers);
		return result;
	}

	public int updateCustomer(int Id, CustomerDetails customerDetails, int modifiedBy) throws InvalidInputException {
		InputCheck.checkNegativeInteger(Id);
		int affectedColumns = 0;
		synchronized (customerDetails) {
			affectedColumns = customerOpertaion.updateDetails(Id, customerDetails, modifiedBy);
			if (affectedColumns > 0) {
				customerCache.deleteCustomer(Id);
			}
			return affectedColumns;
		}
	}

	public int updateStatus(int Id, Object value, int modifiedBy) throws InvalidInputException {
		InputCheck.checkNegativeInteger(Id);
		int affectedColumns = 0;
		CustomerDetails customerDetails = customerCache.getCustomer(Id);
		synchronized (customerDetails) {
			affectedColumns = customerOpertaion.updateRecord(Id, "Status", value, modifiedBy);
			if (affectedColumns > 0) {
				customerCache.deleteCustomer(Id);
			}
			return affectedColumns;
		}
	}

	public int deleteUser(int Id , int modifiedBy) throws InvalidInputException {
		InputCheck.checkNegativeInteger(Id);
		int affectedColumns = 0;
		CustomerDetails customerDetails = customerCache.getCustomer(Id);
		synchronized (customerDetails) {
			affectedColumns = customerOpertaion.updateRecord(Id, "DeleteAt", System.currentTimeMillis(),modifiedBy);
			if (affectedColumns > 0) {
				customerCache.deleteCustomer(Id);
			}
			return affectedColumns;
		}
	}

	public Map<Integer, CustomerDetails> getCustomerProfile(CustomerDetails customerDetails, String userType)
			throws InvalidInputException {
		InputCheck.checkNull(customerDetails);
		new CustomerDetails();
		List<String> columnToGet = new ArrayList<String>();
		columnToGet.add("User.*");
		columnToGet.add("Customer.Address");
		columnToGet.add("Customer.Aadhar");
		columnToGet.add("Customer.Pan");
		List<CustomerDetails> customerDet = customerOpertaion.getCustomCustomer(customerDetails, columnToGet, userType);
		Map<Integer, CustomerDetails> result = new HashMap<Integer, CustomerDetails>();
		for (CustomerDetails singleRecord : customerDet) {
			result.put(singleRecord.getId(), singleRecord);
		}
		return result;
	}

	public int checkPanAadhar(String pan, String aadhar) throws InvalidInputException {
		return customerOpertaion.panAadharCheck(pan, aadhar);
	}

}
