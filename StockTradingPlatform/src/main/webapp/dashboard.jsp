<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tradex.model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("index.jsp");
    return;
}
%>

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

    <jsp:include page="components/sidebar.jsp" />

    <div class="main">

        <jsp:include page="components/navbar.jsp" />

        <main class="dashboard">

            <jsp:include page="components/welcome.jsp" />

            <jsp:include page="components/statistics.jsp" />

            <jsp:include page="components/market.jsp" />

            <jsp:include page="components/trending.jsp" />

			<jsp:include page="components/portfolioPreview.jsp" />
        </main>

        <jsp:include page="components/footer.jsp" />

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/script.js"></script>

</body>

</html>