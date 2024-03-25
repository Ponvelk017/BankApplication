<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/include/HomeStyle.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/include/StyleSheet.css" />
<title>Home</title>
<style>
</style>
</head>

<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<div class="content">
		<h1 class="welcome">Bank Of CBE Welcome's you</h1>
		<div class="aboutbank">
			<div class="aboutbank-img">
				<img src="Images/bank1.png" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; border-radius: 5%; padding-bottom: 5%;">
			</div>

			<p class="bank-contet">Bank of CBE, known for its sterling
				reputation in the financial sector, stands as a beacon of excellence
				among its contemporaries. With a steadfast commitment to providing
				unparalleled services, it has emerged as a preferred choice for
				discerning customers. Renowned for offering competitive interest
				rates, Bank of CBE ensures optimal returns on investments, setting a
				benchmark for financial institutions nationwide. Its unwavering
				dedication to customer satisfaction is evident through its exemplary
				customer support, where trained professionals are readily available
				to address queries and concerns, fostering trust and reliability.
				Offering a diverse range of account options, from savings to current
				accounts, Bank of CBE caters to the varied needs of its clientele,
				ensuring flexibility and convenience. Moreover, the bank's
				user-friendly interface simplifies account management and
				facilitates seamless transactions, making it effortless for
				customers to monitor and control their finances. With robust
				security measures in place, customers can conduct transactions with
				confidence, knowing their funds are safeguarded. In addition to its
				financial prowess, Bank of CBE distinguishes itself through its
				philanthropic endeavors, contributing to the welfare of society and
				fostering community development. As a trailblazer in the banking
				industry, Bank of CBE continues to innovate and evolve, staying
				ahead of the curve to meet the evolving needs of its customers and
				maintain its position as the epitome of banking excellence.</p>
		</div>
		<div class="aboutbank">
			<p class="bank-contet" style="padding-left: 5%;">Bank of CBE,
				renowned for its steadfast commitment to customer satisfaction,
				offers a comprehensive array of banking services tailored to meet
				the diverse financial needs of its clientele. With seamless options
				for depositing, withdrawing, and transferring funds, customers
				experience unparalleled convenience and efficiency in managing their
				finances. Whether it's making transactions within the bank's network
				or to other financial institutions, Bank of CBE ensures swift and
				secure transfers, fostering trust and reliability among its patrons.

				Moreover, the bank provides easy access to account statements,
				empowering customers to monitor their financial transactions with
				transparency and accuracy. Profile management is simplified through
				user-friendly interfaces, allowing customers to update personal
				information and preferences effortlessly. Additionally, customers
				can access detailed information about the branch where their account
				is held, including contact details and operating hours, facilitating
				seamless interaction with the bank's physical locations. Committed
				to excellence in customer service, Bank of CBE continually innovates
				to enhance the banking experience, leveraging technology and
				customer feedback to deliver cutting-edge solutions. With a legacy
				of reliability and integrity, Bank of CBE stands as a beacon of
				trust in the banking industry, serving as a preferred choice for
				individuals and businesses alike.</p>
			<div class="aboutbank-img"
				style="padding-right: 5%; padding-left: 0;">
				<img src="Images/bank2.jpg" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; border-radius: 5%; padding-bottom: 5%;">
			</div>
		</div>
		<div class="aboutbank">
			<div class="aboutbank-img">
				<img src="Images/bank3.png" alt="Profile Picture"
					class="profile-picture"
					style="margin-right: 20px; border-radius: 5%; padding-bottom: 5%;">
			</div>

			<p class="bank-contet">Bank of CBE prides itself on delivering
				exceptional customer service, placing utmost importance on
				addressing and resolving customer concerns promptly and effectively.
				Our dedicated team of professionals is committed to ensuring that
				every customer receives the assistance they need, striving to exceed
				expectations at every turn. With a proactive approach, we
				proactively anticipate and mitigate potential issues, aiming to
				create a seamless banking experience for all. At Bank of CBE,
				customer satisfaction is not just a goal but a fundamental principle
				guiding our operations. Through open communication channels and
				personalized support, we foster strong relationships with our
				customers, earning their trust and loyalty. We understand that each
				customer is unique, which is why we tailor our services to meet
				their specific needs and preferences. Our customer-centric approach
				extends beyond transactions; we genuinely care about the well-being
				and financial success of our customers, offering guidance and
				support every step of the way. With a culture centered on empathy
				and understanding, we prioritize listening to our customers, valuing
				their feedback, and continuously improving our services. At Bank of
				CBE, we are dedicated to building lasting relationships built on
				trust, reliability, and mutual respect. Your satisfaction is our top
				priority, and we go above and beyond to ensure that your banking
				experience is nothing short of exceptional. Experience the
				difference with Bank of CBE, where your needs come first, and your
				concerns are always addressed with care and diligence.</p>
		</div>

		<h2 class="welcome" style="padding-bottom: 5%;">We thank you for
			choosing our Bank</h2>
	</div>
</body>

</html>