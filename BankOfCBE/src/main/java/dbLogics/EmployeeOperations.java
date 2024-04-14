package dbLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import customDB.Employee;
import details.EmployeeDetails;
import utility.DBConnection;
import utility.InputCheck;
import utility.InvalidInputException;

public class EmployeeOperations implements Employee {

	private Connection connection = DBConnection.getConnection();

	private String insertUser = "insert into User (Name,DOB,Mobile,Email,Gender,Password) values (?,?,?,?,?,?)";
	private String insertEmployee = "insert into Employee (Id,Branch,Admin, CreatedTime, ModifiedBy) values (?,?,?,?,?)";

	@Override
	public List<Integer> insertEmployee(List<EmployeeDetails> employees) throws InvalidInputException {
		InputCheck.checkNull(employees);
		System.out.println("hi");
		int affectedRows = 0, employeeId = 0;
		List<Integer> result = new ArrayList<Integer>();
		for (EmployeeDetails employee : employees) {
			try (PreparedStatement statement = connection.prepareStatement(insertUser,
					PreparedStatement.RETURN_GENERATED_KEYS)) {
				connection.setAutoCommit(false);
				statement.setString(1, employee.getName());
				statement.setLong(2, employee.getDOB());
				statement.setString(3, employee.getMobile());
				statement.setString(4, employee.getEmail());
				statement.setString(5, employee.getGender());
				statement.setString(6, employee.getPassword());
				statement.executeUpdate();
				try (ResultSet record = statement.getGeneratedKeys()) {
					if (record.next()) {
						employeeId = record.getInt(1);
					}
				}
				try (PreparedStatement empStatement = connection.prepareStatement(insertEmployee)) {
					empStatement.setInt(1, employeeId);
					empStatement.setString(2, employee.getBranch());
					empStatement.setBoolean(3, employee.getAdmin());
					empStatement.setLong(4, employee.getCreatedTime());
					empStatement.setInt(5, employee.getModifiedBy());
					affectedRows = empStatement.executeUpdate();
					result.add(affectedRows);
					connection.commit();
				}
			} catch (SQLException e) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e1);
				}
				throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
			}
		}
		return result;
	}

	@Override
	public Object getSingleRecord(String columnToGet, String column, Object value) throws InvalidInputException {
		InputCheck.checkNull(value);
		InputCheck.checkNull(column);
		InputCheck.checkNull(columnToGet);
		String query = "select " + columnToGet + " from Employee where " + column + " = ?";
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
	public int updateDetails(int Id, String column, Object value) throws InvalidInputException {
		InputCheck.checkNegativeInteger(Id);
		InputCheck.checkNull(column);
		InputCheck.checkNull(value);
		String query = "update User join Employee on User.Id = Employee.ID set " + column + " = ? where User.Id = ?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, value);
			statement.setInt(2, Id);
			affectedRows = statement.executeUpdate();

		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public List<EmployeeDetails> getCustomEmployee(EmployeeDetails employeeDetails, List<String> columnToGet)
			throws InvalidInputException {
		InputCheck.checkNull(employeeDetails);
		InputCheck.checkNull(columnToGet);
		List<EmployeeDetails> result = new ArrayList<EmployeeDetails>();
		StringBuilder query = new StringBuilder("select ");
		for (String individualColumn : columnToGet) {
			query.append(individualColumn + " ,");
		}
		try {
			query = new StringBuilder(query.subSequence(0, query.length() - 1));
			query.append("from User left join Employee on User.Id = Employee.Id  where ");
			PreparedStatement statement = connection.prepareStatement(query.toString());
			query = new StringBuilder(query.subSequence(0, query.length() - 1));
			int count = 1;
			if (employeeDetails.getId() != 0) {
				query.append(" User.Id = ? ");
				count++;
			}
			if (employeeDetails.getStatus() != null) {
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
			if (employeeDetails.getId() != 0) {
				statement.setInt(count++, employeeDetails.getId());
			}
			if (employeeDetails.getStatus() != null) {
				if (employeeDetails.getStatus().equals("Active")) {
					statement.setString(count++, "Active");
				} else {
					statement.setString(count++, "Inactive");
				}
			}
			statement.setObject(count++, "1");
			try (ResultSet record = statement.executeQuery()) {
				while(record.next()) {
					EmployeeDetails employeeDet = new EmployeeDetails();
					employeeDet.setId(record.getInt("Id"));
					employeeDet.setName(record.getString("Name"));
					employeeDet.setDOB(record.getLong("DOB"));
					employeeDet.setMobile(record.getString("Mobile"));
					employeeDet.setEmail(record.getString("Email"));
					employeeDet.setStatus(record.getString("Status"));
					employeeDet.setGender(record.getString("Gender"));
					employeeDet.setType(record.getString("Type"));
					employeeDet.setBranch(record.getString("Branch"));
					employeeDet.setAdmin((record.getString("Admin").equals("1")?true:false));
					result.add(employeeDet);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return result;
	}
}
