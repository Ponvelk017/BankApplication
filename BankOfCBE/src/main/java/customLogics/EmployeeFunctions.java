package customLogics;

import java.lang.reflect.InvocationTargetException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import customDB.Employee;
import details.CustomerDetails;
import details.EmployeeDetails;
import utility.Common;
import utility.InputCheck;
import utility.InvalidInputException;

public class EmployeeFunctions {

	private Employee employeeOperations;
	
	public EmployeeFunctions() {
		try {
			Class<?> employeeClass = Class.forName("dbLogics.EmployeeOperations");
			employeeOperations = (Employee) employeeClass.getDeclaredConstructor().newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
	}
	

	public static int validateDetails(EmployeeDetails employee) throws InvalidInputException {
		InputCheck.checkNull(employee);
		if (employee.getName().matches("^[A-Za-z.]+") && (employee.getMobile() + "").matches("^[0-9]{10}$")
				&& employee.getEmail().matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
						+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")) {
			LocalDate currentDate = LocalDate.now();
			LocalDate dob = LocalDate.ofInstant(Instant.ofEpochMilli(employee.getDOB()), ZoneId.systemDefault());
			Period period = Period.between(dob, currentDate);
			if (period.getYears() >= 18 && "MaleFemale".contains(employee.getGender()) && employee.getPassword()
					.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z0-9@#$%^&+=!]).{8,}$")) {
				if (employee.getBranch().matches("^[0-9A-Z]")) {
					return 1;
				}
			}
		}
		return -1;
	}

	public int addEmployee(List<EmployeeDetails> employees) throws InvalidInputException {
		InputCheck.checkNull(employees);
		List<Integer> result = employeeOperations.insertEmployee(employees);
		for (Integer singleRecord : result) {
			if (singleRecord == 0) {
				return 0;
			}
		}
		return 1;
	}

	public int updateRecord(int Id, String column, Object value) throws InvalidInputException {
		InputCheck.checkNegativeInteger(Id);
		InputCheck.checkNull(column);
		InputCheck.checkNull(value);
		if (column.equals("DOB") || column.equals("JoinDate")) {
			value = Common.dateToMilli(value.toString());
		}
		return employeeOperations.updateDetails(Id, column, value);
	}

	public int getAdmin(int id) throws InvalidInputException {
		Integer customerId = id;
		return (int) employeeOperations.getSingleRecord("Admin", "Id", customerId);
	}
	
	public Map<Integer, EmployeeDetails> getCustomerProfile(EmployeeDetails employeeDetails)
			throws InvalidInputException {
		InputCheck.checkNull(employeeDetails);
		new CustomerDetails();
		List<String> columnToGet = new ArrayList<String>();
		columnToGet.add("User.*");
		columnToGet.add("Employee.Branch");
		columnToGet.add("Employee.Admin");
		List<EmployeeDetails> employeeDet =employeeOperations.getCustomEmployee(employeeDetails, columnToGet);
		Map<Integer, EmployeeDetails> result = new HashMap<Integer, EmployeeDetails>();
		for (EmployeeDetails singleRecord : employeeDet) {
			result.put(singleRecord.getId(), singleRecord);
		}
		return result;
	}
}
