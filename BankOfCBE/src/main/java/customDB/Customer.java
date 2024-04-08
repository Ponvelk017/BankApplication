package customDB;

import java.util.List;

import details.CustomerDetails;
import utility.InvalidInputException;

public interface Customer {

	public int insertCustomer(CustomerDetails customers) throws InvalidInputException ;

	public int updateDetails(int Id, CustomerDetails customerDeatails , int modifiedBy) throws InvalidInputException;

	public int updateRecord(int id, String column, Object value, int modifiedBy) throws InvalidInputException;

	public List<CustomerDetails> getCustomCustomer(CustomerDetails customerDetails, List<String> columnToGet,
			String userType) throws InvalidInputException;

}
