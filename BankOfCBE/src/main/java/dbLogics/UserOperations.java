package dbLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import customDB.User;
import details.CustomerDetails;
import details.TransactionDetails;
import utility.DBConnection;
import utility.InputCheck;
import utility.InvalidInputException;

public class UserOperations implements User {

	private Connection connection = DBConnection.getConnection();

	private final String deleteUser = "update User set DeleteAt = ? where Id = ?";

	@Override
	public Object getSingleRecord(String columnToGet, String column, Object value) throws InvalidInputException {
		InputCheck.checkNull(value);
		InputCheck.checkNull(column);
		InputCheck.checkNull(columnToGet);
		connection = DBConnection.getConnection();
		String query = "select " + columnToGet + " from User where " + column + " = ?";
		Object result = null;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, value);
			try (ResultSet record = statement.executeQuery()) {
				while (record.next()) {
					result = record.getObject(1);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return result;
	}

	@Override
	public Map<Integer, CustomerDetails> getUsers(String status, boolean isdeleted, int limit, int offset)
			throws InvalidInputException {
		connection = DBConnection.getConnection();
		Map<Integer, CustomerDetails> users = new LinkedHashMap<Integer, CustomerDetails>();
		String query = "select * from User join Customer on User.Id = Customer.Id where Status = ? or DeleteAt ";
		if (isdeleted) {
			query += "is not null ";
		} else {
			query += "is null ";
		}
		query += " order by Customer.Id  desc limit " + limit + " offset " + offset;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, status);
			try (ResultSet record = statement.executeQuery()) {
				while (record.next()) {
					CustomerDetails customerDetails = new CustomerDetails();
					customerDetails.setId(record.getInt("Id"));
					customerDetails.setName(record.getString("Name"));
					customerDetails.setDOB(record.getLong("DOB"));
					customerDetails.setMobile(record.getString("Mobile"));
					customerDetails.setEmail(record.getString("Email"));
					customerDetails.setGender(record.getString("Gender"));
					customerDetails.setStatus(record.getString("Status"));
					customerDetails.setAadhar(record.getString("Aadhar"));
					customerDetails.setPan(record.getString("Pan"));
					customerDetails.setAddress(record.getString("Address"));
					customerDetails.setDeleteAt(record.getLong("DeleteAt") + "");
					users.put(customerDetails.getId(), customerDetails);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return users;
	}

	@Override
	public int deleteUser(int userID) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userID);
		int affectedRow = 0;
		try (PreparedStatement statement = connection.prepareStatement(deleteUser)) {
			statement.setDouble(1, System.currentTimeMillis());
			statement.setInt(2, userID);
			affectedRow = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRow;
	}

	@Override
	public int updateColumn(String coloumn, Object value, int userId) throws InvalidInputException {
		InputCheck.checkNull(coloumn);
		InputCheck.checkNull(value);
		InputCheck.checkNegativeInteger(userId);
		String query = "update User set " + coloumn + " = ? where Id = ?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, value);
			statement.setInt(2, userId);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public Map<Integer, CustomerDetails> getCustomData(CustomerDetails customerDetails, String branchId,
			Map<String, Object> condition) throws InvalidInputException {
		InputCheck.checkNull(customerDetails);
		InputCheck.checkNull(condition);
		Map<Integer, CustomerDetails> users = new LinkedHashMap<Integer, CustomerDetails>();
		int offsetValue = 0;
		if (condition.get("offset") != null) {
			offsetValue = (int) condition.get("offset");
		}
		StringBuilder query = new StringBuilder("select distinct User.*,Customer.* from User,Customer");
		if (branchId != null) {
			query.append(",Account ");
		}
		query.append("where ");
		try {
			PreparedStatement statement = connection.prepareStatement(query.toString());
			query = new StringBuilder(query.subSequence(0, query.length() - 1));
			query.append("from User join Customer on User.Id = Customer.Id where ");
			int count = 1;
			if (customerDetails.getId() != 0) {
				query.append("Customer.Id = ? ");
				count++;
			}
			if (customerDetails.getName() != null) {
				if (count > 1) {
					query.append("AND ");
				}
				query.append("Customer.Name = ? ");
				count++;
			}
			if (customerDetails.getMobile() != null) {
				if (count > 1) {
					query.append("AND ");
				}
				query.append("Customer.Mobile = ? ");
				count++;
			}
			if (branchId != null) {
				if (count > 1) {
					query.append("AND ");
				}
				query.append("Account.BranchId = ? and Customer.Id = Account.UserId and User.Id = Customer.Id");
				count++;
			}

			if (count == 1) {
				query.delete(query.length() - 6, query.length());
			}
			if (condition.get("Sort") != null) {
				query.append(" order by " + condition.get("SortColumn") + " " + condition.get("Sort"));
			}
			query.append(" limit " + condition.get("limit"));
			query.append(" offset " + offsetValue);
			statement = connection.prepareStatement(query.toString());
			count = 1;
			if (customerDetails.getId() != 0) {
				statement.setObject(count++, customerDetails.getId());
			}
			if (customerDetails.getName() != null) {
				statement.setObject(count++, customerDetails.getName());
			}
			if (customerDetails.getMobile() != null) {
				statement.setObject(count++, customerDetails.getMobile());
			}
			if (branchId != null) {
				statement.setString(count++, branchId);
			}
			try (ResultSet record = statement.executeQuery()) {
				while (record.next()) {
					CustomerDetails sortedCustomer = new CustomerDetails();
					sortedCustomer.setId(record.getInt("Id"));
					sortedCustomer.setName(record.getString("Name"));
					sortedCustomer.setDOB(record.getLong("DOB"));
					sortedCustomer.setMobile(record.getString("Mobile"));
					sortedCustomer.setEmail(record.getString("Email"));
					sortedCustomer.setGender(record.getString("Gender"));
					sortedCustomer.setStatus(record.getString("Status"));
					sortedCustomer.setAadhar(record.getString("Aadhar"));
					sortedCustomer.setPan(record.getString("Pan"));
					sortedCustomer.setAddress(record.getString("Address"));
					sortedCustomer.setDeleteAt(record.getLong("DeleteAt") + "");
					users.put(sortedCustomer.getId(), sortedCustomer);
				}
			}

		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return users;
	}

	// BlockedUser Table

	@Override
	public int addBlockedUser(int userId, int invalidAttempts, long time) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		InputCheck.checkNegativeInteger(invalidAttempts);
		InputCheck.checkNegativeInteger(time);
		int affectedRows = 0;
		String query = "insert into BlockedUser (UserId , InvalidAttempts , BlockedTime) values (?,?,?)";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, userId);
			statement.setInt(2, invalidAttempts);
			statement.setLong(3, time);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public int updateInvalidAttempt(int userId, int invalidAttempts, long time) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		InputCheck.checkNegativeInteger(invalidAttempts);
		InputCheck.checkNegativeInteger(time);
		int affectedRows = 0;
		String query = "update BlockedUser set InvalidAttempts =  ? ,BlockedTime = ? where UserId = ?";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, invalidAttempts);
			statement.setLong(2, time);
			statement.setInt(3, userId);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public int deleteRecord(int userId) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		String query = "delete from BlockedUser where UserId = ?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, userId);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public Map<String, Object> getBlockedDetails(int userId) throws InvalidInputException {
		InputCheck.checkNegativeInteger(userId);
		String query = "select InvalidAttempts,BlockedTime from BlockedUser where UserId = ?";
		Map<String, Object> result = new HashMap<String, Object>();
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, userId);
			try (ResultSet record = statement.executeQuery()) {
				if (record.next()) {
					result.put("InvalidAttempts", (int) record.getInt(1));
					result.put("BlockedTime", (long) record.getLong(2));
				} else {
					result.put("InvalidAttempts", 0);
					result.put("BlockedTime", 0);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return result;
	}
}
