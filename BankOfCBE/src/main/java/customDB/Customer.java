package customDB;

import java.util.List;

import details.CustomerDetails;
import utility.InvalidInputException;

public interface Customer {

	public List<Integer> insertCustomer(List<CustomerDetails> customers) throws InvalidInputException;

	public int updateDetails(int Id, CustomerDetails customerDeatails) throws InvalidInputException;

	public int updateRecord(int id, String column, Object value) throws InvalidInputException;

	public List<CustomerDetails> getCustomCustomer(CustomerDetails customerDetails, List<String> columnToGet,
			String userType) throws InvalidInputException;

}
