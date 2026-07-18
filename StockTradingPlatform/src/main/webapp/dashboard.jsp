<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>TradeX Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link rel="stylesheet"
href="css/style.css">

</head>

<body>

<div class="layout">

    <%@ include file="components/sidebar.jsp" %>

    <div class="main">

        <%@ include file="components/navbar.jsp" %>

		<main class="dashboard">

		    <%@ include file="components/welcome.jsp" %>
		
		    <%@ include file="components/statistics.jsp" %>
		
		    <%@ include file="components/market.jsp" %>
		
		    <%@ include file="components/trending.jsp" %>
		
		    <%@ include file="components/portfolio.jsp" %>
		
		</main>
        <%@ include file="components/footer.jsp" %>

    </div>

</div>

<script src="js/script.js"></script>

</body>

</html>