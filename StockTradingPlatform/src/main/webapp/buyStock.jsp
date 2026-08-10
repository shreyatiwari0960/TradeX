<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%
String stockId = request.getParameter("stockId");
String company = request.getParameter("company");
String symbol = request.getParameter("symbol");
String price = request.getParameter("price");
%>

<%@ page import="com.tradex.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("index.jsp");
    return;
}
%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Buy Stock</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow p-4">

<h2 class="mb-4">

Buy Stock

</h2>

<form action="BuyServlet" method="post">

<input type="hidden"
name="stockId"
value="<%= stockId %>">
<input type="hidden"
name="price"
value="<%= price %>">

<div class="mb-3">

<label class="form-label">

Company

</label>

<input
type="text"
class="form-control"
value="<%= company %>"
readonly>

</div>

<div class="mb-3">

<label class="form-label">

Symbol

</label>

<input
type="text"
class="form-control"
value="<%= symbol %>"
readonly>

</div>

<div class="mb-3">

<label class="form-label">

Current Price

</label>

<input
type="text"
class="form-control"
value="₹ <%= price %>"
readonly>

</div>

<div class="mb-3">

<label class="form-label">

Quantity

</label>

<input
type="number"
name="quantity"
class="form-control"
min="1"
required>

</div>

<button
class="btn btn-success">

Confirm Buy

</button>

<a href="MarketServlet"
class="btn btn-secondary">

Cancel

</a>

</form>

</div>

</div>

</body>

</html>