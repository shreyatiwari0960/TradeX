<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tradex.model.User"%>
<%@ page import="com.tradex.model.Transaction"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    List<Transaction> transactions =
        (List<Transaction>) request.getAttribute("transactions");

    Integer totalTransactions =
        (Integer) request.getAttribute("totalTransactions");

    Integer buyOrders =
        (Integer) request.getAttribute("buyOrders");

    Integer sellOrders =
        (Integer) request.getAttribute("sellOrders");

    Double totalTradeValue =
        (Double) request.getAttribute("totalTradeValue");

    if (transactions == null) {
        transactions = new java.util.ArrayList<Transaction>();
    }

    if (totalTransactions == null) {
        totalTransactions = 0;
    }

    if (buyOrders == null) {
        buyOrders = 0;
    }

    if (sellOrders == null) {
        sellOrders = 0;
    }

    if (totalTradeValue == null) {
        totalTradeValue = 0.0;
    }
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Transactions | TradeX</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">


<!-- Bootstrap -->

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<!-- Font Awesome -->

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


<!-- TradeX CSS -->

<link
rel="stylesheet"
href="css/style.css">


<style>

.transactions-page {

    background: #f4f7fc;

    min-height: calc(100vh - 70px);

    padding: 40px;

}


/* PAGE HEADER */

.transaction-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 30px;

}


.transaction-title {

    display: flex;

    align-items: center;

    gap: 18px;

}


.transaction-title-icon {

    width: 58px;

    height: 58px;

    border-radius: 18px;

    background: #eaf2ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 25px;

}


.transaction-title h1 {

    margin: 0;

    font-size: 38px;

    font-weight: 700;

    color: #111b35;

}


.transaction-title p {

    margin: 5px 0 0;

    color: #71809d;

    font-size: 16px;

}


/* DASHBOARD BUTTON */

.dashboard-btn {

    background: #2864e8;

    color: white;

    padding: 15px 24px;

    border-radius: 15px;

    text-decoration: none;

    font-weight: 600;

    display: inline-flex;

    align-items: center;

    gap: 10px;

    transition: 0.2s;

}


.dashboard-btn:hover {

    color: white;

    background: #1e55ce;

}


/* STATISTICS */

.transaction-stats {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 24px;

    margin-bottom: 30px;

}


.transaction-card {

    background: white;

    border-radius: 20px;

    padding: 28px;

    box-shadow:
        0 8px 25px rgba(32, 56, 85, 0.08);

    position: relative;

    overflow: hidden;

}


.transaction-card::after {

    content: "";

    position: absolute;

    width: 100px;

    height: 100px;

    background: #f4f7fc;

    border-radius: 50%;

    right: -35px;

    bottom: -40px;

}


.stat-icon {

    width: 48px;

    height: 48px;

    border-radius: 14px;

    background: #edf3ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 20px;

    margin-bottom: 20px;

}


.stat-label {

    color: #71809d;

    font-size: 13px;

    font-weight: 600;

    text-transform: uppercase;

    letter-spacing: 0.4px;

}


.stat-value {

    color: #111b35;

    font-size: 29px;

    font-weight: 700;

    margin-top: 7px;

}


/* HISTORY */

.transaction-history {

    background: white;

    border-radius: 20px;

    box-shadow:
        0 8px 25px rgba(32, 56, 85, 0.08);

    overflow: hidden;

}


.history-header {

    padding: 28px;

    border-bottom: 1px solid #edf0f5;

}


.history-header h2 {

    margin: 0;

    color: #111b35;

    font-size: 24px;

    font-weight: 700;

}


.history-header p {

    margin: 6px 0 0;

    color: #71809d;

}


/* TABLE */

.transaction-table {

    width: 100%;

    border-collapse: collapse;

}


.transaction-table th {

    background: #f8faff;

    color: #71809d;

    font-size: 12px;

    text-transform: uppercase;

    letter-spacing: 0.5px;

    padding: 17px 22px;

    text-align: left;

}


.transaction-table td {

    padding: 20px 22px;

    border-top: 1px solid #edf0f5;

    color: #1b2742;

    font-size: 14px;

}


.transaction-table tr:hover {

    background: #fafcff;

}


/* TYPE */

.transaction-type {

    display: inline-flex;

    align-items: center;

    gap: 7px;

    padding: 7px 12px;

    border-radius: 10px;

    font-size: 12px;

    font-weight: 700;

}


.buy-type {

    color: #0a9f50;

    background: #eafaf2;

}


.sell-type {

    color: #e53935;

    background: #fff0f0;

}


/* STATUS */

.status {

    display: inline-block;

    padding: 6px 11px;

    border-radius: 8px;

    font-size: 12px;

    font-weight: 600;

    background: #eafaf2;

    color: #0a9f50;

}


/* EMPTY */

.empty-state {

    padding: 70px 30px;

    text-align: center;

}


.empty-icon {

    width: 75px;

    height: 75px;

    border-radius: 22px;

    background: #edf3ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 30px;

    margin: 0 auto 20px;

}


.empty-state h3 {

    color: #111b35;

    font-size: 23px;

    font-weight: 700;

}


.empty-state p {

    color: #71809d;

    margin-bottom: 22px;

}


/* RESPONSIVE */

@media (max-width: 1100px) {

    .transaction-stats {

        grid-template-columns:
            repeat(2, 1fr);

    }

}


@media (max-width: 700px) {

    .transactions-page {

        padding: 20px;

    }

    .transaction-header {

        flex-direction: column;

        align-items: flex-start;

        gap: 20px;

    }

    .transaction-stats {

        grid-template-columns: 1fr;

    }

    .transaction-history {

        overflow-x: auto;

    }

    .transaction-table {

        min-width: 850px;

    }

}

</style>

</head>


<body>


<div class="layout">


    <!-- SIDEBAR -->

    <jsp:include page="components/sidebar.jsp" />


    <div class="main">


        <!-- NAVBAR -->

        <jsp:include page="components/navbar.jsp" />


        <main class="transactions-page">


            <!-- =================================
                 HEADER
            ================================== -->

            <div class="transaction-header">

                <div class="transaction-title">

                    <div class="transaction-title-icon">

                        <i class="fa-solid fa-clock-rotate-left"></i>

                    </div>

                    <div>

                        <h1>Transactions</h1>

                        <p>
                            View your complete trading activity
                            and order history.
                        </p>

                    </div>

                </div>


                <a
                    href="DashboardServlet"
                    class="dashboard-btn">

                    <i class="fa-solid fa-house"></i>

                    Dashboard

                </a>

            </div>



            <!-- =================================
                 STATISTICS
            ================================== -->

            <div class="transaction-stats">


                <!-- TOTAL -->

                <div class="transaction-card">

                    <div class="stat-icon">

                        <i class="fa-solid fa-receipt"></i>

                    </div>

                    <div class="stat-label">

                        Total Transactions

                    </div>

                    <div class="stat-value">

                        <%= totalTransactions %>

                    </div>

                </div>


                <!-- BUY -->

                <div class="transaction-card">

                    <div class="stat-icon">

                        <i class="fa-solid fa-arrow-trend-up"></i>

                    </div>

                    <div class="stat-label">

                        Buy Orders

                    </div>

                    <div class="stat-value">

                        <%= buyOrders %>

                    </div>

                </div>


                <!-- SELL -->

                <div class="transaction-card">

                    <div class="stat-icon">

                        <i class="fa-solid fa-arrow-trend-down"></i>

                    </div>

                    <div class="stat-label">

                        Sell Orders

                    </div>

                    <div class="stat-value">

                        <%= sellOrders %>

                    </div>

                </div>


                <!-- VALUE -->

                <div class="transaction-card">

                    <div class="stat-icon">

                        <i class="fa-solid fa-indian-rupee-sign"></i>

                    </div>

                    <div class="stat-label">

                        Total Trade Value

                    </div>

                    <div class="stat-value">

                        ₹<%= String.format(
                            "%,.2f",
                            totalTradeValue
                        ) %>

                    </div>

                </div>

            </div>



            <!-- =================================
                 TRANSACTION HISTORY
            ================================== -->

            <div class="transaction-history">


                <div class="history-header">

                    <h2>
                        Transaction History
                    </h2>

                    <p>
                        Your recent buy and sell orders
                    </p>

                </div>


                <% if (transactions.isEmpty()) { %>


                    <!-- EMPTY STATE -->

                    <div class="empty-state">

                        <div class="empty-icon">

                            <i class="fa-solid fa-receipt"></i>

                        </div>

                        <h3>
                            No Transactions Yet
                        </h3>

                        <p>
                            Your completed buy and sell
                            orders will appear here.
                        </p>

                        <a
                            href="BuyServlet"
                            class="dashboard-btn">

                            <i class="fa-solid fa-arrow-trend-up"></i>

                            Start Trading

                        </a>

                    </div>


                <% } else { %>


                    <!-- TRANSACTION TABLE -->

                    <div style="overflow-x:auto;">

                        <table class="transaction-table">

                            <thead>

                                <tr>

                                    <th>
                                        ID
                                    </th>

                                    <th>
                                        Type
                                    </th>

                                    <th>
                                        Stock ID
                                    </th>

                                    <th>
                                        Quantity
                                    </th>

                                    <th>
                                        Price / Share
                                    </th>

                                    <th>
                                        Brokerage
                                    </th>

                                    <th>
                                        Tax
                                    </th>

                                    <th>
                                        Total Amount
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                            <% for (
                                Transaction transaction
                                : transactions
                            ) { %>


                                <tr>


                                    <!-- ID -->

                                    <td>

                                        <strong>
                                            #<%= transaction.getTransactionId() %>
                                        </strong>

                                    </td>


                                    <!-- TYPE -->

                                    <td>

                                        <% if (
                                            "BUY".equalsIgnoreCase(
                                                transaction.getTransactionType()
                                            )
                                        ) { %>

                                            <span
                                                class="transaction-type buy-type">

                                                <i class="fa-solid fa-arrow-trend-up"></i>

                                                BUY

                                            </span>

                                        <% } else { %>

                                            <span
                                                class="transaction-type sell-type">

                                                <i class="fa-solid fa-arrow-trend-down"></i>

                                                SELL

                                            </span>

                                        <% } %>

                                    </td>


                                    <!-- STOCK -->

                                    <td>

                                        <strong>

                                            Stock #<%= transaction.getStockId() %>

                                        </strong>

                                    </td>


                                    <!-- QUANTITY -->

                                    <td>

                                        <strong>

                                            <%= transaction.getQuantity() %>

                                        </strong>

                                    </td>


                                    <!-- PRICE -->

                                    <td>

                                        ₹<%= String.format(
                                            "%,.2f",
                                            transaction.getPricePerShare()
                                        ) %>

                                    </td>


                                    <!-- BROKERAGE -->

                                    <td>

                                        ₹<%= String.format(
                                            "%,.2f",
                                            transaction.getBrokerage()
                                        ) %>

                                    </td>


                                    <!-- TAX -->

                                    <td>

                                        ₹<%= String.format(
                                            "%,.2f",
                                            transaction.getTax()
                                        ) %>

                                    </td>


                                    <!-- TOTAL -->

                                    <td>

                                        <strong>

                                            ₹<%= String.format(
                                                "%,.2f",
                                                transaction.getTotalAmount()
                                            ) %>

                                        </strong>

                                    </td>


                                    <!-- STATUS -->

                                    <td>

                                        <span class="status">

                                            <%= transaction.getTransactionStatus() %>

                                        </span>

                                    </td>


                                </tr>


                            <% } %>


                            </tbody>

                        </table>

                    </div>


                <% } %>


            </div>


        </main>


        <!-- FOOTER -->

        <jsp:include page="components/footer.jsp" />


    </div>

</div>


<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<script src="js/script.js"></script>


</body>

</html>