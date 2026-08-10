<%@ page import="com.tradex.model.User"%>

<%
User user = (User) session.getAttribute("user");
%>

<section class="hero">

    <div class="hero-left">

       <h1>
		    Welcome Back,<br>
		    <span><%= user.getFullName() %></span> 
		</h1>
		
        <p>

            Manage your investments with confidence.
            Track live market trends,
            monitor your portfolio,
            and make smarter trading decisions every day.

        </p>

        <div class="hero-buttons">

            <button class="buy-btn">

                <i class="fa-solid fa-arrow-trend-up"></i>

                Buy Stocks

            </button>

            <button class="portfolio-btn">

                View Portfolio

            </button>

        </div>

    </div>

    <div class="hero-right">

        <div class="hero-circle">

            <i class="fa-solid fa-chart-line"></i>

        </div>

    </div>

</section>