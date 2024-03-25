package utility;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Common {

	public static long dateToMilli(String date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		long milliSecond = 0l;
		try {
		    Date dateMilli = dateFormat.parse(date);
		    milliSecond = dateMilli.getTime();
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		return milliSecond;

	}

	public static String milliToDate(long millis) {
		LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(millis), ZoneId.systemDefault());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return localDateTime.format(formatter);
	}

	public static long currentDate() {
		LocalDate currentDate = LocalDate.now();
		long currentTimeMillis = currentDate.toEpochDay() * 24 * 60 * 60 * 1000;
		return currentTimeMillis;
	}

	public static long beforeNDate(int days) {
		LocalDate currentDate = LocalDate.now();
		LocalDate dateBefore30Days = currentDate.minusDays(days);
		long dateBefore = dateBefore30Days.toEpochDay() * 24 * 60 * 60 * 1000;
		return dateBefore;
	}

	public static String encryptPassword(String password) throws InvalidInputException {
		InputCheck.checkNull(password);
		StringBuilder encryptedPassword = new StringBuilder();
		try {
			MessageDigest passwordEncyptor = MessageDigest.getInstance("SHA-256");
			byte[] encryptedBytes = passwordEncyptor.digest(password.getBytes());
			for (byte individualByte : encryptedBytes) {
				String singleByte = Integer.toHexString(0xff & individualByte);
				if (singleByte.length() == 1) {
					encryptedPassword.append('0');
				}
				encryptedPassword.append(singleByte);
			}
		} catch (NoSuchAlgorithmException e) {
			throw new InvalidInputException("An Error Occured , Sorry for the Inconvenience", e);
		}
		return encryptedPassword.toString();
	}

}
