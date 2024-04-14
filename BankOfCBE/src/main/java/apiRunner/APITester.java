package apiRunner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class APITester {

	public static void main(String[] args) {

		try {
			URL url = new URL("http://localhost:8080/BankOfCBE/api?formType=login&apiKey=ed7afb309de91b2e&id=3&password=a");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			System.out.println(connection.getResponseCode());

			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String data = "";
			while ((data = reader.readLine()) != null) {
				System.out.println(data);
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
