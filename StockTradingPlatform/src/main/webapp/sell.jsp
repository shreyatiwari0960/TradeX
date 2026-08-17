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
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sell Stocks | TradeX</title>

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

        /* ================================
           SELL PAGE
        ================================= */

        .sell-page {
            background: #f4f7fc;
            min-height: calc(100vh - 80px);
            padding: 40px;
        }

        /* Header */

        .sell-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 32px;
        }

        .sell-title-section {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .sell-title-icon {
            width: 58px;
            height: 58px;
            background: #eef4ff;
            color: #2864e8;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .sell-title {
            margin: 0;
            font-size: 38px;
            font-weight: 800;
            color: #14213d;
        }

        .sell-subtitle {
            margin: 6px 0 0;
            color: #70809b;
            font-size: 16px;
        }

        .market-status {
            background: #e9fbf2;
            color: #08a45b;
            padding: 12px 18px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 700;
            white-space: nowrap;
        }

        .market-status i {
            font-size: 9px;
            margin-right: 7px;
        }

        /* Main grid */

        .sell-grid {
            display: grid;
            grid-template-columns: minmax(0, 1.7fr) minmax(280px, 0.8fr);
            gap: 28px;
            align-items: start;
        }

        /* Cards */

        .sell-card {
            background: #ffffff;
            border-radius: 22px;
            padding: 30px;
            box-shadow: 0 8px 28px rgba(28, 45, 80, 0.07);
            border: 1px solid #edf1f7;
        }

        .card-heading {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 7px;
        }

        .card-heading-icon {
            width: 44px;
            height: 44px;
            border-radius: 13px;
            background: #eef4ff;
            color: #2864e8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .card-heading h2 {
            margin: 0;
            color: #17233d;
            font-size: 24px;
            font-weight: 800;
        }

        .card-description {
            margin: 0 0 24px;
            color: #71809a;
            font-size: 14px;
        }

        /* Holdings */

        .holdings-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .holding-card {
            border: 2px solid #edf1f7;
            border-radius: 16px;
            padding: 20px;
            display: grid;
            grid-template-columns: 55px minmax(0, 1fr) auto auto;
            align-items: center;
            gap: 18px;
            cursor: pointer;
            transition: 0.2s ease;
            background: #fff;
        }

        .holding-card:hover {
            border-color: #2864e8;
            box-shadow: 0 6px 18px rgba(40, 100, 232, 0.08);
        }

        .holding-card.selected {
            border-color: #2864e8;
            background: #f3f7ff;
        }

        .stock-icon {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            background: #eef4ff;
            color: #2864e8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: 800;
        }

        .stock-name {
            font-size: 16px;
            font-weight: 800;
            color: #17233d;
            margin-bottom: 3px;
        }

        .stock-symbol {
            color: #8a98ae;
            font-size: 13px;
        }

        .stock-price {
            font-size: 16px;
            font-weight: 800;
            color: #17233d;
        }

        .stock-change {
            font-size: 14px;
            font-weight: 700;
            min-width: 70px;
            text-align: right;
        }

        .positive {
            color: #08a45b;
        }

        .negative {
            color: #ef3340;
        }

        .shares {
            background: #f4f7fc;
            padding: 7px 12px;
            border-radius: 20px;
            color: #66758f;
            font-size: 13px;
            font-weight: 700;
            white-space: nowrap;
        }

        /* Order panel */

        .order-panel {
            margin-top: 28px;
            background: #ffffff;
            border-radius: 22px;
            padding: 30px;
            box-shadow: 0 8px 28px rgba(28, 45, 80, 0.07);
            border: 1px solid #edf1f7;
        }

        .selected-stock {
            display: flex;
            align-items: center;
            gap: 15px;
            background: #f5f8ff;
            border-radius: 15px;
            padding: 18px;
            margin-bottom: 24px;
        }

        .selected-stock-info strong {
            display: block;
            color: #17233d;
            font-size: 16px;
        }

        .selected-stock-info span {
            color: #7d8ca5;
            font-size: 13px;
        }

        .order-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            color: #66758f;
            margin-bottom: 8px;
        }

        .quantity-control {
            display: flex;
            border: 1px solid #dce3ef;
            border-radius: 12px;
            overflow: hidden;
            height: 48px;
        }

        .quantity-control button {
            width: 48px;
            border: none;
            background: #f4f7fc;
            font-size: 18px;
            color: #2864e8;
            cursor: pointer;
        }

        .quantity-control input {
            flex: 1;
            border: none;
            text-align: center;
            font-size: 16px;
            font-weight: 700;
            outline: none;
        }

        .order-select {
            width: 100%;
            height: 48px;
            border: 1px solid #dce3ef;
            border-radius: 12px;
            padding: 0 14px;
            font-size: 14px;
            outline: none;
        }

        .order-summary {
            background: #f7f9fd;
            border-radius: 15px;
            padding: 18px;
            margin-top: 8px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 7px 0;
            color: #697891;
            font-size: 14px;
        }

        .summary-row strong {
            color: #17233d;
        }

        .total-row {
            border-top: 1px solid #e1e7f0;
            margin-top: 8px;
            padding-top: 14px;
            font-size: 16px;
        }

        .total-row strong {
            color: #17233d;
            font-size: 18px;
        }

        .sell-button {
            width: 100%;
            height: 52px;
            margin-top: 20px;
            border: none;
            border-radius: 13px;
            background: #ef3340;
            color: white;
            font-size: 16px;
            font-weight: 800;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .sell-button:hover {
            background: #d92532;
            transform: translateY(-1px);
        }

        /* Side information */

        .info-card {
            background: #ffffff;
            border-radius: 22px;
            padding: 28px;
            box-shadow: 0 8px 28px rgba(28, 45, 80, 0.07);
            border: 1px solid #edf1f7;
            margin-bottom: 20px;
        }

        .info-icon {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            background: #eef4ff;
            color: #2864e8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            margin-bottom: 18px;
        }

        .info-card h3 {
            margin: 0 0 8px;
            color: #17233d;
            font-size: 19px;
            font-weight: 800;
        }

        .info-card p {
            margin: 0;
            color: #74829a;
            font-size: 14px;
            line-height: 1.7;
        }

        .balance-card {
            background: linear-gradient(135deg, #2864e8, #4b7ff0);
            color: white;
            border: none;
        }

        .balance-card .info-icon {
            background: rgba(255,255,255,0.16);
            color: white;
        }

        .balance-card h3,
        .balance-card p {
            color: white;
        }

        .balance-amount {
            font-size: 27px;
            font-weight: 800;
            margin-top: 12px;
        }

        .note {
            display: flex;
            gap: 10px;
            margin-top: 20px;
            padding: 13px;
            background: #fff7e8;
            color: #9b6a00;
            border-radius: 12px;
            font-size: 12px;
            line-height: 1.5;
        }

        /* Responsive */

        @media (max-width: 1100px) {

            .sell-grid {
                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 750px) {

            .sell-page {
                padding: 20px;
            }

            .sell-header {
                flex-direction: column;
                gap: 20px;
            }

            .sell-title {
                font-size: 30px;
            }

            .holding-card {
                grid-template-columns: 48px 1fr;
            }

            .stock-price,
            .stock-change,
            .shares {
                display: none;
            }

            .order-row {
                grid-template-columns: 1fr;
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


        <main class="sell-page">

            <!-- =========================
                 PAGE HEADER
            ========================== -->

            <div class="sell-header">

                <div class="sell-title-section">

                    <div class="sell-title-icon">
                        <i class="fa-solid fa-arrow-trend-down"></i>
                    </div>

                    <div>

                        <h1 class="sell-title">
                            Sell Stocks
                        </h1>

                        <p class="sell-subtitle">
                            Sell stocks from your portfolio and manage your positions.
                        </p>

                    </div>

                </div>


                <div class="market-status">

                    <i class="fa-solid fa-circle"></i>
                    Market Open

                </div>

            </div>


            <!-- =========================
                 MAIN CONTENT
            ========================== -->

            <div class="sell-grid">


                <!-- LEFT COLUMN -->

                <div>


                    <!-- HOLDINGS -->

                    <section class="sell-card">

                        <div class="card-heading">

                            <div class="card-heading-icon">
                                <i class="fa-solid fa-briefcase"></i>
                            </div>

                            <h2>Select Stock</h2>

                        </div>

                        <p class="card-description">
                            Choose a stock from your current holdings.
                        </p>


                        <div class="holdings-list">


                            <!-- BAJAJ -->

                            <div class="holding-card selected">

                                <div class="stock-icon">
                                    BF
                                </div>

                                <div>

                                    <div class="stock-name">
                                        Bajaj Finance
                                    </div>

                                    <div class="stock-symbol">
                                        BAJFINANCE
                                    </div>

                                </div>

                                <div class="stock-price">
                                    ₹9,350.00
                                </div>

                                <div class="stock-change positive">
                                    ↑ 1.24%
                                </div>

                                <div class="shares">
                                    5 Shares
                                </div>

                            </div>


                            <!-- DR REDDY -->

                            <div class="holding-card">

                                <div class="stock-icon">
                                    DR
                                </div>

                                <div>

                                    <div class="stock-name">
                                        Dr Reddy's Laboratories
                                    </div>

                                    <div class="stock-symbol">
                                        DRREDDY
                                    </div>

                                </div>

                                <div class="stock-price">
                                    ₹6,750.00
                                </div>

                                <div class="stock-change negative">
                                    ↓ 0.82%
                                </div>

                                <div class="shares">
                                    3 Shares
                                </div>

                            </div>


                            <!-- RELIANCE -->

                            <div class="holding-card">

                                <div class="stock-icon">
                                    RI
                                </div>

                                <div>

                                    <div class="stock-name">
                                        Reliance Industries
                                    </div>

                                    <div class="stock-symbol">
                                        RELIANCE
                                    </div>

                                </div>

                                <div class="stock-price">
                                    ₹3,100.00
                                </div>

                                <div class="stock-change positive">
                                    ↑ 0.65%
                                </div>

                                <div class="shares">
                                    8 Shares
                                </div>

                            </div>


                            <!-- HDFC -->

                            <div class="holding-card">

                                <div class="stock-icon">
                                    HB
                                </div>

                                <div>

                                    <div class="stock-name">
                                        HDFC Bank
                                    </div>

                                    <div class="stock-symbol">
                                        HDFCBANK
                                    </div>

                                </div>

                                <div class="stock-price">
                                    ₹1,715.00
                                </div>

                                <div class="stock-change negative">
                                    ↓ 0.31%
                                </div>

                                <div class="shares">
                                    10 Shares
                                </div>

                            </div>


                            <!-- TCS -->

                            <div class="holding-card">

                                <div class="stock-icon">
                                    TC
                                </div>

                                <div>

                                    <div class="stock-name">
                                        Tata Consultancy Services
                                    </div>

                                    <div class="stock-symbol">
                                        TCS
                                    </div>

                                </div>

                                <div class="stock-price">
                                    ₹3,550.00
                                </div>

                                <div class="stock-change positive">
                                    ↑ 1.43%
                                </div>

                                <div class="shares">
                                    6 Shares
                                </div>

                            </div>


                        </div>

                    </section>


                    <!-- SELL ORDER -->

                    <section class="order-panel">

                        <div class="card-heading">

                            <div class="card-heading-icon">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>

                            <h2>Place Sell Order</h2>

                        </div>

                        <p class="card-description">
                            Review your order before selling.
                        </p>


                        <div class="selected-stock">

                            <div class="stock-icon">
                                BF
                            </div>

                            <div class="selected-stock-info">

                                <strong>
                                    Bajaj Finance
                                </strong>

                                <span>
                                    BAJFINANCE • ₹9,350.00 per share
                                </span>

                            </div>

                        </div>


                        <div class="order-row">


                            <div class="form-group">

                                <label>
                                    Quantity
                                </label>

                                <div class="quantity-control">

                                    <button type="button"
                                        onclick="changeQuantity(-1)">
                                        −
                                    </button>

                                    <input
                                        type="number"
                                        id="quantity"
                                        value="1"
                                        min="1"
                                        max="5"
                                        readonly>

                                    <button type="button"
                                        onclick="changeQuantity(1)">
                                        +
                                    </button>

                                </div>

                            </div>


                            <div class="form-group">

                                <label>
                                    Order Type
                                </label>

                                <select class="order-select">

                                    <option>
                                        Market Order
                                    </option>

                                    <option>
                                        Limit Order
                                    </option>

                                </select>

                            </div>

                        </div>


                        <div class="order-summary">

                            <div class="summary-row">

                                <span>
                                    Selling Price
                                </span>

                                <strong>
                                    ₹9,350.00
                                </strong>

                            </div>


                            <div class="summary-row">

                                <span>
                                    Quantity
                                </span>

                                <strong id="summaryQuantity">
                                    1
                                </strong>

                            </div>


                            <div class="summary-row total-row">

                                <span>
                                    Total Sell Value
                                </span>

                                <strong id="totalValue">
                                    ₹9,350.00
                                </strong>

                            </div>

                        </div>


                        <button class="sell-button"
                            type="button"
                            onclick="sellStock()">

                            <i class="fa-solid fa-arrow-trend-down"></i>

                            Sell Stock

                        </button>


                        <div class="note">

                            <i class="fa-solid fa-circle-info"></i>

                            <span>
                                Orders are simulated for this virtual trading platform.
                            </span>

                        </div>

                    </section>

                </div>


                <!-- RIGHT COLUMN -->

                <div>


                    <!-- BALANCE -->

                    <div class="info-card balance-card">

                        <div class="info-icon">
                            <i class="fa-solid fa-wallet"></i>
                        </div>

                        <h3>
                            Available Balance
                        </h3>

                        <p>
                            Your current virtual wallet balance.
                        </p>

                        <div class="balance-amount">
                            ₹2,40,000.00
                        </div>

                    </div>


                    <!-- SECURE TRADING -->

                    <div class="info-card">

                        <div class="info-icon">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>

                        <h3>
                            Secure Trading
                        </h3>

                        <p>
                            Your virtual trading account is protected and designed
                            for safe investment practice.
                        </p>

                    </div>


                    <!-- PORTFOLIO -->

                    <div class="info-card">

                        <div class="info-icon">
                            <i class="fa-solid fa-chart-line"></i>
                        </div>

                        <h3>
                            Track Performance
                        </h3>

                        <p>
                            Monitor your remaining holdings and overall performance
                            from the Portfolio page.
                        </p>

                    </div>


                    <!-- REMINDER -->

                    <div class="info-card">

                        <div class="info-icon">
                            <i class="fa-solid fa-lightbulb"></i>
                        </div>

                        <h3>
                            Smart Selling
                        </h3>

                        <p>
                            Review your holdings and order quantity carefully before
                            confirming a simulated trade.
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

    const stockPrice = 9350;
    const maxShares = 5;


    function changeQuantity(amount) {

        const input = document.getElementById("quantity");

        let quantity = parseInt(input.value) + amount;

        if (quantity < 1) {
            quantity = 1;
        }

        if (quantity > maxShares) {
            quantity = maxShares;
        }

        input.value = quantity;

        document.getElementById("summaryQuantity").innerText = quantity;

        document.getElementById("totalValue").innerText =
            "₹" + (stockPrice * quantity).toLocaleString("en-IN") + ".00";
    }


    function sellStock() {

        const quantity =
            document.getElementById("quantity").value;

        alert(
            "Sell order placed successfully!\n\n" +
            "Stock: Bajaj Finance\n" +
            "Quantity: " + quantity + " shares\n" +
            "Order Value: ₹" +
            (stockPrice * quantity).toLocaleString("en-IN") +
            ".00"
        );

    }


    /* Make stock cards selectable */

    document.querySelectorAll(".holding-card").forEach(card => {

        card.addEventListener("click", function() {

            document.querySelectorAll(".holding-card")
                .forEach(item => item.classList.remove("selected"));

            this.classList.add("selected");

        });

    });

</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/script.js"></script>

</body>

</html>