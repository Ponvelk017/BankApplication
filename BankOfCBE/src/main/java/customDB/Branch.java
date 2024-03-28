package customDB;

import java.util.List;

import details.BranchDetails;
import utility.InvalidInputException;

public interface Branch {

	public int insertBranch(BranchDetails branchDetails) throws InvalidInputException;

	public int updateBranch(BranchDetails branchDetails , int id) throws InvalidInputException;

	public BranchDetails getDetails(Object value) throws InvalidInputException;

	public List<BranchDetails> getBranches(int limit, int offset) throws InvalidInputException;

}
