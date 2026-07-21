<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>TradeX | Virtual Stock Trading Platform</title>

<meta name="viewport"
content="width=device-width, initial-scale=1">

<!-- Bootstrap -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<!-- Font Awesome -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<!-- Custom CSS -->

<link rel="stylesheet"
href="css/auth.css">

</head>

<body>

<div class="container-fluid auth-container">

    <!-- Left Panel -->

    <div class="left-panel">

    <div class="logo">

        <i class="fa-solid fa-chart-line"></i>

        <h1>TradeX</h1>

    </div>

    <h2>Virtual Stock Trading Platform</h2>

    <p>

        Practice stock trading with real market data,
        build your portfolio,
        analyse companies,
        and become an expert investor
        without risking real money.

    </p>

    <div class="feature-box">

        <div class="feature">

            <i class="fa-solid fa-chart-column"></i>

            <span>Real Time Market Dashboard</span>

        </div>

        <div class="feature">

            <i class="fa-solid fa-wallet"></i>

            <span>Virtual Wallet</span>

        </div>

        <div class="feature">

            <i class="fa-solid fa-arrow-trend-up"></i>

            <span>Technical Analysis</span>

        </div>

        <div class="feature">

            <i class="fa-solid fa-chart-pie"></i>

            <span>Portfolio Management</span>

        </div>

    </div>

</div>

    <div class="right-panel">

<div class="login-card">

    <div class="tabs">

    <button
        type="button"
        id="loginTab"
        class="tab-btn active">

        Login

    </button>

    <button
        type="button"
        id="registerTab"
        class="tab-btn">

        Register

    </button>

</div>

    <!-- LOGIN FORM -->

    <div
    id="loginForm"
    class="form-section">

        <h2>Welcome Back</h2>

        <p>Login to your account</p>

		        <form action="LoginServlet" method="post">
		
		    <div class="form-group">
		        <label>Email</label>
		
		        <input
		            type="email"
		            name="email"
		            class="form-control"
		            placeholder="Enter Email"
		            required>
		    </div>
		
		    <div class="form-group">
		        <label>Password</label>
		
		        <input
		            type="password"
		            name="password"
		            class="form-control"
		            placeholder="Password"
		            required>
		    </div>
		
		    <button
		        type="submit"
		        class="btn btn-success auth-btn">
		
		        Login
		
		    </button>
		
		</form>
    </div>

    <!-- REGISTER FORM -->

    <div
    id="registerForm"
    class="form-section"
    style="display:none;">

        <h2>Create Account</h2>

        <p>Create your virtual trading account</p>

        <form action="RegisterServlet" method="post">

            <div class="form-group">

                <label>Full Name</label>

                <input
					type="text"
					name="fullName"
					class="form-control"
					required>

            </div>

            <div class="form-group">

                <label>Username</label>

					<input
					type="text"
					name="username"
					class="form-control"
					required>

            </div>

            <div class="form-group">

                <label>Email</label>

					<input
					type="email"
					name="email"
					class="form-control"
					required>
            </div>
			
			<div class="form-group">

			    <label>Phone Number</label>
			
			    <input
			    type="text"
			    name="phone"
			    class="form-control"
			    required>
			
			</div>

            <div class="form-group">

                <label>Password</label>

                <input
					type="password"
					name="password"
					class="form-control"
					required>

            </div>

            <button
             type="submit" class="btn btn-primary auth-btn">

                Register

            </button>

        </form>

    </div>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/auth.js"></script>

</body>

</html>