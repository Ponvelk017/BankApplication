package dbLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import customDB.API;
import details.APIDetails;
import utility.Common;
import utility.DBConnection;
import utility.InvalidInputException;

public class APIOperations implements API {

	private Connection connection = DBConnection.getConnection();

	@Override
	public String apiKeyGeneration(int userId) throws InvalidInputException {
		String rawKey = userId + "" + System.currentTimeMillis();
		String encryptedKey = Common.encryptPassword(rawKey);
		return encryptedKey.substring(0, 16);
	}

	@Override
	public String newAPIKeyGeneration(int userId) throws InvalidInputException {
		String query = "insert into APIUser(UserId,APIKey,IsValid,CreatedAt) values(?,?,?,?)";
		String apiKey = apiKeyGeneration(userId);
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, userId);
			statement.setString(2, apiKey);
			statement.setString(3, "1");
			statement.setLong(4, System.currentTimeMillis());
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return apiKey;
	}

	@Override
	public int invalidateAPIKey(String apiKey) throws InvalidInputException {
		String query = "update APIUser set IsValid = ?,ModifiedAt =? where APIKey = ?";
		int affectedRows = 0;
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, "0");
			statement.setLong(2, System.currentTimeMillis());
			statement.setString(3, apiKey);
			affectedRows = statement.executeUpdate();
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return affectedRows;
	}

	@Override
	public APIDetails getAPIKey(String apiKey) throws InvalidInputException {
		String query = "select * from APIUser where APIKey = ?";
		System.out.println(apiKey);
		APIDetails apiDetails = new APIDetails();
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, apiKey);
			try (ResultSet record = statement.executeQuery()) {
				if (record.next()) {
					if (record.getLong("CreatedAt") + 604800000 >= System.currentTimeMillis()) {
						invalidateAPIKey(apiKey);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, apiKey);
			try (ResultSet record = statement.executeQuery()) {
				if (record.next()) {
					apiDetails.setId(record.getInt("Id"));
					apiDetails.setUserId(record.getInt("UserId"));
					apiDetails.setApiKey(record.getString("APIKey"));
					apiDetails.setIsValid(record.getString("IsValid"));
					apiDetails.setCreatedAt(record.getLong("CreatedAt"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return apiDetails;
	}

	public List<APIDetails> getAllAPIKey(int limit, int offset) throws InvalidInputException {
		String query = "select * from APIUser limit " + limit + " offset " + offset;
		List<APIDetails> result = new ArrayList<APIDetails>();
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			try (ResultSet record = statement.executeQuery()) {
				while (record.next()) {
					APIDetails apiDetails = new APIDetails();
					apiDetails.setId(record.getInt("Id"));
					apiDetails.setUserId(record.getInt("UserId"));
					apiDetails.setApiKey(record.getString("APIKey"));
					apiDetails.setIsValid(record.getString("IsValid"));
					apiDetails.setCreatedAt(record.getLong("CreatedAt"));
					result.add(apiDetails);
				}
			}
		} catch (SQLException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return result;
	}
}
