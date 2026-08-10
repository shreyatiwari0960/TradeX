<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tradex.model.PortfolioView"%>
<%@ page import="com.tradex.model.User"%>

<%
    /* =====================================================
       USER SESSION
       ===================================================== */

    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }


    /* =====================================================
       PORTFOLIO DATA
       ===================================================== */

    List<PortfolioView> portfolioList =
            (List<PortfolioView>) request.getAttribute("portfolioList");


    /* =====================================================
       CALCULATE SUMMARY
       ===================================================== */

    double totalInvestment = 0.0;
    double currentValue = 0.0;

    if (portfolioList != null) {

        for (PortfolioView stock : portfolioList) {

            double investment =
                    stock.getQuantity()
                    * stock.getAverageBuyPrice();

            double value =
                    stock.getQuantity()
                    * stock.getCurrentPrice();

            totalInvestment += investment;
            currentValue += value;
        }
    }


    double profitLoss =
            currentValue - totalInvestment;


    double profitPercentage = 0.0;

    if (totalInvestment > 0) {

        profitPercentage =
                (profitLoss / totalInvestment) * 100;
    }


    int holdings = 0;

    if (portfolioList != null) {
        holdings = portfolioList.size();
    }
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Portfolio | TradeX</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Font Awesome -->

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


    <!-- Main TradeX CSS -->

    <link
        rel="stylesheet"
        href="<%= request.getContextPath() %>/css/style.css">


    <!-- =====================================================
         PORTFOLIO PAGE CSS
         ===================================================== -->

    <style>

        /* =================================================
           PAGE
           ================================================= */

        .portfolio-page {

            padding: 35px;

            background: #F4F7FC;

            min-height: calc(100vh - 140px);

        }


        /* =================================================
           HEADER
           ================================================= */

        .portfolio-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 30px;

            margin-bottom: 35px;

        }


        .portfolio-title {

            flex: 1;

        }


        .portfolio-title h1 {

            display: flex;

            align-items: center;

            gap: 15px;

            margin: 0 0 8px 0;

            color: #0F172A;

            font-size: 42px;

            font-weight: 700;

            line-height: 1.2;

        }


        .portfolio-title h1 i {

            color: #2563EB;

            font-size: 38px;

        }


        .portfolio-title p {

            margin: 0;

            color: #64748B;

            font-size: 16px;

            line-height: 1.7;

        }


        /* Analytics Button */

        .analytics-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 10px;

            min-width: 175px;

            min-height: 64px;

            padding: 14px 24px;

            border: none;

            border-radius: 14px;

            background: #2563EB;

            color: white;

            font-size: 16px;

            font-weight: 600;

            text-decoration: none;

            box-shadow:
                0 10px 25px rgba(37, 99, 235, 0.18);

            transition: all 0.3s ease;

        }


        .analytics-btn:hover {

            background: #1D4ED8;

            color: white;

            transform: translateY(-3px);

            box-shadow:
                0 15px 30px rgba(37, 99, 235, 0.25);

        }


        /* =================================================
           SUMMARY GRID
           ================================================= */

        .portfolio-summary-grid {

            display: grid;

            grid-template-columns:
                repeat(4, minmax(0, 1fr));

            gap: 22px;

            margin-bottom: 35px;

        }


        /* =================================================
           SUMMARY CARD
           ================================================= */

        .portfolio-summary-card {

            position: relative;

            min-height: 190px;

            padding: 27px;

            background: white;

            border: 1px solid #EEF2F7;

            border-radius: 22px;

            box-shadow:
                0 10px 30px rgba(15, 23, 42, 0.06);

            overflow: hidden;

            transition: all 0.3s ease;

        }


        .portfolio-summary-card:hover {

            transform: translateY(-6px);

            box-shadow:
                0 18px 35px rgba(15, 23, 42, 0.10);

        }


        .portfolio-summary-card::after {

            content: "";

            position: absolute;

            width: 120px;

            height: 120px;

            right: -50px;

            bottom: -50px;

            border-radius: 50%;

            background: rgba(37, 99, 235, 0.04);

        }


        /* =================================================
           CARD ICON
           ================================================= */

        .portfolio-icon {

            width: 58px;

            height: 58px;

            display: flex;

            align-items: center;

            justify-content: center;

            margin-bottom: 20px;

            border-radius: 16px;

            color: white;

            font-size: 24px;

        }


        .portfolio-icon-blue {

            background: #2563EB;

        }


        .portfolio-icon-green {

            background: #16A34A;

        }


        .portfolio-icon-purple {

            background: #7C3AED;

        }


        .portfolio-icon-orange {

            background: #EA580C;

        }


        /* =================================================
           CARD TEXT
           ================================================= */

        .portfolio-summary-card h5 {

            margin: 0 0 8px 0;

            color: #64748B;

            font-size: 13px;

            font-weight: 600;

            letter-spacing: 0.5px;

            text-transform: uppercase;

        }


        .portfolio-summary-card h2 {

            margin: 0;

            color: #0F172A;

            font-size: 28px;

            font-weight: 700;

            line-height: 1.3;

        }


        .portfolio-summary-card .profit-positive {

            color: #16A34A;

        }


        .portfolio-summary-card .profit-negative {

            color: #DC2626;

        }


        .profit-percent {

            display: block;

            margin-top: 6px;

            font-size: 12px;

            font-weight: 600;

        }


        .profit-percent-positive {

            color: #16A34A;

        }


        .profit-percent-negative {

            color: #DC2626;

        }


        /* =================================================
           HOLDINGS SECTION
           ================================================= */

        .holdings-card {

            background: white;

            padding: 30px;

            border: 1px solid #EEF2F7;

            border-radius: 22px;

            box-shadow:
                0 10px 30px rgba(15, 23, 42, 0.06);

            margin-bottom: 35px;

        }


        /* =================================================
           HOLDINGS HEADER
           ================================================= */

        .holdings-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 20px;

            margin-bottom: 25px;

        }


        .holdings-title h2 {

            display: flex;

            align-items: center;

            gap: 10px;

            margin: 0 0 6px 0;

            color: #0F172A;

            font-size: 26px;

            font-weight: 700;

        }


        .holdings-title h2 i {

            color: #2563EB;

        }


        .holdings-title p {

            margin: 0;

            color: #64748B;

            font-size: 14px;

        }


        .holdings-count {

            padding: 9px 18px;

            border-radius: 25px;

            background: #2563EB;

            color: white;

            font-size: 13px;

            font-weight: 600;

            white-space: nowrap;

        }


        /* =================================================
           TABLE WRAPPER
           ================================================= */

        .portfolio-table-wrapper {

            width: 100%;

            overflow-x: auto;

            border: 1px solid #E2E8F0;

            border-radius: 16px;

        }


        /* =================================================
           TABLE
           ================================================= */

        .portfolio-table {

            width: 100%;

            min-width: 1000px;

            border-collapse: collapse;

            background: white;

        }


        .portfolio-table thead {

            background: #F8FAFC;

        }


        .portfolio-table th {

            padding: 17px 15px;

            border-bottom: 1px solid #E2E8F0;

            color: #475569;

            font-size: 12px;

            font-weight: 700;

            text-align: left;

            text-transform: uppercase;

            letter-spacing: 0.4px;

            white-space: nowrap;

        }


        .portfolio-table td {

            padding: 17px 15px;

            border-bottom: 1px solid #F1F5F9;

            color: #334155;

            font-size: 14px;

            vertical-align: middle;

            white-space: nowrap;

        }


        .portfolio-table tbody tr {

            transition: background 0.2s ease;

        }


        .portfolio-table tbody tr:hover {

            background: #F8FAFC;

        }


        .portfolio-table tbody tr:last-child td {

            border-bottom: none;

        }


        /* =================================================
           STOCK CELL
           ================================================= */

        .portfolio-stock {

            display: flex;

            align-items: center;

            gap: 12px;

            min-width: 220px;

        }


        .portfolio-stock-icon {

            width: 42px;

            height: 42px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 12px;

            background: #EFF6FF;

            color: #2563EB;

            font-size: 17px;

        }


        .portfolio-stock-info {

            display: flex;

            flex-direction: column;

            gap: 3px;

        }


        .portfolio-stock-name {

            color: #0F172A;

            font-size: 14px;

            font-weight: 700;

        }


        .portfolio-stock-symbol {

            color: #64748B;

            font-size: 12px;

            font-weight: 500;

        }


        /* =================================================
           NUMBERS
           ================================================= */

        .portfolio-number {

            color: #334155;

            font-weight: 500;

        }


        .portfolio-price {

            color: #0F172A;

            font-weight: 600;

        }


        /* =================================================
           PROFIT
           ================================================= */

        .portfolio-profit {

            display: flex;

            flex-direction: column;

            gap: 3px;

        }


        .portfolio-profit.positive strong {

            color: #16A34A;

        }


        .portfolio-profit.positive small {

            color: #16A34A;

        }


        .portfolio-profit.negative strong {

            color: #DC2626;

        }


        .portfolio-profit.negative small {

            color: #DC2626;

        }


        .portfolio-profit strong {

            font-size: 14px;

            font-weight: 700;

        }


        .portfolio-profit small {

            font-size: 11px;

            font-weight: 600;

        }


        /* =================================================
           SELL BUTTON
           ================================================= */

        .portfolio-sell-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            padding: 8px 14px;

            border: 1px solid #FECACA;

            border-radius: 9px;

            background: #FEF2F2;

            color: #DC2626;

            font-size: 12px;

            font-weight: 600;

            text-decoration: none;

            cursor: pointer;

            transition: all 0.25s ease;

        }


        .portfolio-sell-btn:hover {

            background: #DC2626;

            color: white;

            border-color: #DC2626;

            transform: translateY(-2px);

        }


        /* =================================================
           EMPTY PORTFOLIO
           ================================================= */

        .portfolio-empty {

            padding: 60px 25px;

            text-align: center;

            background: #F8FAFC;

            border: 2px dashed #E2E8F0;

            border-radius: 18px;

        }


        .portfolio-empty-icon {

            width: 70px;

            height: 70px;

            margin: 0 auto 18px auto;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 20px;

            background: #EFF6FF;

            color: #2563EB;

            font-size: 28px;

        }


        .portfolio-empty h3 {

            margin: 0 0 8px 0;

            color: #0F172A;

            font-size: 22px;

            font-weight: 700;

        }


        .portfolio-empty p {

            max-width: 500px;

            margin: 0 auto 20px auto;

            color: #64748B;

            font-size: 14px;

            line-height: 1.7;

        }


        .portfolio-empty a {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            padding: 11px 20px;

            border-radius: 10px;

            background: #2563EB;

            color: white;

            text-decoration: none;

            font-size: 14px;

            font-weight: 600;

        }


        .portfolio-empty a:hover {

            background: #1D4ED8;

            color: white;

        }


        /* =================================================
           RESPONSIVE
           ================================================= */

        @media (max-width: 1200px) {

            .portfolio-summary-grid {

                grid-template-columns:
                    repeat(2, minmax(0, 1fr));

            }

        }


        @media (max-width: 900px) {

            .portfolio-page {

                padding: 25px;

            }

            .portfolio-header {

                flex-direction: column;

                align-items: flex-start;

            }

            .analytics-btn {

                width: 100%;

            }

        }


        @media (max-width: 600px) {

            .portfolio-page {

                padding: 18px;

            }

            .portfolio-summary-grid {

                grid-template-columns: 1fr;

            }

            .portfolio-title h1 {

                font-size: 30px;

            }

            .portfolio-title h1 i {

                font-size: 28px;

            }

            .portfolio-summary-card h2 {

                font-size: 25px;

            }

            .holdings-card {

                padding: 18px;

            }

            .holdings-header {

                flex-direction: column;

                align-items: flex-start;

            }

        }

    </style>

</head>


<body>


<div class="layout">


    <!-- =================================================
         SIDEBAR
         ================================================= -->

    <jsp:include page="components/sidebar.jsp"/>


    <!-- =================================================
         MAIN
         ================================================= -->

    <div class="main">


        <!-- NAVBAR -->

        <jsp:include page="components/navbar.jsp"/>


        <!-- =================================================
             PORTFOLIO PAGE
             ================================================= -->

        <main class="portfolio-page">


            <!-- =================================================
                 HEADER
                 ================================================= -->

            <section class="portfolio-header">

                <div class="portfolio-title">

                    <h1>

                        <i class="fa-solid fa-wallet"></i>

                        My Portfolio

                    </h1>

                    <p>
                        Monitor your investments, track profit & loss,
                        and manage your holdings.
                    </p>

                </div>


                <a href="#"
                   class="analytics-btn">

                    <i class="fa-solid fa-chart-line"></i>

                    View Analytics

                </a>

            </section>


            <!-- =================================================
                 SUMMARY CARDS
                 ================================================= -->

            <section class="portfolio-summary-grid">


                <!-- TOTAL INVESTMENT -->

                <div class="portfolio-summary-card">

                    <div class="portfolio-icon portfolio-icon-blue">

                        <i class="fa-solid fa-wallet"></i>

                    </div>

                    <h5>Total Investment</h5>

                    <h2>

                        ₹ <%= String.format("%,.2f",
                            totalInvestment) %>

                    </h2>

                </div>


                <!-- CURRENT VALUE -->

                <div class="portfolio-summary-card">

                    <div class="portfolio-icon portfolio-icon-green">

                        <i class="fa-solid fa-indian-rupee-sign"></i>

                    </div>

                    <h5>Current Value</h5>

                    <h2>

                        ₹ <%= String.format("%,.2f",
                            currentValue) %>

                    </h2>

                </div>


                <!-- PROFIT -->

                <div class="portfolio-summary-card">

                    <div class="portfolio-icon portfolio-icon-purple">

                        <i class="fa-solid fa-chart-line"></i>

                    </div>

                    <h5>Overall Profit</h5>

                    <h2 class="<%= profitLoss >= 0
                                ? "profit-positive"
                                : "profit-negative" %>">

                        <%= profitLoss >= 0 ? "+" : "-" %>
                        ₹ <%= String.format("%.2f",
                            Math.abs(profitLoss)) %>

                    </h2>

                    <span class="profit-percent
                        <%= profitLoss >= 0
                            ? "profit-percent-positive"
                            : "profit-percent-negative" %>">

                        <%= profitLoss >= 0 ? "+" : "" %>
                        <%= String.format("%.2f",
                            profitPercentage) %>%

                    </span>

                </div>


                <!-- TOTAL HOLDINGS -->

                <div class="portfolio-summary-card">

                    <div class="portfolio-icon portfolio-icon-orange">

                        <i class="fa-solid fa-layer-group"></i>

                    </div>

                    <h5>Total Holdings</h5>

                    <h2>

                        <%= holdings %>

                    </h2>

                </div>


            </section>


            <!-- =================================================
                 HOLDINGS
                 ================================================= -->

            <section class="holdings-card">


                <!-- HOLDINGS HEADER -->

                <div class="holdings-header">

                    <div class="holdings-title">

                        <h2>

                            <i class="fa-solid fa-briefcase"></i>

                            Current Holdings

                        </h2>

                        <p>
                            Your currently owned stocks and
                            their performance
                        </p>

                    </div>


                    <div class="holdings-count">

                        <%= holdings %> Stocks

                    </div>

                </div>


                <!-- =================================================
                     TABLE
                     ================================================= -->

                <%
                    if (portfolioList != null
                            && !portfolioList.isEmpty()) {
                %>


                <div class="portfolio-table-wrapper">

                    <table class="portfolio-table">


                        <thead>

                            <tr>

                                <th>Stock</th>

                                <th>Qty</th>

                                <th>Avg. Buy Price</th>

                                <th>Current Price</th>

                                <th>Investment</th>

                                <th>Current Value</th>

                                <th>Profit / Loss</th>

                                <th>Action</th>

                            </tr>

                        </thead>


                        <tbody>


                        <%
                            for (PortfolioView stock
                                    : portfolioList) {


                                double investment =
                                    stock.getQuantity()
                                    * stock.getAverageBuyPrice();


                                double value =
                                    stock.getQuantity()
                                    * stock.getCurrentPrice();


                                double stockProfit =
                                    value - investment;


                                double stockProfitPercent = 0.0;


                                if (investment > 0) {

                                    stockProfitPercent =
                                        (stockProfit
                                        / investment) * 100;
                                }
                        %>


                            <tr>


                                <!-- STOCK -->

                                <td>

                                    <div class="portfolio-stock">

                                        <div class="portfolio-stock-icon">

                                            <i class="fa-solid fa-chart-line"></i>

                                        </div>


                                        <div class="portfolio-stock-info">

                                            <span class="portfolio-stock-name">

                                                <%= stock.getCompanyName() %>

                                            </span>

                                            <span class="portfolio-stock-symbol">

                                                <%= stock.getStockSymbol() %>

                                            </span>

                                        </div>

                                    </div>

                                </td>


                                <!-- QUANTITY -->

                                <td>

                                    <span class="portfolio-number">

                                        <%= stock.getQuantity() %>

                                    </span>

                                </td>


                                <!-- AVERAGE BUY PRICE -->

                                <td>

                                    <span class="portfolio-price">

                                        ₹ <%= String.format(
                                            "%,.2f",
                                            stock.getAverageBuyPrice()) %>

                                    </span>

                                </td>


                                <!-- CURRENT PRICE -->

                                <td>

                                    <span class="portfolio-price">

                                        ₹ <%= String.format(
                                            "%,.2f",
                                            stock.getCurrentPrice()) %>

                                    </span>

                                </td>


                                <!-- INVESTMENT -->

                                <td>

                                    <span class="portfolio-price">

                                        ₹ <%= String.format(
                                            "%,.2f",
                                            investment) %>

                                    </span>

                                </td>


                                <!-- CURRENT VALUE -->

                                <td>

                                    <span class="portfolio-price">

                                        ₹ <%= String.format(
                                            "%,.2f",
                                            value) %>

                                    </span>

                                </td>


                                <!-- PROFIT / LOSS -->

                                <td>

                                    <div class="portfolio-profit
                                        <%= stockProfit >= 0
                                            ? "positive"
                                            : "negative" %>">

                                        <strong>

                                            <%= stockProfit >= 0
                                                ? "+" : "-" %>
                                            ₹ <%= String.format(
                                                "%.2f",
                                                Math.abs(stockProfit)) %>

                                        </strong>


                                        <small>

                                            <%= stockProfit >= 0
                                                ? "+" : "" %>
                                            <%= String.format(
                                                "%.2f",
                                                stockProfitPercent) %>%

                                        </small>

                                    </div>

                                </td>


                                <!-- ACTION -->

                                <td>

                                    <a href="#"
                                       class="portfolio-sell-btn">

                                        <i class="fa-solid
                                                  fa-arrow-trend-down"></i>

                                        Sell

                                    </a>

                                </td>


                            </tr>


                        <%
                            }
                        %>


                        </tbody>

                    </table>

                </div>


                <%
                    } else {
                %>


                <!-- EMPTY PORTFOLIO -->

                <div class="portfolio-empty">

                    <div class="portfolio-empty-icon">

                        <i class="fa-solid fa-briefcase"></i>

                    </div>

                    <h3>

                        No Holdings Yet

                    </h3>

                    <p>

                        You haven't purchased any stocks yet.
                        Start investing and your holdings
                        will appear here.

                    </p>

                    <a href="MarketServlet">

                        <i class="fa-solid fa-chart-column"></i>

                        Explore Market

                    </a>

                </div>


                <%
                    }
                %>


            </section>


        </main>


        <!-- FOOTER -->

        <jsp:include page="components/footer.jsp"/>


    </div>

</div>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>