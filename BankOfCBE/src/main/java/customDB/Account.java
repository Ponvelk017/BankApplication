package customDB;

import java.util.Map;

import details.AccountDetails;
import utility.InvalidInputException;

public interface Account {

	public int createAccount(AccountDetails account) throws InvalidInputException;

	public Object getSingleRecord(String columnToGet, String column, Object value) throws InvalidInputException;

	public Map<Long, AccountDetails> getAccounts(int limit, int offset, String status) throws InvalidInputException;

	public <K, V> Map<K, V> getCustomAccountDetails(AccountDetails accountDetails) throws InvalidInputException;

	public int updateColumn(String column, Object DepositeAmount, long accountNumber, int userId)
			throws InvalidInputException ;
}
