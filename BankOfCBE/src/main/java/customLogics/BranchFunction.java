package customLogics;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import customDB.Branch;
import customDB.Complaint;
import details.BranchDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class BranchFunction {

	Branch branchOperation;

	public BranchFunction() {
		try {
			Class<?> branchClass = Class.forName("dbLogics.BranchOpertaion");
			branchOperation = (Branch) branchClass.getDeclaredConstructor().newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
	}

	public int addBranch(BranchDetails branch) throws InvalidInputException {
		InputCheck.checkNull(branch);
		return branchOperation.insertBranch(branch);
	}

	public int updateRecord(BranchDetails branchDetails, int id, int modifiedBy) throws InvalidInputException {
		InputCheck.checkNegativeInteger(id);
		return branchOperation.updateBranch(branchDetails, id, modifiedBy);
	}

	public List<BranchDetails> getBranchDetails(Object value) throws InvalidInputException {
		InputCheck.checkNull(value);
		return branchOperation.getDetails(value);
	}

	public List<BranchDetails> getBranchDetails(int limit, int offset) throws InvalidInputException {
		return branchOperation.getBranches(limit, offset);
	}

	public void newComplaint(Complaint complaint) {

	}
}
