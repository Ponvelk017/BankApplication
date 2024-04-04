package dbLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import customDB.Branch;
import customDB.Complaint;
import details.BranchDetails;
import utility.DBConnection;
import utility.InputCheck;
import utility.InvalidInputException;

public class BranchOpertaion implements Branch {

	private Connection connection = DBConnection.getConnection();

	@Override
	public int insertBranch(BranchDetails branchDetails) throws InvalidInputException {
		InputCheck.checkNull(branchDetails);
		int affectedrows = 0;
		String query = "insert into Branch(IFSCCode,Address,ManagerId,Contact) values(?,?,?,?)";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, branchDetails.getIfscCode());
			statement.setString(2, branchDetails.getAddress());
			statement.setInt(3, branchDetails.getManagerId());
			statement.setLong(4, branchDetails.getPhoneNumber());
			affectedrows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedrows;
	}

	@Override
	public int updateBranch(BranchDetails branchDetails, int id) throws InvalidInputException {
		String query = "update Branch set Address = ?,ManagerId = ? ,Contact = ? where Id =?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, branchDetails.getAddress());
			statement.setObject(2, branchDetails.getManagerId());
			statement.setObject(3, branchDetails.getPhoneNumber());
			statement.setInt(4, id);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public List<BranchDetails> getDetails(Object value) throws InvalidInputException {
		InputCheck.checkNull(value);
		List<BranchDetails> result = new ArrayList<BranchDetails>();
		String query = "select * from Branch where Id = ? or IFSCCode = ? ";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, value);
			statement.setObject(2, value);
			try (ResultSet record = statement.executeQuery()) {
				while (record.next()) {
					BranchDetails branchDetails = new BranchDetails();
					branchDetails.setId(record.getInt("Id"));
					branchDetails.setIfscCode(record.getString("IFSCCode"));
					branchDetails.setAddress(record.getString("Address"));
					branchDetails.setManagerId(record.getInt("ManagerId"));
					branchDetails.setPhoneNumber(record.getLong("Contact"));
					result.add(branchDetails);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return result;
	}

	@Override
	public List<BranchDetails> getBranches(int limit, int offset) throws InvalidInputException {
		List<BranchDetails> results = new ArrayList<BranchDetails>();
		String query = "select * from Branch limit " + limit + " offset " + offset;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			try (ResultSet record = statement.executeQuery()) {
				while (record.next()) {
					BranchDetails branchDetails = new BranchDetails();
					branchDetails.setId(record.getInt("Id"));
					branchDetails.setIfscCode(record.getString("IFSCCode"));
					branchDetails.setAddress(record.getString("Address"));
					branchDetails.setManagerId(record.getInt("ManagerId"));
					branchDetails.setPhoneNumber(record.getLong("Contact"));
					results.add(branchDetails);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return results;
	}

	public int addComplaint(Complaint complaint) throws InvalidInputException {
		String query = "insert into Complaint (UserId,ComplaintType,Discription) values(?,?,?)";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setObject(1, complaint.getUserId());
			statement.setObject(2, complaint.getComplaintType());
			statement.setObject(3, complaint.getDiscription());
			return statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
	}

}
