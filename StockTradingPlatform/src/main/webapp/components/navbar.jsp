<%@ page import="com.tradex.model.User"%>

<%
User user = (User) session.getAttribute("user");
%>

<nav class="topbar">

    <div class="top-left">

        <div class="brand">

            <i class="fa-solid fa-chart-line"></i>

            <span>TradeX</span>

        </div>

    </div>

    <div class="search-box">

        <i class="fa-solid fa-magnifying-glass"></i>

        <input
        type="text"
        placeholder="Search Stocks, Companies...">

    </div>
		
		    <div class="user-info">
		
		    <div class="dropdown">
		
		        <a href="#"
		           class="profile-dropdown"
		           data-bs-toggle="dropdown"
		           aria-expanded="false">
		
		            <i class="fa-solid fa-circle-user profile-icon"></i>
		
		            <span class="user-name">
		                Hi, <%= user.getFullName() %>
		            </span>
		
		            <i class="fa-solid fa-chevron-down"></i>
		
		        </a>
		
		        <ul class="dropdown-menu dropdown-menu-end">
		
		            <li>
		                <a class="dropdown-item" href="#">
		                    <i class="fa-solid fa-user"></i>
		                    My Profile
		                </a>
		            </li>
		
		            <li>
		                <a class="dropdown-item" href="#">
		                    <i class="fa-solid fa-gear"></i>
		                    Settings
		                </a>
		            </li>
		
		            <li><hr class="dropdown-divider"></li>
		
		            <li>
		                <a class="dropdown-item text-danger" href="LogoutServlet">
		                    <i class="fa-solid fa-right-from-bracket"></i>
		                    Logout
		                </a>
		            </li>
		
		        </ul>
		
		    </div>
		
		</div>
     

    

</nav>