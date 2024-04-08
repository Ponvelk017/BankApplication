package customDB;

import java.util.List;
import java.util.Map;

import details.TransactionDetails;
import utility.InvalidInputException;

public interface Transaction {

	public int setTransferTransaction(TransactionDetails transactionDetails) throws InvalidInputException;

	public int setTransferTransactionWithId(TransactionDetails transactionDetails) throws InvalidInputException;

	public List<TransactionDetails> getTransferTransaction(long transactionId, String ConditionColumn)
			throws InvalidInputException;

	public List<TransactionDetails> getCustomData(TransactionDetails transactionDetails, List<String> columnToGet,
			Map<String, Object> condition) throws InvalidInputException;

	public long getId() throws InvalidInputException;

	public long deposit(TransactionDetails transactionDetails, boolean autoCommitFlag, int userId)
			throws InvalidInputException;

	public long withdraw(TransactionDetails transactionDetails, boolean autoCommitFlag, int userId)
			throws InvalidInputException;

	public Map<String, Integer> transferWithinBank(TransactionDetails transactionDetails, int userId)
			throws InvalidInputException;

	public long transferOtherBank(TransactionDetails transactionDetails,
			int userId) throws InvalidInputException;
}
