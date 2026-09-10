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

    Integer successfulTransactions =
        (Integer) request.getAttribute("successfulTransactions");

    Double totalTradeValue =
        (Double) request.getAttribute("totalTradeValue");

    Double buyValue =
        (Double) request.getAttribute("buyValue");

    Double sellValue =
        (Double) request.getAttribute("sellValue");

    Double averageTradeValue =
        (Double) request.getAttribute("averageTradeValue");

    Double netTradingFlow =
        (Double) request.getAttribute("netTradingFlow");

    Double buyPercentage =
        (Double) request.getAttribute("buyPercentage");

    Double sellPercentage =
        (Double) request.getAttribute("sellPercentage");

    Integer mostTradedStockId =
        (Integer) request.getAttribute("mostTradedStockId");

    Integer highestTradeCount =
        (Integer) request.getAttribute("highestTradeCount");


    if (transactions == null) {
        transactions =
            new java.util.ArrayList<Transaction>();
    }

    if (totalTransactions == null)
        totalTransactions = 0;

    if (buyOrders == null)
        buyOrders = 0;

    if (sellOrders == null)
        sellOrders = 0;

    if (successfulTransactions == null)
        successfulTransactions = 0;

    if (totalTradeValue == null)
        totalTradeValue = 0.0;

    if (buyValue == null)
        buyValue = 0.0;

    if (sellValue == null)
        sellValue = 0.0;

    if (averageTradeValue == null)
        averageTradeValue = 0.0;

    if (netTradingFlow == null)
        netTradingFlow = 0.0;

    if (buyPercentage == null)
        buyPercentage = 0.0;

    if (sellPercentage == null)
        sellPercentage = 0.0;

    if (mostTradedStockId == null)
        mostTradedStockId = 0;

    if (highestTradeCount == null)
        highestTradeCount = 0;
%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Analytics | TradeX</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">


<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


<link
rel="stylesheet"
href="css/style.css">


<style>

/* =========================================
   ANALYTICS PAGE
========================================= */

.analytics-page {

    background: #f4f7fc;

    min-height: calc(100vh - 70px);

    padding: 40px;

}


/* =========================================
   HEADER
========================================= */

.analytics-header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 30px;

}


.analytics-title {

    display: flex;

    align-items: center;

    gap: 18px;

}


.analytics-icon {

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


.analytics-title h1 {

    margin: 0;

    color: #111b35;

    font-size: 38px;

    font-weight: 700;

}


.analytics-title p {

    margin: 5px 0 0;

    color: #71809d;

    font-size: 16px;

}


/* =========================================
   DASHBOARD BUTTON
========================================= */

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

}


.dashboard-btn:hover {

    background: #1d55cf;

    color: white;

}


/* =========================================
   MAIN STAT CARDS
========================================= */

.analytics-stats {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 24px;

    margin-bottom: 30px;

}


.analytics-card {

    background: white;

    border-radius: 20px;

    padding: 27px;

    position: relative;

    overflow: hidden;

    box-shadow:
        0 8px 25px rgba(32, 56, 85, 0.08);

}


.analytics-card::after {

    content: "";

    position: absolute;

    width: 110px;

    height: 110px;

    border-radius: 50%;

    background: #f5f8fd;

    right: -40px;

    bottom: -45px;

}


.card-icon {

    width: 48px;

    height: 48px;

    border-radius: 14px;

    background: #edf3ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 19px;

    margin-bottom: 20px;

}


.card-label {

    color: #71809d;

    font-size: 12px;

    font-weight: 700;

    text-transform: uppercase;

    letter-spacing: .5px;

}


.card-value {

    color: #111b35;

    font-size: 28px;

    font-weight: 700;

    margin-top: 7px;

}


/* =========================================
   GRID
========================================= */

.analytics-grid {

    display: grid;

    grid-template-columns:
        1.15fr .85fr;

    gap: 25px;

    margin-bottom: 25px;

}


/* =========================================
   PANELS
========================================= */

.analytics-panel {

    background: white;

    border-radius: 20px;

    padding: 30px;

    box-shadow:
        0 8px 25px rgba(32, 56, 85, 0.08);

}


.panel-heading {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 25px;

}


.panel-heading h2 {

    margin: 0;

    color: #111b35;

    font-size: 22px;

    font-weight: 700;

}


.panel-heading p {

    margin: 5px 0 0;

    color: #71809d;

    font-size: 14px;

}


/* =========================================
   BUY / SELL VISUAL
========================================= */

.trade-visual {

    display: flex;

    align-items: center;

    gap: 35px;

}


.donut {

    width: 170px;

    height: 170px;

    border-radius: 50%;

    background:
        conic-gradient(
            #2864e8
            0deg
            <%= buyPercentage * 3.6 %>deg,
            #e84d5b
            <%= buyPercentage * 3.6 %>deg
            360deg
        );

    display: flex;

    align-items: center;

    justify-content: center;

    flex-shrink: 0;

}


.donut-inner {

    width: 105px;

    height: 105px;

    background: white;

    border-radius: 50%;

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;

}


.donut-inner strong {

    color: #111b35;

    font-size: 25px;

}


.donut-inner span {

    color: #71809d;

    font-size: 12px;

}


.trade-details {

    flex: 1;

}


.trade-row {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 18px;

}


.trade-name {

    display: flex;

    align-items: center;

    gap: 10px;

    color: #263450;

    font-weight: 600;

}


.trade-dot {

    width: 11px;

    height: 11px;

    border-radius: 50%;

    background: #2864e8;

}


.trade-dot.sell {

    background: #e84d5b;

}


.trade-value {

    font-weight: 700;

    color: #111b35;

}


/* =========================================
   VALUE BARS
========================================= */

.value-row {

    margin-bottom: 25px;

}


.value-info {

    display: flex;

    justify-content: space-between;

    margin-bottom: 9px;

}


.value-info span:first-child {

    color: #71809d;

    font-size: 13px;

    font-weight: 600;

}


.value-info span:last-child {

    color: #111b35;

    font-weight: 700;

}


.progress-bg {

    width: 100%;

    height: 10px;

    background: #edf1f7;

    border-radius: 20px;

    overflow: hidden;

}


.progress-fill {

    height: 100%;

    background: #2864e8;

    border-radius: 20px;

}


.progress-fill.sell {

    background: #e84d5b;

}


/* =========================================
   INSIGHT CARDS
========================================= */

.insight-grid {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;

    margin-bottom: 25px;

}


.insight-card {

    background: white;

    border-radius: 20px;

    padding: 25px;

    box-shadow:
        0 8px 25px rgba(32, 56, 85, 0.08);

}


.insight-icon {

    width: 45px;

    height: 45px;

    border-radius: 13px;

    background: #edf3ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    margin-bottom: 17px;

}


.insight-card h3 {

    margin: 0;

    color: #71809d;

    font-size: 12px;

    text-transform: uppercase;

    letter-spacing: .5px;

}


.insight-value {

    margin-top: 8px;

    color: #111b35;

    font-size: 24px;

    font-weight: 700;

}


.insight-card p {

    margin: 5px 0 0;

    color: #71809d;

    font-size: 13px;

}


/* =========================================
   RECENT TRANSACTIONS
========================================= */

.recent-panel {

    background: white;

    border-radius: 20px;

    overflow: hidden;

    box-shadow:
        0 8px 25px rgba(32, 56, 85, 0.08);

}


.recent-heading {

    padding: 27px 30px;

    border-bottom: 1px solid #edf0f5;

}


.recent-heading h2 {

    margin: 0;

    color: #111b35;

    font-size: 22px;

    font-weight: 700;

}


.recent-heading p {

    margin: 5px 0 0;

    color: #71809d;

}


.analytics-table {

    width: 100%;

    border-collapse: collapse;

}


.analytics-table th {

    background: #f8faff;

    color: #71809d;

    font-size: 12px;

    text-transform: uppercase;

    padding: 16px 25px;

    text-align: left;

}


.analytics-table td {

    padding: 18px 25px;

    border-top: 1px solid #edf0f5;

    color: #1c2944;

    font-size: 14px;

}


.type-badge {

    display: inline-flex;

    align-items: center;

    gap: 7px;

    padding: 7px 12px;

    border-radius: 9px;

    font-size: 11px;

    font-weight: 700;

}


.type-buy {

    background: #eafaf2;

    color: #0a9f50;

}


.type-sell {

    background: #fff0f0;

    color: #e53935;

}


.status-badge {

    background: #eafaf2;

    color: #0a9f50;

    padding: 6px 10px;

    border-radius: 8px;

    font-size: 11px;

    font-weight: 700;

}


/* =========================================
   EMPTY
========================================= */

.analytics-empty {

    text-align: center;

    padding: 55px;

    color: #71809d;

}


.analytics-empty i {

    font-size: 40px;

    color: #2864e8;

    margin-bottom: 15px;

}


/* =========================================
   RESPONSIVE
========================================= */

@media (max-width: 1100px) {

    .analytics-stats {

        grid-template-columns:
            repeat(2, 1fr);

    }

    .analytics-grid {

        grid-template-columns: 1fr;

    }

    .insight-grid {

        grid-template-columns:
            repeat(2, 1fr);

    }

}


@media (max-width: 700px) {

    .analytics-page {

        padding: 20px;

    }

    .analytics-header {

        flex-direction: column;

        align-items: flex-start;

        gap: 20px;

    }

    .analytics-stats {

        grid-template-columns: 1fr;

    }

    .insight-grid {

        grid-template-columns: 1fr;

    }

    .trade-visual {

        flex-direction: column;

    }

    .analytics-table {

        min-width: 750px;

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


        <main class="analytics-page">


            <!-- =====================================
                 PAGE HEADER
            ====================================== -->

            <div class="analytics-header">

                <div class="analytics-title">

                    <div class="analytics-icon">

                        <i class="fa-solid fa-chart-pie"></i>

                    </div>

                    <div>

                        <h1>Analytics</h1>

                        <p>
                            Understand your trading activity
                            and portfolio behaviour.
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



            <!-- =====================================
                 MAIN STATISTICS
            ====================================== -->

            <div class="analytics-stats">


                <!-- TOTAL TRADES -->

                <div class="analytics-card">

                    <div class="card-icon">

                        <i class="fa-solid fa-chart-line"></i>

                    </div>

                    <div class="card-label">

                        Total Trades

                    </div>

                    <div class="card-value">

                        <%= totalTransactions %>

                    </div>

                </div>


                <!-- TRADE VALUE -->

                <div class="analytics-card">

                    <div class="card-icon">

                        <i class="fa-solid fa-indian-rupee-sign"></i>

                    </div>

                    <div class="card-label">

                        Total Trade Value

                    </div>

                    <div class="card-value">

                        ₹<%= String.format(
                            "%,.2f",
                            totalTradeValue
                        ) %>

                    </div>

                </div>


                <!-- AVERAGE -->

                <div class="analytics-card">

                    <div class="card-icon">

                        <i class="fa-solid fa-calculator"></i>

                    </div>

                    <div class="card-label">

                        Average Trade

                    </div>

                    <div class="card-value">

                        ₹<%= String.format(
                            "%,.2f",
                            averageTradeValue
                        ) %>

                    </div>

                </div>


                <!-- SUCCESS -->

                <div class="analytics-card">

                    <div class="card-icon">

                        <i class="fa-solid fa-circle-check"></i>

                    </div>

                    <div class="card-label">

                        Successful Trades

                    </div>

                    <div class="card-value">

                        <%= successfulTransactions %>

                    </div>

                </div>

            </div>



            <!-- =====================================
                 BUY / SELL + VALUE
            ====================================== -->

            <div class="analytics-grid">


                <!-- BUY SELL DISTRIBUTION -->

                <div class="analytics-panel">

                    <div class="panel-heading">

                        <div>

                            <h2>
                                Trading Activity
                            </h2>

                            <p>
                                Buy and sell order distribution
                            </p>

                        </div>

                    </div>


                    <div class="trade-visual">


                        <div class="donut">

                            <div class="donut-inner">

                                <strong>
                                    <%= totalTransactions %>
                                </strong>

                                <span>
                                    Trades
                                </span>

                            </div>

                        </div>


                        <div class="trade-details">


                            <div class="trade-row">

                                <div class="trade-name">

                                    <span class="trade-dot"></span>

                                    Buy Orders

                                </div>

                                <div class="trade-value">

                                    <%= buyOrders %>

                                    (<%= String.format(
                                        "%.1f",
                                        buyPercentage
                                    ) %>%)

                                </div>

                            </div>


                            <div class="trade-row">

                                <div class="trade-name">

                                    <span
                                        class="trade-dot sell">
                                    </span>

                                    Sell Orders

                                </div>

                                <div class="trade-value">

                                    <%= sellOrders %>

                                    (<%= String.format(
                                        "%.1f",
                                        sellPercentage
                                    ) %>%)

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <!-- TRADE VALUE -->

                <div class="analytics-panel">

                    <div class="panel-heading">

                        <div>

                            <h2>
                                Trade Value
                            </h2>

                            <p>
                                Value split between buy and sell
                            </p>

                        </div>

                    </div>


                    <div class="value-row">

                        <div class="value-info">

                            <span>
                                Buy Value
                            </span>

                            <span>

                                ₹<%= String.format(
                                    "%,.2f",
                                    buyValue
                                ) %>

                            </span>

                        </div>


                        <div class="progress-bg">

                            <%
                                double maxValue =
                                    Math.max(
                                        buyValue,
                                        sellValue
                                    );

                                double buyBar =
                                    maxValue > 0
                                    ? (buyValue / maxValue) * 100
                                    : 0;
                            %>

                            <div
                                class="progress-fill"
                                style="width:<%= buyBar %>%;">
                            </div>

                        </div>

                    </div>


                    <div class="value-row">

                        <div class="value-info">

                            <span>
                                Sell Value
                            </span>

                            <span>

                                ₹<%= String.format(
                                    "%,.2f",
                                    sellValue
                                ) %>

                            </span>

                        </div>


                        <div class="progress-bg">

                            <%
                                double sellBar =
                                    maxValue > 0
                                    ? (sellValue / maxValue) * 100
                                    : 0;
                            %>

                            <div
                                class="progress-fill sell"
                                style="width:<%= sellBar %>%;">
                            </div>

                        </div>

                    </div>


                    <div class="value-row">

                        <div class="value-info">

                            <span>
                                Net Trading Flow
                            </span>

                            <span>

                                ₹<%= String.format(
                                    "%,.2f",
                                    netTradingFlow
                                ) %>

                            </span>

                        </div>

                    </div>

                </div>

            </div>



            <!-- =====================================
                 INSIGHTS
            ====================================== -->

            <div class="insight-grid">


                <!-- BUY ORDERS -->

                <div class="insight-card">

                    <div class="insight-icon">

                        <i class="fa-solid fa-arrow-trend-up"></i>

                    </div>

                    <h3>
                        Buy Orders
                    </h3>

                    <div class="insight-value">

                        <%= buyOrders %>

                    </div>

                    <p>
                        Total purchase transactions
                    </p>

                </div>


                <!-- SELL ORDERS -->

                <div class="insight-card">

                    <div class="insight-icon">

                        <i class="fa-solid fa-arrow-trend-down"></i>

                    </div>

                    <h3>
                        Sell Orders
                    </h3>

                    <div class="insight-value">

                        <%= sellOrders %>

                    </div>

                    <p>
                        Total selling transactions
                    </p>

                </div>


                <!-- MOST TRADED -->

                <div class="insight-card">

                    <div class="insight-icon">

                        <i class="fa-solid fa-star"></i>

                    </div>

                    <h3>
                        Most Traded Stock
                    </h3>

                    <div class="insight-value">

                        <% if (mostTradedStockId > 0) { %>

                            Stock #<%= mostTradedStockId %>

                        <% } else { %>

                            —

                        <% } %>

                    </div>

                    <p>

                        <%= highestTradeCount %>
                        transaction(s)

                    </p>

                </div>

            </div>



            <!-- =====================================
                 RECENT ACTIVITY
            ====================================== -->

            <div class="recent-panel">


                <div class="recent-heading">

                    <h2>
                        Recent Trading Activity
                    </h2>

                    <p>
                        Latest transactions from your account
                    </p>

                </div>


                <% if (transactions.isEmpty()) { %>


                    <div class="analytics-empty">

                        <i
                            class="fa-solid fa-chart-pie">
                        </i>

                        <h3>
                            No Trading Data Yet
                        </h3>

                        <p>
                            Complete some trades to see
                            your analytics here.
                        </p>

                    </div>


                <% } else { %>


                    <div style="overflow-x:auto;">

                        <table class="analytics-table">

                            <thead>

                                <tr>

                                    <th>
                                        ID
                                    </th>

                                    <th>
                                        Type
                                    </th>

                                    <th>
                                        Stock
                                    </th>

                                    <th>
                                        Quantity
                                    </th>

                                    <th>
                                        Price / Share
                                    </th>

                                    <th>
                                        Total
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                            <%
                                int displayed = 0;

                                for (
                                    Transaction transaction
                                    : transactions
                                ) {

                                    if (displayed >= 5) {
                                        break;
                                    }

                                    displayed++;
                            %>


                                <tr>


                                    <td>

                                        <strong>
                                            #<%= transaction.getTransactionId() %>
                                        </strong>

                                    </td>


                                    <td>

                                        <% if (
                                            "BUY".equalsIgnoreCase(
                                                transaction.getTransactionType()
                                            )
                                        ) { %>

                                            <span
                                                class="type-badge type-buy">

                                                <i
                                                    class="fa-solid fa-arrow-trend-up">
                                                </i>

                                                BUY

                                            </span>

                                        <% } else { %>

                                            <span
                                                class="type-badge type-sell">

                                                <i
                                                    class="fa-solid fa-arrow-trend-down">
                                                </i>

                                                SELL

                                            </span>

                                        <% } %>

                                    </td>


                                    <td>

                                        <strong>

                                            Stock #<%= transaction.getStockId() %>

                                        </strong>

                                    </td>


                                    <td>

                                        <%= transaction.getQuantity() %>

                                    </td>


                                    <td>

                                        ₹<%= String.format(
                                            "%,.2f",
                                            transaction.getPricePerShare()
                                        ) %>

                                    </td>


                                    <td>

                                        <strong>

                                            ₹<%= String.format(
                                                "%,.2f",
                                                transaction.getTotalAmount()
                                            ) %>

                                        </strong>

                                    </td>


                                    <td>

                                        <span class="status-badge">

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