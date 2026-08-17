<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String selectedSymbol = request.getParameter("symbol");

    if (selectedSymbol == null || selectedSymbol.trim().isEmpty()) {
        selectedSymbol = "BAJFINANCE";
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Buy Stocks | TradeX</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <!-- Main TradeX CSS -->
    <link rel="stylesheet" href="css/style.css">


    <style>

        /* =====================================================
           BUY STOCK PAGE
        ===================================================== */

        .buy-page {
            padding: 30px 34px 50px;
            background: #f5f7fb;
            min-height: calc(100vh - 75px);
        }


        /* PAGE HEADER */

        .buy-page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .buy-title-section h1 {
            margin: 0;
            font-size: 38px;
            font-weight: 800;
            color: #111827;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .buy-title-section h1 i {
            color: #2563eb;
        }

        .buy-title-section p {
            margin: 8px 0 0;
            color: #64748b;
            font-size: 15px;
        }

        .back-market-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 18px;
            border-radius: 10px;
            background: white;
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
            border: 1px solid #e2e8f0;
            transition: 0.2s ease;
        }

        .back-market-btn:hover {
            background: #2563eb;
            color: white;
        }


        /* MARKET STATUS */

        .market-status {
            background: #ecfdf5;
            color: #059669;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 7px;
        }

        .market-status .dot {
            width: 8px;
            height: 8px;
            background: #10b981;
            border-radius: 50%;
        }


        /* STOCK SELECTOR */

        .stock-section {
            background: white;
            border-radius: 18px;
            padding: 26px;
            margin-bottom: 24px;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.06);
        }

        .section-heading {
            margin-bottom: 20px;
        }

        .section-heading h2 {
            margin: 0;
            color: #111827;
            font-size: 22px;
            font-weight: 750;
        }

        .section-heading p {
            margin: 6px 0 0;
            color: #64748b;
            font-size: 14px;
        }


        .stock-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 14px;
        }

        .stock-card {
            border: 1px solid #e5e7eb;
            border-radius: 14px;
            padding: 17px;
            background: #ffffff;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .stock-card:hover {
            transform: translateY(-3px);
            border-color: #2563eb;
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.10);
        }

        .stock-card.selected {
            border: 2px solid #2563eb;
            background: #eff6ff;
        }

        .stock-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
        }

        .stock-logo {
            width: 42px;
            height: 42px;
            border-radius: 11px;
            background: #eff6ff;
            color: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 14px;
        }

        .stock-change {
            font-size: 12px;
            font-weight: 700;
        }

        .positive {
            color: #16a34a;
        }

        .negative {
            color: #dc2626;
        }

        .stock-name {
            font-weight: 700;
            color: #111827;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .stock-symbol {
            font-size: 12px;
            color: #94a3b8;
            margin-bottom: 13px;
        }

        .stock-price {
            font-size: 17px;
            font-weight: 800;
            color: #111827;
        }


        /* ORDER AREA */

        .order-layout {
            display: grid;
            grid-template-columns: minmax(0, 1.6fr) minmax(300px, 0.8fr);
            gap: 24px;
            align-items: start;
        }


        .order-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.06);
        }

        .order-card h2 {
            margin: 0;
            font-size: 23px;
            color: #111827;
            font-weight: 750;
        }

        .order-card-subtitle {
            color: #64748b;
            margin: 6px 0 25px;
            font-size: 14px;
        }


        /* SELECTED STOCK */

        .selected-stock {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 17px;
            border-radius: 13px;
            background: #f8fafc;
            margin-bottom: 24px;
        }

        .selected-stock-logo {
            width: 52px;
            height: 52px;
            border-radius: 13px;
            background: #2563eb;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
        }

        .selected-stock-info h3 {
            margin: 0;
            font-size: 17px;
            color: #111827;
        }

        .selected-stock-info span {
            color: #64748b;
            font-size: 13px;
        }

        .selected-price {
            margin-left: auto;
            text-align: right;
        }

        .selected-price small {
            display: block;
            color: #64748b;
            font-size: 11px;
        }

        .selected-price strong {
            font-size: 20px;
            color: #111827;
        }


        /* FORM */

        .form-label {
            font-weight: 650;
            color: #334155;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .quantity-box {
            display: flex;
            align-items: center;
            border: 1px solid #dbe2ea;
            border-radius: 10px;
            overflow: hidden;
            width: 190px;
        }

        .quantity-btn {
            width: 45px;
            height: 45px;
            border: none;
            background: #f8fafc;
            font-size: 18px;
            color: #2563eb;
            cursor: pointer;
        }

        .quantity-btn:hover {
            background: #eff6ff;
        }

        .quantity-input {
            width: 100px;
            height: 45px;
            border: none;
            text-align: center;
            font-size: 16px;
            font-weight: 700;
            outline: none;
        }

        .order-select {
            height: 45px;
            border: 1px solid #dbe2ea;
            border-radius: 10px;
            padding: 0 12px;
            width: 190px;
            outline: none;
        }


        /* SUMMARY */

        .order-summary {
            margin-top: 24px;
            padding: 18px;
            border-radius: 13px;
            background: #f8fafc;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 7px 0;
            color: #64748b;
            font-size: 14px;
        }

        .summary-row strong {
            color: #111827;
        }

        .total-row {
            border-top: 1px solid #e2e8f0;
            margin-top: 7px;
            padding-top: 14px;
            font-size: 16px;
        }

        .total-row strong {
            color: #2563eb;
            font-size: 18px;
        }


        .buy-btn {
            width: 100%;
            margin-top: 20px;
            height: 50px;
            border: none;
            border-radius: 11px;
            background: #2563eb;
            color: white;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .buy-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }


        /* INFO CARDS */

        .info-column {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .info-card {
            background: white;
            border-radius: 18px;
            padding: 23px;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.06);
        }

        .info-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 14px;
            font-size: 18px;
        }

        .blue-icon {
            background: #eff6ff;
            color: #2563eb;
        }

        .green-icon {
            background: #ecfdf5;
            color: #16a34a;
        }

        .purple-icon {
            background: #f5f3ff;
            color: #7c3aed;
        }

        .info-card h3 {
            margin: 0 0 7px;
            color: #111827;
            font-size: 17px;
        }

        .info-card p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
            line-height: 1.6;
        }


        /* FOOTER NOTE */

        .trading-note {
            margin-top: 24px;
            padding: 14px 17px;
            border-radius: 10px;
            background: #eff6ff;
            color: #475569;
            font-size: 13px;
        }

        .trading-note i {
            color: #2563eb;
            margin-right: 6px;
        }


        /* RESPONSIVE */

        @media (max-width: 1100px) {

            .stock-grid {
                grid-template-columns: repeat(3, 1fr);
            }

            .order-layout {
                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 750px) {

            .buy-page {
                padding: 20px;
            }

            .buy-page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .buy-title-section h1 {
                font-size: 30px;
            }

            .stock-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 500px) {

            .stock-grid {
                grid-template-columns: 1fr;
            }

            .selected-stock {
                flex-wrap: wrap;
            }

            .selected-price {
                margin-left: 0;
                width: 100%;
                text-align: left;
            }

        }

    </style>

</head>


<body>

<div class="layout">

    <!-- SIDEBAR -->
    <jsp:include page="components/sidebar.jsp" />


    <!-- MAIN AREA -->
    <div class="main">

        <!-- NAVBAR -->
        <jsp:include page="components/navbar.jsp" />


        <!-- BUY PAGE -->
        <main class="buy-page">
		
		<%
    String message = (String) request.getAttribute("message");

    if (message != null) {
%>

<div style="
    background:#ecfdf5;
    color:#047857;
    border:1px solid #a7f3d0;
    padding:14px 18px;
    border-radius:12px;
    margin-bottom:20px;
    font-weight:600;
">
    <i class="fa-solid fa-circle-check"></i>
    <%= message %>
</div>

<%
    }
%>

            <!-- HEADER -->

            <div class="buy-page-header">

                <div class="buy-title-section">

                    <h1>
                        <i class="fa-solid fa-arrow-trend-up"></i>
                        Buy Stocks
                    </h1>

                    <p>
                        Search for a stock and place your buy order.
                    </p>

                </div>

                <div>

                    <span class="market-status">
                        <span class="dot"></span>
                        Market Open
                    </span>

                </div>

            </div>


            <!-- STOCK SELECTOR -->

            <section class="stock-section">

                <div class="section-heading">

                    <h2>Select Stock</h2>

                    <p>
                        Choose a stock you want to purchase.
                    </p>

                </div>


                <div class="stock-grid">


                    <!-- BAJAJ -->

                    <a class="stock-card <%= "BAJFINANCE".equals(selectedSymbol) ? "selected" : "" %>"
                       href="BuyServlet?symbol=BAJFINANCE">

                        <div class="stock-top">

                            <div class="stock-logo">BF</div>

                            <span class="stock-change positive">
                                ↑ 1.24%
                            </span>

                        </div>

                        <div class="stock-name">
                            Bajaj Finance
                        </div>

                        <div class="stock-symbol">
                            BAJFINANCE
                        </div>

                        <div class="stock-price">
                            ₹9,350.00
                        </div>

                    </a>


                    <!-- DR REDDY -->

                    <a class="stock-card <%= "DRREDDY".equals(selectedSymbol) ? "selected" : "" %>"
                       href="BuyServlet?symbol=DRREDDY">

                        <div class="stock-top">

                            <div class="stock-logo">DR</div>

                            <span class="stock-change negative">
                                ↓ 0.82%
                            </span>

                        </div>

                        <div class="stock-name">
                            Dr Reddy's Laboratories
                        </div>

                        <div class="stock-symbol">
                            DRREDDY
                        </div>

                        <div class="stock-price">
                            ₹6,750.00
                        </div>

                    </a>


                    <!-- RELIANCE -->

                    <a class="stock-card <%= "RELIANCE".equals(selectedSymbol) ? "selected" : "" %>"
                       href="BuyServlet?symbol=RELIANCE">

                        <div class="stock-top">

                            <div class="stock-logo">RI</div>

                            <span class="stock-change positive">
                                ↑ 0.65%
                            </span>

                        </div>

                        <div class="stock-name">
                            Reliance Industries
                        </div>

                        <div class="stock-symbol">
                            RELIANCE
                        </div>

                        <div class="stock-price">
                            ₹3,100.00
                        </div>

                    </a>


                    <!-- HDFC -->

                    <a class="stock-card <%= "HDFCBANK".equals(selectedSymbol) ? "selected" : "" %>"
                       href="BuyServlet?symbol=HDFCBANK">

                        <div class="stock-top">

                            <div class="stock-logo">HB</div>

                            <span class="stock-change negative">
                                ↓ 0.31%
                            </span>

                        </div>

                        <div class="stock-name">
                            HDFC Bank
                        </div>

                        <div class="stock-symbol">
                            HDFCBANK
                        </div>

                        <div class="stock-price">
                            ₹1,715.00
                        </div>

                    </a>


                    <!-- TCS -->

                    <a class="stock-card <%= "TCS".equals(selectedSymbol) ? "selected" : "" %>"
                       href="BuyServlet?symbol=TCS">

                        <div class="stock-top">

                            <div class="stock-logo">TC</div>

                            <span class="stock-change positive">
                                ↑ 1.43%
                            </span>

                        </div>

                        <div class="stock-name">
                            Tata Consultancy Services
                        </div>

                        <div class="stock-symbol">
                            TCS
                        </div>

                        <div class="stock-price">
                            ₹3,550.00
                        </div>

                    </a>


                </div>

            </section>



            <!-- ORDER + INFORMATION -->

            <div class="order-layout">


                <!-- ORDER CARD -->

                <section class="order-card">

                    <h2>
                        <i class="fa-solid fa-cart-shopping"
                           style="color:#2563eb;margin-right:8px;"></i>

                        Place Buy Order
                    </h2>

                    <p class="order-card-subtitle">
                        Review your order before purchasing.
                    </p>


                    <!-- SELECTED STOCK -->

                    <div class="selected-stock">

                        <div class="selected-stock-logo">

                            <%
                                String selectedName = "Bajaj Finance";
                                String selectedPrice = "₹9,350.00";
                                String selectedCode = "BAJFINANCE";

                                if ("DRREDDY".equals(selectedSymbol)) {
                                    selectedName = "Dr Reddy's Laboratories";
                                    selectedPrice = "₹6,750.00";
                                    selectedCode = "DRREDDY";
                                }
                                else if ("RELIANCE".equals(selectedSymbol)) {
                                    selectedName = "Reliance Industries";
                                    selectedPrice = "₹3,100.00";
                                    selectedCode = "RELIANCE";
                                }
                                else if ("HDFCBANK".equals(selectedSymbol)) {
                                    selectedName = "HDFC Bank";
                                    selectedPrice = "₹1,715.00";
                                    selectedCode = "HDFCBANK";
                                }
                                else if ("TCS".equals(selectedSymbol)) {
                                    selectedName = "Tata Consultancy Services";
                                    selectedPrice = "₹3,550.00";
                                    selectedCode = "TCS";
                                }
                            %>

                            <%= selectedCode.substring(0, Math.min(2, selectedCode.length())) %>

                        </div>


                        <div class="selected-stock-info">

                            <h3>
                                <%= selectedName %>
                            </h3>

                            <span>
                                <%= selectedCode %>
                            </span>

                        </div>


                        <div class="selected-price">

                            <small>Current Price</small>

                            <strong>
                                <%= selectedPrice %>
                            </strong>

                        </div>

                    </div>



                    <!-- ORDER FORM -->

                    <form action="BuyServlet" method="post">


                        <input type="hidden"
                               name="symbol"
                               value="<%= selectedSymbol %>">


                        <div class="mb-4">

                            <label class="form-label">
                                Quantity
                            </label>

                            <div class="quantity-box">

                                <button type="button"
                                        class="quantity-btn"
                                        onclick="decreaseQuantity()">
                                    −
                                </button>

                                <input
                                    type="number"
                                    id="quantity"
                                    name="quantity"
                                    value="1"
                                    min="1"
                                    class="quantity-input"
                                    onchange="updateTotal()">

                                <button type="button"
                                        class="quantity-btn"
                                        onclick="increaseQuantity()">
                                    +
                                </button>

                            </div>

                        </div>



                        <div class="mb-3">

                            <label class="form-label">
                                Order Type
                            </label>

                            <select name="orderType"
                                    class="order-select">

                                <option value="MARKET">
                                    Market Order
                                </option>

                                <option value="LIMIT">
                                    Limit Order
                                </option>

                            </select>

                        </div>



                        <!-- SUMMARY -->

                        <div class="order-summary">

                            <div class="summary-row">

                                <span>Available Balance</span>

                                <strong>
                                    ₹2,40,000.00
                                </strong>

                            </div>


                            <div class="summary-row">

                                <span>Price</span>

                                <strong id="displayPrice">
                                    <%= selectedPrice %>
                                </strong>

                            </div>


                            <div class="summary-row">

                                <span>Quantity</span>

                                <strong id="displayQuantity">
                                    1
                                </strong>

                            </div>


                            <div class="summary-row total-row">

                                <span>Total Order Value</span>

                                <strong id="totalValue">
                                    <%= selectedPrice %>
                                </strong>

                            </div>

                        </div>



                        <button type="submit"
                                class="buy-btn">

                            <i class="fa-solid fa-arrow-trend-up"></i>

                            Buy Stock

                        </button>


                        <div class="trading-note">

                            <i class="fa-solid fa-circle-info"></i>

                            Orders are simulated for this virtual trading platform.

                        </div>


                    </form>

                </section>



                <!-- INFORMATION COLUMN -->

                <div class="info-column">


                    <div class="info-card">

                        <div class="info-icon blue-icon">

                            <i class="fa-solid fa-shield-halved"></i>

                        </div>

                        <h3>
                            Secure Trading
                        </h3>

                        <p>
                            Your virtual trading account is protected
                            and designed for safe practice.
                        </p>

                    </div>


                    <div class="info-card">

                        <div class="info-icon green-icon">

                            <i class="fa-solid fa-chart-line"></i>

                        </div>

                        <h3>
                            Track Performance
                        </h3>

                        <p>
                            Monitor your purchased stocks from the
                            Portfolio and Watchlist.
                        </p>

                    </div>


                    <div class="info-card">

                        <div class="info-icon purple-icon">

                            <i class="fa-solid fa-wallet"></i>

                        </div>

                        <h3>
                            Virtual Balance
                        </h3>

                        <p>
                            Practice investing using your TradeX
                            virtual wallet.
                        </p>

                    </div>


                </div>

            </div>


        </main>


        <!-- FOOTER -->

        <jsp:include page="components/footer.jsp" />

    </div>

</div>



<script>

    const priceText = "<%= selectedPrice %>";

    const price =
        parseFloat(
            priceText.replace("₹", "").replace(/,/g, "")
        );


    function increaseQuantity() {

        const input = document.getElementById("quantity");

        input.value = parseInt(input.value || 1) + 1;

        updateTotal();
    }


    function decreaseQuantity() {

        const input = document.getElementById("quantity");

        let value = parseInt(input.value || 1);

        if (value > 1) {
            value--;
        }

        input.value = value;

        updateTotal();
    }


    function updateTotal() {

        const quantity =
            parseInt(
                document.getElementById("quantity").value || 1
            );

        document.getElementById("displayQuantity").innerText =
            quantity;

        document.getElementById("totalValue").innerText =
            "₹" +
            (price * quantity).toLocaleString("en-IN", {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
    }

</script>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<script src="js/script.js"></script>

</body>

</html>