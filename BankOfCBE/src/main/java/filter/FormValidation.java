package filter;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import utility.Common;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet Filter implementation class FormValidation
 */
//@WebFilter("/FormValidation")
public class FormValidation implements Filter {

	/**
	 * Default constructor.
	 */
	public FormValidation() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("form filter");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		if (request.getParameter("formType") == null) {
			RequestDispatcher loginDispatcher = request.getRequestDispatcher("/home");
			loginDispatcher.forward(request, response);
		} else {
			String formType = request.getParameter("formType");
			switch (formType) {
			case "newCustomer": {
				JSONObject responseData = new JSONObject();
				if (request.getParameter("name").matches("^[A-Za-z.]+")) {
					if (request.getParameter("mobile").matches("^[0-9]{10}$")) {
						if (request.getParameter("email").matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
								+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")) {
							LocalDate currentDate = LocalDate.now();
							LocalDate dob = LocalDate.ofInstant(
									Instant.ofEpochMilli(Common.dateToMilli(request.getParameter("dob"))),
									ZoneId.systemDefault());
							Period period = Period.between(dob, currentDate);
							if (period.getYears() >= 18) {
								if (request.getParameter("aadhar").length() == 12) {
									if (request.getParameter("pan").matches("^[A-Z0-9]{10}$")) {
										responseData.put("status", true);
										responseData.put("message", "Success");
										HttpServletResponse httpResponse = (HttpServletResponse) response;
										httpResponse.sendRedirect("/home");
									} else {
										responseData.put("status", false);
										responseData.put("message",
												"Pan should be 10 digit long and contain only Alphabets and numbers");
									}
								} else {
									responseData.put("status", false);
									responseData.put("message", "Aadhar should be 12 digit long");
								}
							} else {
								responseData.put("status", false);
								responseData.put("message", "Age should be more than 18");
							}

						} else {
							responseData.put("status", false);
							responseData.put("message", "Invalid Email");
						}
					} else {
						responseData.put("status", false);
						responseData.put("message", "Mobile number should contain only 10 numbers");
					}
				} else {
					responseData.put("status", false);
					responseData.put("message", "Name should only contain Alphabets");
				}
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "newEmployee": {
				JSONObject responseData = new JSONObject();
				if (request.getParameter("name").matches("^[A-Za-z.]+")) {
					if (request.getParameter("mobile").matches("^[0-9]{10}$")) {
						if (request.getParameter("email").matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
								+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")) {
							LocalDate currentDate = LocalDate.now();
							LocalDate dob = LocalDate.ofInstant(
									Instant.ofEpochMilli(Common.dateToMilli(request.getParameter("dob"))),
									ZoneId.systemDefault());
							Period period = Period.between(dob, currentDate);
							if (period.getYears() >= 18) {
								if (request.getParameter("branch").matches("^[A-Z0-9]{10}$")) {
									responseData.put("status", true);
									responseData.put("message", "Success");
									HttpServletResponse httpResponse = (HttpServletResponse) response;
									httpResponse.sendRedirect("/home");
								} else {
									responseData.put("status", false);
									responseData.put("message",
											"Branch should be 10 digit long and contain only Alphabets and numbers");
								}
							} else {
								responseData.put("status", false);
								responseData.put("message", "Age should be more than 18");
							}

						} else {
							responseData.put("status", false);
							responseData.put("message", "Invalid Email");
						}
					} else {
						responseData.put("status", false);
						responseData.put("message", "Mobile number should contain only 10 numbers");
					}
				} else {
					responseData.put("status", false);
					responseData.put("message", "Name should only contain Alphabets");
				}
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "newAccount": {
				JSONObject responseData = new JSONObject();
				if (request.getParameter("id").matches("\\d{1,3}")) {
					if (request.getParameter("ifsc").matches("^[A-Z0-9]{10}$")) {
						responseData.put("status", true);
						responseData.put("message", "Success");
						HttpServletResponse httpResponse = (HttpServletResponse) response;
						httpResponse.sendRedirect("/home");
					} else {
						responseData.put("status", false);
						responseData.put("message",
								"Branch Ifsc should be 10 digit long and contain only Alphabets and numbers");
					}
				} else {
					responseData.put("status", false);
					responseData.put("message", "Id should be of 4 digits");
				}
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			case "changePassword": {
				JSONObject responseData = new JSONObject();
				if (request.getParameter("newPassword").matches(
						"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()\\-_=+\\\\|[\\]{};:'\",.<>/?]).{8,}$\n"
								+ "")) {
					responseData.put("status", true);
					responseData.put("message", "Success");
					HttpServletResponse httpResponse = (HttpServletResponse) response;
					httpResponse.sendRedirect("/home");
				} else {
					responseData.put("status", false);
					responseData.put("message",
							"New Password should contains atleast one Uppercase, Lowercase, Number, pecial character");
				}
				response.setContentType("application/json");
				response.getWriter().write(responseData.toString());
			}
				break;
			}
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
