package customLogics;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import cacheLogics.RedisCache;
import customDB.Account;
import customDB.Cache;
import details.AccountDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class AccountFunctions {

	private Account accountOperation;
	private Cache accountCache = RedisCache.getInstance();

	public AccountFunctions() {
		try {
			Class<?> accountClass = Class.forName("dbLogics.AccountOperations");
			accountOperation = (Account) accountClass.getDeclaredConstructor().newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
	}

	public int addAccount(AccountDetails account) throws InvalidInputException {
		InputCheck.checkNull(account);
		AccountDetails tempAccountDetails = new AccountDetails();
		tempAccountDetails.setUserId(account.getUserId());
		System.out.println(account.getAccountType() + " " + account.getUserId() + " " + account.getBalance() + " "
				+ account.getBranchId());
		Map<Long, AccountDetails> records = accountOperation.getCustomAccountDetails(tempAccountDetails);
		for (Entry<?, ?> individualAccount : records.entrySet()) {
			tempAccountDetails = (AccountDetails) individualAccount.getValue();
			if (tempAccountDetails.getBranchId().equals(account.getBranchId())
					&& tempAccountDetails.getAccountType().equals(account.getAccountType())) {
				return -1;
			}
		}
		return accountOperation.createAccount(account);
	}

	public Map<Long, AccountDetails> accountDetails(AccountDetails accountDet) throws InvalidInputException {
		InputCheck.checkNull(accountDet);
		Map<Long, AccountDetails> records = accountOperation.getCustomAccountDetails(accountDet);
		return records;
	}

	public List<Long> getAllAccount(int customerId) throws InvalidInputException {
		List<Long> result = new ArrayList<Long>();
		AccountDetails accountDetails = new AccountDetails();
		accountDetails.setUserId(customerId);
		Map<Long, AccountDetails> records = accountDetails(accountDetails);
		for (Entry<?, ?> individualAccount : records.entrySet()) {
			result.add((Long) individualAccount.getKey());
		}
		return result;
	}

	public long getBalance(long accountNumber) throws InvalidInputException {
		InputCheck.checkNegativeInteger(accountNumber);
		return (long) accountOperation.getSingleRecord("Balance", "AccountNumber", accountNumber);
	}

	public Object getSingleRecord(String column, long accountNumber) throws InvalidInputException {
		InputCheck.checkNull(column);
		InputCheck.checkNegativeInteger(accountNumber);
		return accountOperation.getSingleRecord(column, "AccountNumber", accountNumber);
	}

	public int updateColoumn(String coloumn, Object value, long accountId, int userId) throws InvalidInputException {
		InputCheck.checkNull(coloumn);
		InputCheck.checkNull(value);
		InputCheck.checkNegativeInteger(accountId);
		int affectedRows = 0;
		AccountDetails accountDetailsLock = (AccountDetails) accountCache.getAccount(accountId);
		synchronized (accountDetailsLock) {
			affectedRows = accountOperation.updateColumn(coloumn, value, accountId, userId);
			if (affectedRows > 0) {
				AccountDetails accountDetails = new AccountDetails();
				accountDetails.setAccountNumber(accountId);
				Map<Long, AccountDetails> records = accountDetails(accountDetails);
				accountDetails = records.get(accountId);
				accountCache.deleteAccount(accountDetails.getUserId());
			}
		}
		return affectedRows;
	}

	public Map<Long, AccountDetails> getAccounts(int limit, int offset, String status) throws InvalidInputException {
		return accountOperation.getAccounts(limit, offset, status);
	}
}
