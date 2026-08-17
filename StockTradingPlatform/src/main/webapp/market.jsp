<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tradex.model.User"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    request.setAttribute("activePage", "market");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Market | TradeX</title>

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

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

    <style>

        /* =========================
           MARKET PAGE
        ========================== */

        .market-page {
            padding: 30px;
            background: #f4f7fc;
            min-height: calc(100vh - 80px);
        }

        .market-header {
            background: #ffffff;
            border-radius: 18px;
            padding: 28px 30px;
            margin-bottom: 24px;
            box-shadow: 0 8px 25px rgba(30, 50, 90, 0.06);
        }

        .market-header h1 {
            margin: 0;
            font-size: 34px;
            font-weight: 800;
            color: #101828;
        }

        .market-header h1 i {
            color: #2864e6;
            margin-right: 10px;
        }

        .market-header p {
            margin: 8px 0 0;
            color: #64748b;
            font-size: 15px;
        }

        /* SUMMARY CARDS */

        .market-summary {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .market-card {
            position: relative;
            overflow: hidden;
            background: #ffffff;
            border-radius: 18px;
            padding: 24px;
            min-height: 145px;
            box-shadow: 0 8px 25px rgba(30, 50, 90, 0.07);
        }

        .market-card::after {
            content: "";
            position: absolute;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            right: -25px;
            bottom: -30px;
            background: #f1f5fb;
        }

        .market-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #edf4ff;
            color: #2864e6;
            font-size: 18px;
            margin-bottom: 22px;
        }

        .market-label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.5px;
            color: #64748b;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .market-value {
            font-size: 20px;
            font-weight: 800;
            color: #101828;
        }

        .market-value.green {
            color: #16a34a;
        }

        .market-status {
            position: absolute;
            top: 22px;
            right: 22px;
            z-index: 2;
            padding: 6px 10px;
            border-radius: 20px;
            background: #ecfdf3;
            color: #16a34a;
            font-size: 11px;
            font-weight: 700;
        }

        /* STOCK TABLE */

        .stocks-section {
            background: #ffffff;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(30, 50, 90, 0.07);
        }

        .stocks-header {
            padding: 24px 28px;
            border-bottom: 1px solid #e8edf5;
        }

        .stocks-header h2 {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            color: #101828;
        }

        .stocks-header p {
            margin: 6px 0 0;
            color: #64748b;
            font-size: 13px;
        }

        .stocks-table {
            width: 100%;
            border-collapse: collapse;
        }

        .stocks-table th {
            padding: 15px 24px;
            background: #f8fafc;
            color: #64748b;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-align: left;
        }

        .stocks-table td {
            padding: 16px 24px;
            border-top: 1px solid #edf1f6;
            font-size: 13px;
            color: #334155;
        }

        .stocks-table tbody tr:hover {
            background: #f8fbff;
        }

        .stock-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .stock-logo {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            background: #edf4ff;
            color: #2864e6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
        }

        .stock-name {
            display: block;
            font-weight: 700;
            color: #334155;
        }

        .stock-symbol {
            display: block;
            margin-top: 3px;
            font-size: 11px;
            color: #94a3b8;
        }

        .stock-price {
            font-weight: 800;
            color: #111827;
        }

        .positive {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 7px;
            background: #ecfdf3;
            color: #16a34a;
            font-weight: 700;
            font-size: 11px;
        }

        .negative {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 7px;
            background: #fef2f2;
            color: #dc2626;
            font-weight: 700;
            font-size: 11px;
        }

        .buy-btn {
            border: none;
            background: #2864e6;
            color: #ffffff;
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
        }

        .buy-btn:hover {
            background: #1d4ed8;
        }

        /* RESPONSIVE */

        @media (max-width: 1100px) {

            .market-summary {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 700px) {

            .market-page {
                padding: 18px;
            }

            .market-summary {
                grid-template-columns: 1fr;
            }

            .stocks-section {
                overflow-x: auto;
            }

            .stocks-table {
                min-width: 700px;
            }

            .market-header h1 {
                font-size: 28px;
            }

        }

    </style>

</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <jsp:include page="components/sidebar.jsp" />

    <!-- MAIN -->
    <div class="main">

        <!-- NAVBAR -->
        <jsp:include page="components/navbar.jsp" />

        <!-- MARKET -->
        <main class="market-page">

            <!-- HEADER -->
            <section class="market-header">

                <h1>
                    <i class="fa-solid fa-chart-line"></i>
                    Market
                </h1>

                <p>
                    Explore stocks, track market movements,
                    and find your next investment.
                </p>

            </section>


            <!-- SUMMARY -->
            <section class="market-summary">

                <div class="market-card">

                    <div class="market-icon">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>

                    <span class="market-status">
                        ● Live
                    </span>

                    <span class="market-label">
                        Market Status
                    </span>

                    <div class="market-value">
                        Market Open
                    </div>

                </div>


                <div class="market-card">

                    <div class="market-icon">
                        <i class="fa-solid fa-arrow-trend-up"></i>
                    </div>

                    <span class="market-status">
                        Today
                    </span>

                    <span class="market-label">
                        Market Trend
                    </span>

                    <div class="market-value green">
                        Bullish
                    </div>

                </div>


                <div class="market-card">

                    <div class="market-icon">
                        <i class="fa-solid fa-chart-column"></i>
                    </div>

                    <span class="market-status">
                        NSE
                    </span>

                    <span class="market-label">
                        Market Index
                    </span>

                    <div class="market-value">
                        NIFTY 50
                    </div>

                </div>


                <div class="market-card">

                    <div class="market-icon">
                        <i class="fa-solid fa-layer-group"></i>
                    </div>

                    <span class="market-status">
                        Available
                    </span>

                    <span class="market-label">
                        Listed Stocks
                    </span>

                    <div class="market-value">
                        5 Stocks
                    </div>

                </div>

            </section>


            <!-- STOCKS -->
            <section class="stocks-section">

                <div class="stocks-header">

                    <h2>Stocks</h2>

                    <p>
                        Track available stocks and their current
                        market performance.
                    </p>

                </div>


                <table class="stocks-table">

                    <thead>

                        <tr>

                            <th>Stock</th>
                            <th>Price</th>
                            <th>Change</th>
                            <th>Market</th>
                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>


                        <tr>

                            <td>

                                <div class="stock-info">

                                    <div class="stock-logo">
                                        BF
                                    </div>

                                    <div>
                                        <span class="stock-name">
                                            Bajaj Finance
                                        </span>

                                        <span class="stock-symbol">
                                            BAJFINANCE
                                        </span>
                                    </div>

                                </div>

                            </td>

                            <td class="stock-price">
                                ₹9,350.00
                            </td>

                            <td>
                                <span class="positive">
                                    ↑ +1.24%
                                </span>
                            </td>

                            <td>NSE</td>

                            <td>
                                <button class="buy-btn">
                                    Buy
                                </button>
                            </td>

                        </tr>


                        <tr>

                            <td>

                                <div class="stock-info">

                                    <div class="stock-logo">
                                        DR
                                    </div>

                                    <div>
                                        <span class="stock-name">
                                            Dr Reddy's Laboratories
                                        </span>

                                        <span class="stock-symbol">
                                            DRREDDY
                                        </span>
                                    </div>

                                </div>

                            </td>

                            <td class="stock-price">
                                ₹6,750.00
                            </td>

                            <td>
                                <span class="negative">
                                    ↓ -0.82%
                                </span>
                            </td>

                            <td>NSE</td>

                            <td>
                                <button class="buy-btn">
                                    Buy
                                </button>
                            </td>

                        </tr>


                        <tr>

                            <td>

                                <div class="stock-info">

                                    <div class="stock-logo">
                                        RI
                                    </div>

                                    <div>
                                        <span class="stock-name">
                                            Reliance Industries
                                        </span>

                                        <span class="stock-symbol">
                                            RELIANCE
                                        </span>
                                    </div>

                                </div>

                            </td>

                            <td class="stock-price">
                                ₹3,100.00
                            </td>

                            <td>
                                <span class="positive">
                                    ↑ +0.65%
                                </span>
                            </td>

                            <td>NSE</td>

                            <td>
                                <button class="buy-btn">
                                    Buy
                                </button>
                            </td>

                        </tr>


                        <tr>

                            <td>

                                <div class="stock-info">

                                    <div class="stock-logo">
                                        HB
                                    </div>

                                    <div>
                                        <span class="stock-name">
                                            HDFC Bank
                                        </span>

                                        <span class="stock-symbol">
                                            HDFCBANK
                                        </span>
                                    </div>

                                </div>

                            </td>

                            <td class="stock-price">
                                ₹1,715.00
                            </td>

                            <td>
                                <span class="negative">
                                    ↓ -0.31%
                                </span>
                            </td>

                            <td>NSE</td>

                            <td>
                                <button class="buy-btn">
                                    Buy
                                </button>
                            </td>

                        </tr>


                        <tr>

                            <td>

                                <div class="stock-info">

                                    <div class="stock-logo">
                                        TC
                                    </div>

                                    <div>
                                        <span class="stock-name">
                                            Tata Consultancy Services
                                        </span>

                                        <span class="stock-symbol">
                                            TCS
                                        </span>
                                    </div>

                                </div>

                            </td>

                            <td class="stock-price">
                                ₹3,550.00
                            </td>

                            <td>
                                <span class="positive">
                                    ↑ +1.43%
                                </span>
                            </td>

                            <td>NSE</td>

                            <td>
                                <button class="buy-btn">
                                    Buy
                                </button>
                            </td>

                        </tr>

                    </tbody>

                </table>

            </section>

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