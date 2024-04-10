package customLogics;

import java.util.List;

import dbLogics.APIOperations;
import details.APIDetails;
import utility.InvalidInputException;

public class APIFunctions {

	private APIOperations apioperations = new APIOperations();

	public String APIKeyGeneration(int userId) throws InvalidInputException {
		return apioperations.newAPIKeyGeneration(userId);
	}

	public APIDetails isValidAPIKey(String apiKey) throws InvalidInputException {
		return apioperations.getAPIKey(apiKey);
	}

	public List<APIDetails> getAllAPI(int limit, int offset) throws InvalidInputException {
		return apioperations.getAllAPIKey(limit, offset);
	}
}
