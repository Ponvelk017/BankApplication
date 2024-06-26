package customLogics;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import customDB.User;
import details.CustomerDetails;
import utility.Common;
import utility.InputCheck;
import utility.InvalidInputException;

public class UserFunctions {

	private User userOpertaion;

	public UserFunctions() {
		try {
			Class<?> userClass = Class.forName("dbLogics.UserOperations");
			userOpertaion = (User) userClass.getDeclaredConstructor().newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
	}

	public boolean login(int userId, String password) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		InputCheck.checkNull(password);
		password = Common.encryptPassword(password);
		boolean result = false;
		String dbPassword = (String) userOpertaion.getSingleRecord("Password", "Id", userId);
		if (dbPassword != null && dbPassword.equals(password)) {
			result = true;
		}
		return result;
	}

	public Map<Integer, CustomerDetails> getUsers(String status, boolean isDeleted, int limit, int offset)
			throws InvalidInputException {
		return userOpertaion.getUsers(status, isDeleted, limit, offset);
	}

	public String getSinglRecord(String column, int userId) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		return userOpertaion.getSingleRecord(column, "Id", userId) + "";
	}

	public int coloumnUpdation(String column, Object value, int userId) throws InvalidInputException {
		InputCheck.checkNull(column);
		InputCheck.checkNull(value);
		InputCheck.checkNegativeInteger(userId);
		return userOpertaion.updateColumn(column, value, userId);
	}

	public int deleteUser(int userId) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		return userOpertaion.deleteUser(userId);
	}
	//
	//
	//
	// BlockedUser Table
	//
	//
	//

	public int addBlockedUser(int userId, int InvalidAttempts, long timeOfBlocked) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		InputCheck.checkNegativeInteger(InvalidAttempts);
		InputCheck.checkNegativeInteger(timeOfBlocked);
		if (InvalidAttempts > 1) {
			return userOpertaion.updateInvalidAttempt(userId, InvalidAttempts, timeOfBlocked);
		} else {
			return userOpertaion.addBlockedUser(userId, InvalidAttempts, timeOfBlocked);
		}
	}

	public Map<String, Object> blockedDetails(int userId) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		return userOpertaion.getBlockedDetails(userId);

	}

	public int deleteBlockedUser(int userId) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		return userOpertaion.deleteRecord(userId);
	}
}
