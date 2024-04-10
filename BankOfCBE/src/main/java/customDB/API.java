package customDB;

import details.APIDetails;
import utility.InvalidInputException;

public interface API {

	public String apiKeyGeneration(int userId) throws InvalidInputException;

	public String newAPIKeyGeneration(int userId) throws InvalidInputException;

	public int invalidateAPIKey(String apiKey) throws InvalidInputException;

	public APIDetails getAPIKey(String apiKey) throws InvalidInputException;

}
