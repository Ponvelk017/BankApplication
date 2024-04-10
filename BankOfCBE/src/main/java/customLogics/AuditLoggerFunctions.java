package customLogics;

import java.util.List;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

import dbLogics.AuditLoggerOperation;
import details.AuditLoggerDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class AuditLoggerFunctions {

	private AuditLoggerOperation auditOperation = new AuditLoggerOperation();
	private BlockingQueue<AuditLoggerDetails> detailsQueue = new LinkedBlockingQueue<>();
	private ExecutorService executor = Executors.newCachedThreadPool();

	public AuditLoggerFunctions() {
		consumer();
	}

	public void insertAuditRecord(AuditLoggerDetails auditDetails) throws InvalidInputException {
		InputCheck.checkNull(auditDetails);
		executor.execute(() -> {
			try {
				detailsQueue.put(auditDetails);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		});
	}

	private void consumer() {
		executor.execute(() -> {
			try {
				while (true) {
					AuditLoggerDetails auditDetails = detailsQueue.take();
					auditOperation.insertRecord(auditDetails);
				}
			} catch (InterruptedException | InvalidInputException e) {
				Thread.currentThread().interrupt();
			}
		});
	}

	public List<AuditLoggerDetails> getAuditDetails(AuditLoggerDetails auditRecords, Map<String, Object> condition)
			throws InvalidInputException {
		return auditOperation.getCustomData(auditRecords, condition);
	}
}
