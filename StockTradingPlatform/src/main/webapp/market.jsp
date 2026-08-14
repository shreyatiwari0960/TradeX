<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Market | TradeX</title>

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Main TradeX CSS -->
    <link rel="stylesheet" href="css/style.css">

    <style>

        /* =====================================================
           TRADEX MARKET PAGE
           ===================================================== */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fc;
            color: #111827;
        }

        .market-page {
            min-height: 100vh;
            background: #f4f7fc;
        }

        /* ================= HEADER ================= */

        .market-header {
            background: #ffffff;
            padding: 28px 40px 20px;
            border-bottom: 1px solid #e8edf5;
        }

        .market-header-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 25px;
        }

        .market-title-section h1 {
            font-size: 32px;
            font-weight: 800;
            color: #111827;
            display: flex;
            align-items: center;
            gap: 13px;
        }

        .market-title-section h1 i {
            color: #2563eb;
            font-size: 29px;
        }

        .market-title-section p {
            margin-top: 7px;
            color: #64748b;
            font-size: 14px;
        }

        /* ================= SEARCH ================= */

        .market-search {
            width: 360px;
            position: relative;
        }

        .market-search i {
            position: absolute;
            left: 17px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }

        .market-search input {
            width: 100%;
            height: 48px;
            border: none;
            outline: none;
            border-radius: 13px;
            background: #f1f5f9;
            padding: 0 18px 0 46px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            color: #1e293b;
        }

        .market-search input:focus {
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        /* ================= CONTENT ================= */

        .market-content {
            padding: 30px 40px 50px;
        }

        /* ================= MARKET SUMMARY ================= */

        .market-summary {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: #ffffff;
            border-radius: 18px;
            padding: 22px;
            border: 1px solid #edf1f7;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.05);
        }

        .summary-card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 17px;
        }

        .summary-icon {
            width: 46px;
            height: 46px;
            border-radius: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            color: #2563eb;
            font-size: 19px;
        }

        .summary-card:nth-child(2) .summary-icon {
            background: #ecfdf5;
            color: #16a34a;
        }

        .summary-card:nth-child(3) .summary-icon {
            background: #fff7ed;
            color: #ea580c;
        }

        .summary-card:nth-child(4) .summary-icon {
            background: #f5f3ff;
            color: #7c3aed;
        }

        .summary-status {
            font-size: 11px;
            font-weight: 600;
            color: #16a34a;
            background: #ecfdf5;
            padding: 5px 9px;
            border-radius: 20px;
        }

        .summary-card h3 {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #64748b;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .summary-card .summary-value {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
        }

        /* ================= MARKET SECTION ================= */

        .market-section {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid #edf1f7;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.05);
            overflow: hidden;
        }

        .market-section-header {
            padding: 24px 26px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #edf1f7;
        }

        .market-section-header h2 {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
        }

        .market-section-header p {
            margin-top: 4px;
            font-size: 12px;
            color: #64748b;
        }

        .market-filter {
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .filter-btn {
            border: none;
            background: #f1f5f9;
            color: #475569;
            padding: 9px 15px;
            border-radius: 9px;
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .filter-btn.active {
            background: #2563eb;
            color: #ffffff;
        }

        /* ================= TABLE ================= */

        .market-table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .market-table {
            width: 100%;
            border-collapse: collapse;
        }

        .market-table thead {
            background: #f8fafc;
        }

        .market-table th {
            text-align: left;
            padding: 15px 20px;
            font-size: 11px;
            color: #64748b;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            white-space: nowrap;
        }

        .market-table td {
            padding: 17px 20px;
            border-top: 1px solid #f1f5f9;
            font-size: 13px;
            color: #334155;
            white-space: nowrap;
        }

        .market-table tbody tr {
            transition: background 0.2s ease;
        }

        .market-table tbody tr:hover {
            background: #f8fbff;
        }

        /* ================= STOCK NAME ================= */

        .stock-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .stock-logo {
            width: 40px;
            height: 40px;
            border-radius: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            color: #2563eb;
            font-size: 15px;
            font-weight: 700;
        }

        .stock-name {
            font-size: 13px;
            font-weight: 700;
            color: #111827;
        }

        .stock-symbol {
            display: block;
            margin-top: 2px;
            font-size: 10px;
            color: #94a3b8;
        }

        .price {
            font-weight: 700;
            color: #111827;
        }

        /* ================= CHANGE ================= */

        .positive {
            color: #16a34a !important;
            font-weight: 700;
        }

        .negative {
            color: #dc2626 !important;
            font-weight: 700;
        }

        .change-pill {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 9px;
            border-radius: 8px;
            font-size: 11px;
            font-weight: 700;
        }

        .change-pill.positive-bg {
            background: #ecfdf5;
            color: #16a34a;
        }

        .change-pill.negative-bg {
            background: #fef2f2;
            color: #dc2626;
        }

        /* ================= ACTIONS ================= */

        .stock-actions {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .buy-btn {
            border: none;
            background: #2563eb;
            color: #ffffff;
            padding: 8px 14px;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .buy-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        .watch-btn {
            width: 34px;
            height: 34px;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            color: #64748b;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s;
        }

        .watch-btn:hover {
            color: #f59e0b;
            border-color: #f59e0b;
            background: #fffbeb;
        }

        /* ================= EMPTY / DEMO ================= */

        .market-empty {
            padding: 60px 20px;
            text-align: center;
            color: #64748b;
        }

        .market-empty i {
            font-size: 42px;
            color: #cbd5e1;
            margin-bottom: 15px;
        }

        .market-empty h3 {
            font-size: 18px;
            color: #334155;
            margin-bottom: 6px;
        }

        .market-empty p {
            font-size: 13px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1200px) {

            .market-summary {
                grid-template-columns: repeat(2, 1fr);
            }

            .market-header-top {
                align-items: flex-start;
            }

            .market-search {
                width: 300px;
            }
        }

        @media (max-width: 800px) {

            .market-header {
                padding: 22px 20px;
            }

            .market-header-top {
                flex-direction: column;
            }

            .market-search {
                width: 100%;
            }

            .market-content {
                padding: 22px 20px 40px;
            }

            .market-summary {
                grid-template-columns: 1fr;
            }

            .market-section-header {
                align-items: flex-start;
                flex-direction: column;
                gap: 15px;
            }
        }

    </style>

</head>

<body>

<div class="market-page">

    <!-- =====================================================
         MARKET HEADER
         ===================================================== -->

    <section class="market-header">

        <div class="market-header-top">

            <div class="market-title-section">

                <h1>
                    <i class="fa-solid fa-chart-line"></i>
                    Market
                </h1>

                <p>
                    Explore stocks, track market movements, and find your next investment.
                </p>

            </div>

            <div class="market-search">

                <i class="fa-solid fa-magnifying-glass"></i>

                <input
                    type="text"
                    id="stockSearch"
                    placeholder="Search stocks, companies..."
                    autocomplete="off">

            </div>

        </div>

    </section>


    <!-- =====================================================
         MARKET CONTENT
         ===================================================== -->

    <main class="market-content">


        <!-- ================= SUMMARY CARDS ================= -->

        <section class="market-summary">

            <div class="summary-card">

                <div class="summary-card-top">

                    <div class="summary-icon">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>

                    <span class="summary-status">
                        <i class="fa-solid fa-circle"></i>
                        Live
                    </span>

                </div>

                <h3>Market Status</h3>

                <div class="summary-value">
                    Market Open
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-card-top">

                    <div class="summary-icon">
                        <i class="fa-solid fa-arrow-trend-up"></i>
                    </div>

                    <span class="summary-status">
                        Today
                    </span>

                </div>

                <h3>Market Trend</h3>

                <div class="summary-value positive">
                    Bullish
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-card-top">

                    <div class="summary-icon">
                        <i class="fa-solid fa-chart-column"></i>
                    </div>

                    <span class="summary-status">
                        NSE
                    </span>

                </div>

                <h3>Market Index</h3>

                <div class="summary-value">
                    NIFTY 50
                </div>

            </div>


            <div class="summary-card">

                <div class="summary-card-top">

                    <div class="summary-icon">
                        <i class="fa-solid fa-layer-group"></i>
                    </div>

                    <span class="summary-status">
                        Available
                    </span>

                </div>

                <h3>Listed Stocks</h3>

                <div class="summary-value">
                    5 Stocks
                </div>

            </div>

        </section>


        <!-- =====================================================
             STOCK MARKET TABLE
             ===================================================== -->

        <section class="market-section">

            <div class="market-section-header">

                <div>

                    <h2>Stocks</h2>

                    <p>
                        Track available stocks and their current market performance.
                    </p>

                </div>


                <div class="market-filter">

                    <button
                        type="button"
                        class="filter-btn active"
                        onclick="filterStocks('all', this)">
                        All
                    </button>

                    <button
                        type="button"
                        class="filter-btn"
                        onclick="filterStocks('gainers', this)">
                        Gainers
                    </button>

                    <button
                        type="button"
                        class="filter-btn"
                        onclick="filterStocks('losers', this)">
                        Losers
                    </button>

                </div>

            </div>


            <div class="market-table-wrapper">

                <table class="market-table">

                    <thead>

                        <tr>

                            <th>Stock</th>

                            <th>Price</th>

                            <th>Change</th>

                            <th>Market</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody id="stockTableBody">

                        <!-- Stock rows will be connected to your
                             existing MarketServlet data in Part 2 -->

                        <tr class="stock-row" data-change="positive">

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

                            <td class="price">
                                ₹ 9,350.00
                            </td>

                            <td>
                                <span class="change-pill positive-bg">
                                    <i class="fa-solid fa-arrow-up"></i>
                                    +1.24%
                                </span>
                            </td>

                            <td>
                                NSE
                            </td>

                            <td>

                                <div class="stock-actions">

                                    <button
                                        class="buy-btn"
                                        type="button">
                                        Buy
                                    </button>

                                    <button
                                        class="watch-btn"
                                        type="button"
                                        title="Add to Watchlist">

                                        <i class="fa-regular fa-star"></i>

                                    </button>

                                </div>

                            </td>

                        </tr>


                        <tr class="stock-row" data-change="negative">

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

                            <td class="price">
                                ₹ 6,750.00
                            </td>

                            <td>

                                <span class="change-pill negative-bg">
                                    <i class="fa-solid fa-arrow-down"></i>
                                    -0.82%
                                </span>

                            </td>

                            <td>
                                NSE
                            </td>

                            <td>

                                <div class="stock-actions">

                                    <button
                                        class="buy-btn"
                                        type="button">
                                        Buy
                                    </button>

                                    <button
                                        class="watch-btn"
                                        type="button"
                                        title="Add to Watchlist">

                                        <i class="fa-regular fa-star"></i>

                                    </button>

                                </div>

                            </td>

                        </tr>


                        <tr class="stock-row" data-change="positive">

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

                            <td class="price">
                                ₹ 3,100.00
                            </td>

                            <td>

                                <span class="change-pill positive-bg">
                                    <i class="fa-solid fa-arrow-up"></i>
                                    +0.65%
                                </span>

                            </td>

                            <td>
                                NSE
                            </td>

                            <td>

                                <div class="stock-actions">

                                    <button
                                        class="buy-btn"
                                        type="button">
                                        Buy
                                    </button>

                                    <button
                                        class="watch-btn"
                                        type="button"
                                        title="Add to Watchlist">

                                        <i class="fa-regular fa-star"></i>

                                    </button>

                                </div>

                            </td>

                        </tr>


                        <tr class="stock-row" data-change="negative">

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

                            <td class="price">
                                ₹ 1,715.00
                            </td>

                            <td>

                                <span class="change-pill negative-bg">
                                    <i class="fa-solid fa-arrow-down"></i>
                                    -0.31%
                                </span>

                            </td>

                            <td>
                                NSE
                            </td>

                            <td>

                                <div class="stock-actions">

                                    <button
                                        class="buy-btn"
                                        type="button">
                                        Buy
                                    </button>

                                    <button
                                        class="watch-btn"
                                        type="button"
                                        title="Add to Watchlist">

                                        <i class="fa-regular fa-star"></i>

                                    </button>

                                </div>

                            </td>

                        </tr>


                        <tr class="stock-row" data-change="positive">

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

                            <td class="price">
                                ₹ 3,550.00
                            </td>

                            <td>

                                <span class="change-pill positive-bg">
                                    <i class="fa-solid fa-arrow-up"></i>
                                    +1.43%
                                </span>

                            </td>

                            <td>
                                NSE
                            </td>

                            <td>

                                <div class="stock-actions">

                                    <button
                                        class="buy-btn"
                                        type="button">
                                        Buy
                                    </button>

                                    <button
                                        class="watch-btn"
                                        type="button"
                                        title="Add to Watchlist">

                                        <i class="fa-regular fa-star"></i>

                                    </button>

                                </div>

                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>

        </section>

    </main>

</div>


<script>

    /* ===============================
       STOCK SEARCH
       =============================== */

    const searchInput = document.getElementById("stockSearch");

    searchInput.addEventListener("input", function () {

        const searchValue =
            this.value.toLowerCase().trim();

        const rows =
            document.querySelectorAll(".stock-row");

        rows.forEach(function (row) {

            const text =
                row.innerText.toLowerCase();

            row.style.display =
                text.includes(searchValue)
                    ? ""
                    : "none";

        });

    });


    /* ===============================
       STOCK FILTER
       =============================== */

    function filterStocks(type, button) {

        const buttons =
            document.querySelectorAll(".filter-btn");

        buttons.forEach(function (btn) {
            btn.classList.remove("active");
        });

        button.classList.add("active");

        const rows =
            document.querySelectorAll(".stock-row");

        rows.forEach(function (row) {

            const change =
                row.getAttribute("data-change");

            if (type === "all") {
                row.style.display = "";
            }

            else if (type === "gainers") {
                row.style.display =
                    change === "positive" ? "" : "none";
            }

            else if (type === "losers") {
                row.style.display =
                    change === "negative" ? "" : "none";
            }

        });

    }


    /* ===============================
       WATCHLIST BUTTON
       =============================== */

    document.querySelectorAll(".watch-btn").forEach(function (button) {

        button.addEventListener("click", function () {

            const icon =
                this.querySelector("i");

            if (icon.classList.contains("fa-regular")) {

                icon.classList.remove("fa-regular");
                icon.classList.add("fa-solid");

                this.style.color = "#f59e0b";
                this.style.borderColor = "#f59e0b";
                this.style.background = "#fffbeb";

            } else {

                icon.classList.remove("fa-solid");
                icon.classList.add("fa-regular");

                this.style.color = "";
                this.style.borderColor = "";
                this.style.background = "";

            }

        });

    });

</script>

</body>
</html>