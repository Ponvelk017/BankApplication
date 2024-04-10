package dbLogics;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import customDB.Customer;
import details.CustomerDetails;
import utility.Common;
import utility.DBConnection;
import utility.InputCheck;
import utility.InvalidInputException;

public class CustomerOperations implements Customer {

	private Connection connection = DBConnection.getConnection();

	private String insertUser = "insert into User (Name,DOB,Mobile,Email,Gender,Password) values (?,?,?,?,?,?)";
	private String insertCustomer = "insert into Customer (Id,Aadhar,Pan,Address, CreatedTime, ModifiedBy) values (?,?,?,?,?,?)";
	private String mappingDetails = "select * from User left join Customer on User.Id = Customer.Id where User.Id = -1;";

	private Map<String, String> mappingRecords = new HashMap<String, String>();

	public void getMappingDetails() throws InvalidInputException {
		try (PreparedStatement statement = connection.prepareStatement(mappingDetails);
				ResultSet allColumns = statement.executeQuery()) {
			ResultSetMetaData metadata = allColumns.getMetaData();
			int columns = ((ResultSetMetaData) metadata).getColumnCount();
			for (int i = 1; i <= columns; i++) {
				String tempColumn = (String) metadata.getColumnName(i);
				String field = "set" + ((tempColumn).charAt(0) + "").toUpperCase()
						+ tempColumn.substring(1, tempColumn.length());
				mappingRecords.put(tempColumn, field);
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
	}

	@Override
	public int insertCustomer(CustomerDetails customers) throws InvalidInputException {
		InputCheck.checkNull(customers);
		int affectedRows = 0, customerId = 0;
		try (PreparedStatement statement = connection.prepareStatement(insertUser,
				PreparedStatement.RETURN_GENERATED_KEYS)) {
			connection.setAutoCommit(false);
			statement.setString(1, customers.getName());
			statement.setLong(2, customers.getDOB());
			statement.setString(3, customers.getMobile());
			statement.setString(4, customers.getEmail());
			statement.setString(5, customers.getGender());
			statement.setString(6, Common.encryptPassword(customers.getPassword()));

			statement.executeUpdate();
			try (ResultSet record = statement.getGeneratedKeys()) {
				if (record.next()) {
					customerId = record.getInt(1);
				}
			}
			try (PreparedStatement empStatement = connection.prepareStatement(insertCustomer)) {
				empStatement.setInt(1, customerId);
				empStatement.setString(2, customers.getAadhar());
				empStatement.setString(3, customers.getPan());
				empStatement.setString(4, customers.getAddress());
				empStatement.setLong(5, customers.getCreatedTime());
				empStatement.setInt(6, customers.getModifiedBy());
				affectedRows = empStatement.executeUpdate();
				connection.commit();
			}
		} catch (SQLException e) {
			try {
				if (connection != null) {
					connection.rollback();
				}
			} catch (SQLException e1) {
				throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e1);
			}
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return customerId;
	}

	@Override
	public int updateDetails(int id, CustomerDetails customerDeatails, int modifiedBy) throws InvalidInputException {
		InputCheck.checkNegativeInteger(id);

		String query = "update User join Customer on User.Id = Customer.Id set Name = ?,DOB =?,Mobile=?,Email=?,Gender=?,Aadhar=?,Pan=?,Address=?, ModifiedBy = ?,ModifiedTime = ? where User.Id = ?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, customerDeatails.getName());
			statement.setObject(2, customerDeatails.getDOB());
			statement.setObject(3, customerDeatails.getMobile());
			statement.setObject(4, customerDeatails.getEmail());
			statement.setObject(5, customerDeatails.getGender());
			statement.setObject(6, customerDeatails.getAadhar());
			statement.setObject(7, customerDeatails.getPan());
			statement.setObject(8, customerDeatails.getAddress());
			statement.setObject(9, modifiedBy);
			statement.setObject(10, System.currentTimeMillis());
			statement.setObject(11, id);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public int updateRecord(int id, String column, Object value, int modifiedBy) throws InvalidInputException {
		InputCheck.checkNegativeInteger(id);
		String query = "update User join Customer on User.Id = Customer.Id set " + column
				+ " = ? where User.Id = ?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, value);
			statement.setObject(2, id);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public List<CustomerDetails> getCustomCustomer(CustomerDetails customerDetails, List<String> columnToGet,
			String userType) throws InvalidInputException {
		InputCheck.checkNull(customerDetails);
		InputCheck.checkNull(columnToGet);
		getMappingDetails();
		List<CustomerDetails> records = new ArrayList<CustomerDetails>();
		StringBuilder query = new StringBuilder("select ");
		for (String individualColumn : columnToGet) {
			query.append(individualColumn + " ,");
		}
		try {
			query = new StringBuilder(query.subSequence(0, query.length() - 1));
			query.append("from User left join Customer on User.Id = Customer.Id  where ");
			PreparedStatement statement = connection.prepareStatement(query.toString());
			query = new StringBuilder(query.subSequence(0, query.length() - 1));
			int count = 1;
			if (customerDetails.getId() != 0) {
				query.append(" User.Id = ? ");
				count++;
			}
			if (customerDetails.getStatus() != null) {
				if (count > 1) {
					query.append("AND ");
				}
				query.append(" User.Status = ? ");
				count++;
			}
			if (count > 1) {
				query.append("AND ");
			}
			query.append(" User.Type = ? ");
			count++;
			statement = connection.prepareStatement((query.toString()));
			count = 1;
			if (customerDetails.getId() != 0) {
				statement.setInt(count++, customerDetails.getId());
			}
			if (customerDetails.getStatus() != null) {
				if (customerDetails.getStatus().equals("Active")) {
					statement.setString(count++, "Active");
				} else {
					statement.setString(count++, "Inactive");
				}
			}
			statement.setObject(count++, userType);
			try (ResultSet record = statement.executeQuery()) {
				ResultSetMetaData metadata = record.getMetaData();
				int columns = metadata.getColumnCount();
				Method[] userMethods = CustomerDetails.class.getMethods();
				List<String> customerMethodsList = new ArrayList<String>();
				for (Method temp : userMethods) {
					customerMethodsList.add(temp.toString());
				}
				while (record.next()) {
					CustomerDetails tempcustomerDetails = (CustomerDetails) CustomerDetails.class
							.getDeclaredConstructor().newInstance();
					for (int i = 1; i <= columns; i++) {
						String columnName = metadata.getColumnName(i);
						String dataType = metadata.getColumnTypeName(i);
						Method method;
						if (dataType.equals("INT")) {
							method = CustomerDetails.class.getMethod(mappingRecords.get(columnName), int.class);
							method.invoke(tempcustomerDetails, record.getInt(i));
						} else if (dataType.equals("VARCHAR") || dataType.equals("ENUM") || dataType.equals("CHAR")) {
							method = CustomerDetails.class.getMethod(mappingRecords.get(columnName), String.class);
							method.invoke(tempcustomerDetails, record.getString(i));
						} else if (!columnName.equals("DeleteAt") && dataType.equals("MEDIUMTEXT")
								|| dataType.equals("BIGINT")) {
							method = CustomerDetails.class.getMethod(mappingRecords.get(columnName), long.class);
							method.invoke(tempcustomerDetails, record.getLong(i));
						}
					}
					records.add(tempcustomerDetails);
				}
			} catch (SecurityException | IllegalArgumentException | SQLException | InstantiationException
					| IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
				throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}

		return records;
	}

	public int panAadharCheck(String pan, String aadhar) throws InvalidInputException {
		String query = "select * from Customer where Pan = ? or Aadhar = ?";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, pan);
			statement.setObject(2, aadhar);
			try (ResultSet records = statement.executeQuery()) {
				if (records.next()) {
					return 1;
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return 0;
	}

}
