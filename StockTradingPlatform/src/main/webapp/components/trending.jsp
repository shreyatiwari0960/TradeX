<%@ page import="java.util.*" %>
<%@ page import="com.tradex.model.Stock" %>

<%
List<Stock> stocks = (List<Stock>)request.getAttribute("stocks");
%>

<section class="trending-section">

    <div class="section-title">

        <h2>Trending Stocks</h2>

        <p>Today's Top Performing Stocks</p>

    </div>

    <table class="stock-table">

        <thead>

            <tr>

                <th>Company</th>
                <th>Symbol</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>

            </tr>

        </thead>

        <tbody>

        <%

        if(stocks != null){

            for(Stock stock : stocks){

        %>

            <tr>

                <td><%= stock.getCompanyName() %></td>

                <td><%= stock.getStockSymbol() %></td>

                <td>₹ <%= stock.getCurrentPrice() %></td>

                <td class="green">

                    Live

                </td>

                <td>
				
				    <form action="buyStock.jsp" method="get">
				
				        <input type="hidden"
				               name="stockId"
				               value="<%= stock.getStockId() %>">
				
				        <input type="hidden"
				               name="company"
				               value="<%= stock.getCompanyName() %>">
				
				        <input type="hidden"
				               name="symbol"
				               value="<%= stock.getStockSymbol() %>">
				
				        <input type="hidden"
				               name="price"
				               value="<%= stock.getCurrentPrice() %>">
				
				        <button type="submit"
				                class="buy-btn">
				
				            Buy
				
				        </button>
				
				    </form>
				
				</td>

            </tr>

        <%

            }

        }

        %>

        </tbody>

    </table>

</section>