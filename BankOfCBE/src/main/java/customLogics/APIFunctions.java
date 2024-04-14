package customLogics;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import customDB.API;
import details.APIDetails;
import utility.InvalidInputException;

public class APIFunctions {

	private API apioperations;

	public APIFunctions() {
		try {
			Class<?> apiClass = Class.forName("dbLogics.APIOperations");
			apioperations = (API) apiClass.getDeclaredConstructor().newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
	}

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
