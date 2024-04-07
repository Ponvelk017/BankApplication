package customLogics;

import java.util.List;
import java.util.Map;

import dbLogics.AuditLoggerOperation;
import details.AuditLoggerDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class AuditLoggerFunctions {

	private AuditLoggerOperation auditOperation = new AuditLoggerOperation();

	public int insertAuditRecord(AuditLoggerDetails auditDetails) throws InvalidInputException {
		InputCheck.checkNull(auditDetails);
		return auditOperation.insertRecord(auditDetails);
	}
	
	public List<AuditLoggerDetails> getAuditDetails(AuditLoggerDetails auditRecords, Map<String, Object> condition)
			throws InvalidInputException{
		return auditOperation.getCustomData(auditRecords, condition);
	}
}
