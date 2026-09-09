<aside class="sidebar">

    <!-- =========================
         LOGO
    ========================== -->

    <div class="logo">

        <i class="fa-solid fa-chart-line"></i>

        <h2>TradeX</h2>

    </div>


    <!-- =========================
         NAVIGATION
    ========================== -->

    <ul>


        <!-- DASHBOARD -->

        <li class="<%= "dashboard".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="DashboardServlet">

                <i class="fa-solid fa-house"></i>

                <span>Dashboard</span>

            </a>

        </li>


        <!-- PORTFOLIO -->

        <li class="<%= "portfolio".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="PortfolioServlet">

                <i class="fa-solid fa-wallet"></i>

                <span>Portfolio</span>

            </a>

        </li>


        <!-- MARKET -->

        <li class="<%= "market".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="MarketServlet">

                <i class="fa-solid fa-chart-column"></i>

                <span>Market</span>

            </a>

        </li>


        <!-- WATCHLIST -->

        <li class="<%= "watchlist".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="WatchlistServlet">

                <i class="fa-solid fa-star"></i>

                <span>Watchlist</span>

            </a>

        </li>


        <!-- BUY STOCKS -->

        <li class="<%= "buy".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="BuyServlet">

                <i class="fa-solid fa-arrow-trend-up"></i>

                <span>Buy Stocks</span>

            </a>

        </li>


        <!-- SELL STOCKS -->

        <li class="<%= "sell".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="SellServlet">

                <i class="fa-solid fa-arrow-trend-down"></i>

                <span>Sell Stocks</span>

            </a>

        </li>


        <!-- TRANSACTIONS -->

        <li class="<%= "transactions".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="TransactionServlet">

                <i class="fa-solid fa-clock-rotate-left"></i>

                <span>Transactions</span>

            </a>

        </li>


        <!-- ANALYTICS -->

        <li class="<%= "analytics".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="#">

                <i class="fa-solid fa-chart-pie"></i>

                <span>Analytics</span>

            </a>

        </li>


        <!-- PROFILE -->

        <li class="<%= "profile".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="#">

                <i class="fa-solid fa-user"></i>

                <span>Profile</span>

            </a>

        </li>


        <!-- SETTINGS -->

        <li class="<%= "settings".equals(request.getAttribute("activePage"))
                    ? "active"
                    : "" %>">

            <a href="#">

                <i class="fa-solid fa-gear"></i>

                <span>Settings</span>

            </a>

        </li>


        <!-- LOGOUT -->

        <li>

            <a href="LogoutServlet">

                <i class="fa-solid fa-right-from-bracket"></i>

                <span>Logout</span>

            </a>

        </li>


    </ul>

</aside>