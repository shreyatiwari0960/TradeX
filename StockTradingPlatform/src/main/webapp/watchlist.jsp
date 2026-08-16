<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Watchlist | TradeX</title>

    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet" href="css/style.css">

    <style>

        body {
            background: #f4f7fb;
            font-family: Arial, sans-serif;
        }

        .watchlist-page {
            margin-left: 210px;
            padding: 30px;
        }

        .page-header {
            background: white;
            padding: 25px 30px;
            border-radius: 18px;
            margin-bottom: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        .page-header h1 {
            font-weight: 700;
            color: #172033;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #718096;
            margin: 0;
        }

        .watchlist-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        .stock-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 18px 10px;
            border-bottom: 1px solid #edf0f5;
        }

        .stock-row:last-child {
            border-bottom: none;
        }

        .stock-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .stock-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            background: #eef4ff;
            color: #2463eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
        }

        .stock-name {
            font-weight: 700;
            color: #172033;
            margin-bottom: 3px;
        }

        .stock-symbol {
            color: #8a94a6;
            font-size: 13px;
        }

        .stock-price {
            font-weight: 700;
            color: #172033;
        }

        .positive {
            color: #16a34a;
            font-weight: 600;
        }

        .negative {
            color: #dc2626;
            font-weight: 600;
        }

        .btn-buy {
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 8px 16px;
            font-weight: 600;
        }

        .btn-buy:hover {
            background: #1d4ed8;
            color: white;
        }

        .empty-message {
            text-align: center;
            padding: 50px;
            color: #718096;
        }

        @media (max-width: 900px) {
            .watchlist-page {
                margin-left: 0;
                padding: 20px;
            }

            .stock-row {
                flex-wrap: wrap;
                gap: 15px;
            }
        }

    </style>

</head>

<body>

    <jsp:include page="components/sidebar.jsp" />

    <main class="watchlist-page">

        <div class="page-header">

            <h1>
                <i class="fa-solid fa-star text-primary"></i>
                My Watchlist
            </h1>

            <p>
                Keep track of stocks you are interested in and monitor their performance.
            </p>

        </div>


        <div class="watchlist-card">

            <h4 class="mb-4">
                Your Stocks
            </h4>


            <!-- Bajaj Finance -->

            <div class="stock-row">

                <div class="stock-info">

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

                </div>


                <div class="stock-price">
                    ₹9,350.00
                </div>


                <div class="positive">
                    ↑ 1.24%
                </div>


                <button class="btn-buy">
                    Buy
                </button>

            </div>


            <!-- Dr Reddy -->

            <div class="stock-row">

                <div class="stock-info">

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

                </div>


                <div class="stock-price">
                    ₹6,750.00
                </div>


                <div class="negative">
                    ↓ 0.82%
                </div>


                <button class="btn-buy">
                    Buy
                </button>

            </div>


            <!-- Reliance -->

            <div class="stock-row">

                <div class="stock-info">

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

                </div>


                <div class="stock-price">
                    ₹3,100.00
                </div>


                <div class="positive">
                    ↑ 0.65%
                </div>


                <button class="btn-buy">
                    Buy
                </button>

            </div>


            <!-- HDFC -->

            <div class="stock-row">

                <div class="stock-info">

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

                </div>


                <div class="stock-price">
                    ₹1,715.00
                </div>


                <div class="negative">
                    ↓ 0.31%
                </div>


                <button class="btn-buy">
                    Buy
                </button>

            </div>


            <!-- TCS -->

            <div class="stock-row">

                <div class="stock-info">

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

                </div>


                <div class="stock-price">
                    ₹3,550.00
                </div>


                <div class="positive">
                    ↑ 1.43%
                </div>


                <button class="btn-buy">
                    Buy
                </button>

            </div>

        </div>

    </main>

</body>
</html>