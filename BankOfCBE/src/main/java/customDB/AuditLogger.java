package customDB;

import java.util.List;
import java.util.Map;

import details.AuditLoggerDetails;
import utility.InvalidInputException;

public interface AuditLogger {

	public int insertRecord(AuditLoggerDetails auditDetails) throws InvalidInputException;

	public List<AuditLoggerDetails> getCustomData(AuditLoggerDetails auditDetails, Map<String, Object> condition)
			throws InvalidInputException;
}
