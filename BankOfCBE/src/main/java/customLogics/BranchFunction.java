package customLogics;

import java.util.List;

import dbLogics.BranchOpertaion;
import details.BranchDetails;
import utility.InputCheck;
import utility.InvalidInputException;

public class BranchFunction {

	BranchOpertaion branchOperation = new BranchOpertaion();

	public int addBranch(BranchDetails branch) throws InvalidInputException {
		InputCheck.checkNull(branch);
		return branchOperation.insertBranch(branch);
	}

	public int updateRecord(BranchDetails branchDetails, int id) throws InvalidInputException {
		InputCheck.checkNegativeInteger(id);
		return branchOperation.updateBranch(branchDetails, id);
	}

	public BranchDetails getBranchDetails(Object value) throws InvalidInputException {
		InputCheck.checkNull(value);
		return branchOperation.getDetails(value);
	}

	public List<BranchDetails> getBranchDetails(int limit, int offset) throws InvalidInputException {
		return branchOperation.getBranches(limit, offset);
	}
}
