package dbLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import details.AuditLoggerDetails;
import utility.DBConnection;
import utility.InputCheck;
import utility.InvalidInputException;

public class AuditLoggerOperation {

	Connection connection = DBConnection.getConnection();

	public int insertRecord(AuditLoggerDetails auditDetails) throws InvalidInputException {
		InputCheck.checkNull(auditDetails);
		String qurey = "insert into AuditLogger(UserId,TargetId,Description,ModifiedTime,Status) values(?,?,?,?,?)";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(qurey)) {
			statement.setInt(1, auditDetails.getUserId());
			statement.setString(2, auditDetails.getTargetId());
			statement.setString(3, auditDetails.getDescription());
			statement.setLong(4, auditDetails.getModifiedTime());
			statement.setString(5, auditDetails.getStatus());
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	public List<AuditLoggerDetails> getCustomData(AuditLoggerDetails auditDetails, Map<String, Object> condition)
			throws InvalidInputException {
		InputCheck.checkNull(auditDetails);
		InputCheck.checkNull(condition);
		List<AuditLoggerDetails> result = new ArrayList<AuditLoggerDetails>();
		StringBuilder query = new StringBuilder("select *");
		int offsetValue = 0;
		if (condition.get("offset") != null) {
			offsetValue = (int) condition.get("offset");
		}
		try {
			PreparedStatement statement = connection.prepareStatement(query.toString());
			query.append(" from AuditLogger where ");
			int count = 1;
			if (auditDetails.getUserId() != 0) {
				query.append("UserId = ? ");
				count++;
			}
			if (auditDetails.getTargetId() != null) {
				if (count > 1) {
					query.append("AND ");
				}
				query.append("TargetId = ? ");
				count++;
			}
			if ((long) condition.get("From") != 0) {
				if (count > 1) {
					query.append(" AND ");
				}
				query.append("ModifiedTime >= ?");
				count++;
			}
			if ((long) condition.get("To") != 0) {
				if (count > 1) {
					query.append(" AND ");
				}
				query.append("ModifiedTime <= ?");
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
			System.out.println(query.toString());
			statement = connection.prepareStatement(query.toString());
			count = 1;
			if (auditDetails.getUserId() != 0) {
				statement.setLong(count++, auditDetails.getUserId());
			}
			if (auditDetails.getTargetId() != null) {
				statement.setString(count++, auditDetails.getTargetId());
			}
			if ((long) condition.get("From") != 0) {
				statement.setLong(count++, (long) condition.get("From"));
			}
			if ((long) condition.get("To") != 0) {
				statement.setLong(count++, (long) condition.get("To"));
			}
			ResultSet record = statement.executeQuery();
			while (record.next()) {
				AuditLoggerDetails auditRecords = new AuditLoggerDetails();
				auditRecords.setId(record.getInt("Id"));
				auditRecords.setUserId(record.getInt("UserId"));
				auditRecords.setTargetId(record.getString("TargetId"));
				auditRecords.setDescription(record.getString("Description"));
				auditRecords.setModifiedTime(record.getLong("ModifiedTime"));
				auditRecords.setStatus(record.getString("Status"));
				result.add(auditRecords);
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return result;
	}
}
