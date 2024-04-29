package apiRunner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class APITester {

	public static void main(String[] args) {

		try {
			System.setProperty("javax.net.ssl.trustStore", "/home/ponvel-pt-7323/keystore.jks");
			System.setProperty("javax.net.ssl.trustStorePassword", "Ponvel@kumar1");
			
			HttpsURLConnection.setDefaultHostnameVerifier((hostname, session) -> true);
			URL url = new URL("https://localhost:8443/api/customer/3");
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
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
