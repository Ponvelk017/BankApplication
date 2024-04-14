package customLogics;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import customDB.AuditLogger;
import details.AuditLoggerDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class AuditLoggerFunctions {

	private AuditLogger auditOperation;
	private ExecutorService executor = Executors.newFixedThreadPool(2);

	public AuditLoggerFunctions() {
		try {
			Class<?> auditClass = Class.forName("dbLogics.AuditLoggerOperation");
			auditOperation = (AuditLogger) auditClass.getDeclaredConstructor().newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
	}
	
	public void insertAuditRecord(AuditLoggerDetails auditDetails) throws InvalidInputException {
		InputCheck.checkNull(auditDetails);
		executor.execute(consumer(auditDetails));
	}

	private Runnable consumer(AuditLoggerDetails auditDetails) {
		return new Runnable() {
			@Override
			public void run() {
				try {
					auditOperation.insertRecord(auditDetails);
				} catch (InvalidInputException e) {
					e.printStackTrace();
				}
			}
		};
	}

	public List<AuditLoggerDetails> getAuditDetails(AuditLoggerDetails auditRecords, Map<String, Object> condition)
			throws InvalidInputException {
		return auditOperation.getCustomData(auditRecords, condition);
	}
}
