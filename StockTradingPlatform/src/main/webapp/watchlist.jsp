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

    request.setAttribute("activePage", "watchlist");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Watchlist | TradeX</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <link rel="stylesheet"
          href="css/style.css">

    <style>

        /* =========================
           WATCHLIST PAGE
        ========================== */

        .watchlist-page {
            padding: 30px;
            background: #f4f7fc;
            min-height: calc(100vh - 80px);
        }

        .watchlist-hero {
            background: #ffffff;
            border-radius: 18px;
            padding: 28px 30px;
            margin-bottom: 24px;
            box-shadow: 0 8px 25px rgba(30, 50, 90, 0.06);
        }

        .watchlist-title {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 0;
            color: #101828;
            font-size: 34px;
            font-weight: 800;
        }

        .watchlist-title i {
            color: #2864e6;
        }

        .watchlist-subtitle {
            margin: 8px 0 0;
            color: #64748b;
            font-size: 15px;
        }

        .watchlist-box {
            background: #ffffff;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(30, 50, 90, 0.07);
        }

        .watchlist-box-header {
            padding: 24px 28px;
            border-bottom: 1px solid #e8edf5;
        }

        .watchlist-box-header h2 {
            margin: 0;
            font-size: 20px;
            font-weight: 800;
            color: #101828;
        }

        .watchlist-row {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 100px;
            align-items: center;
            gap: 20px;
            padding: 18px 28px;
            border-bottom: 1px solid #edf1f6;
        }

        .watchlist-row:last-child {
            border-bottom: none;
        }

        .watchlist-row:hover {
            background: #f8fbff;
        }

        .watch-stock {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .watch-logo {
            width: 42px;
            height: 42px;
            border-radius: 11px;
            background: #edf4ff;
            color: #2864e6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
        }

        .watch-name {
            display: block;
            font-weight: 700;
            color: #111827;
        }

        .watch-symbol {
            display: block;
            margin-top: 3px;
            color: #94a3b8;
            font-size: 12px;
        }

        .watch-price {
            font-weight: 800;
            color: #111827;
        }

        .watch-change-up {
            color: #16a34a;
            font-weight: 700;
        }

        .watch-change-down {
            color: #dc2626;
            font-weight: 700;
        }

        .watch-buy {
            border: none;
            background: #2864e6;
            color: white;
            border-radius: 8px;
            padding: 9px 18px;
            font-weight: 700;
            cursor: pointer;
        }

        .watch-buy:hover {
            background: #1d4ed8;
        }

        @media (max-width: 850px) {

            .watchlist-page {
                padding: 18px;
            }

            .watchlist-title {
                font-size: 28px;
            }

            .watchlist-row {
                grid-template-columns: 1fr 1fr;
                gap: 14px;
            }

        }

        @media (max-width: 550px) {

            .watchlist-row {
                grid-template-columns: 1fr;
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

        <main class="watchlist-page">

            <!-- HERO -->
            <section class="watchlist-hero">

                <h1 class="watchlist-title">

                    <i class="fa-solid fa-star"></i>

                    My Watchlist

                </h1>

                <p class="watchlist-subtitle">
                    Keep track of stocks you are interested in
                    and monitor their performance.
                </p>

            </section>


            <!-- WATCHLIST -->
            <section class="watchlist-box">

                <div class="watchlist-box-header">

                    <h2>
                        Your Stocks
                    </h2>

                </div>


                <!-- BAJAJ -->

                <div class="watchlist-row">

                    <div class="watch-stock">

                        <div class="watch-logo">
                            BF
                        </div>

                        <div>

                            <span class="watch-name">
                                Bajaj Finance
                            </span>

                            <span class="watch-symbol">
                                BAJFINANCE
                            </span>

                        </div>

                    </div>

                    <div class="watch-price">
                        ₹9,350.00
                    </div>

                    <div class="watch-change-up">
                        ↑ 1.24%
                    </div>

                    <div>
                        <button class="watch-buy">
                            Buy
                        </button>
                    </div>

                </div>


                <!-- DR REDDY -->

                <div class="watchlist-row">

                    <div class="watch-stock">

                        <div class="watch-logo">
                            DR
                        </div>

                        <div>

                            <span class="watch-name">
                                Dr Reddy's Laboratories
                            </span>

                            <span class="watch-symbol">
                                DRREDDY
                            </span>

                        </div>

                    </div>

                    <div class="watch-price">
                        ₹6,750.00
                    </div>

                    <div class="watch-change-down">
                        ↓ 0.82%
                    </div>

                    <div>
                        <button class="watch-buy">
                            Buy
                        </button>
                    </div>

                </div>


                <!-- RELIANCE -->

                <div class="watchlist-row">

                    <div class="watch-stock">

                        <div class="watch-logo">
                            RI
                        </div>

                        <div>

                            <span class="watch-name">
                                Reliance Industries
                            </span>

                            <span class="watch-symbol">
                                RELIANCE
                            </span>

                        </div>

                    </div>

                    <div class="watch-price">
                        ₹3,100.00
                    </div>

                    <div class="watch-change-up">
                        ↑ 0.65%
                    </div>

                    <div>
                        <button class="watch-buy">
                            Buy
                        </button>
                    </div>

                </div>


                <!-- HDFC -->

                <div class="watchlist-row">

                    <div class="watch-stock">

                        <div class="watch-logo">
                            HB
                        </div>

                        <div>

                            <span class="watch-name">
                                HDFC Bank
                            </span>

                            <span class="watch-symbol">
                                HDFCBANK
                            </span>

                        </div>

                    </div>

                    <div class="watch-price">
                        ₹1,715.00
                    </div>

                    <div class="watch-change-down">
                        ↓ 0.31%
                    </div>

                    <div>
                        <button class="watch-buy">
                            Buy
                        </button>
                    </div>

                </div>


                <!-- TCS -->

                <div class="watchlist-row">

                    <div class="watch-stock">

                        <div class="watch-logo">
                            TC
                        </div>

                        <div>

                            <span class="watch-name">
                                Tata Consultancy Services
                            </span>

                            <span class="watch-symbol">
                                TCS
                            </span>

                        </div>

                    </div>

                    <div class="watch-price">
                        ₹3,550.00
                    </div>

                    <div class="watch-change-up">
                        ↑ 1.43%
                    </div>

                    <div>
                        <button class="watch-buy">
                            Buy
                        </button>
                    </div>

                </div>

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