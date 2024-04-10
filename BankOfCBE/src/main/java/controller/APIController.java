package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import customLogics.UserFunctions;
import utility.InvalidInputException;

/* @WebServlet("/APIController") */
public class APIController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserFunctions userFunctions = new UserFunctions();

	public APIController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String formType = request.getParameter("formType");
		try {
			switch (formType) {
			case "login": {
				String userId = request.getParameter("id");
				String password = request.getParameter("password");
				if (userId != null && password != null) {
					Map<String, Object> blockedUser;
					blockedUser = userFunctions.blockedDetails(Integer.parseInt(userId));
					JSONObject loginJson = new JSONObject();
					loginJson.put("UserId", userId);
					loginJson.put("IsAuth", userFunctions.login(Integer.parseInt(userId), password));
					loginJson.put("UserType", userFunctions.getSinglRecord("Type", Integer.parseInt(userId)));
					loginJson.put("Blocked-status", ((int) blockedUser.get("InvalidAttempts") == 2) ? true : false);
					loginJson.put("Attempts", blockedUser.get("InvalidAttempts"));
					System.out.println(userId + " " + password);
					response.setContentType("application/json");
					response.getWriter().write(loginJson.toString());
				}
			}
			}
		} catch (NumberFormatException | InvalidInputException e) {
			e.printStackTrace();
		}
	}
}
