<div align="center">

# 📈 TradeX — Advanced Stock Trading Platform

**A virtual stock trading simulator built with Java, JSP, Servlets, JDBC & MySQL**

*Inspired by Zerodha, Groww and Upstox — built as a full-stack engineering capstone project*

![Java](https://img.shields.io/badge/Java-17-orange)
![JSP](https://img.shields.io/badge/JSP-Servlets-blue)
![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1)
![Bootstrap](https://img.shields.io/badge/UI-Bootstrap%205-purple)
![Status](https://img.shields.io/badge/Status-In%20Development-yellow)

</div>

---

## ⚠️ Disclaimer

TradeX is a **simulation only**. No real money, real brokerage, or real market execution is involved anywhere in this project. All prices, trades, and wallet balances are virtual and exist purely for educational purposes.

---

## 📖 Overview

TradeX is a full-stack virtual stock trading platform that lets users register, manage a virtual wallet, search stocks, build a portfolio, track profit/loss, maintain a watchlist, and review transaction history — all backed by a normalized relational database rather than a flat, single-table CRUD design.

The project intentionally avoids frameworks like Spring in favor of core **Servlets + JDBC**, so that the underlying request lifecycle, session handling, and data access layer are all built and understood from first principles.

> **Current status:** Frontend UI is complete. Database schema is fully designed. The authentication module (registration/login/session handling) is the active work-in-progress backend milestone. See [Project Status](#-project-status) for a precise breakdown of what's implemented vs. planned.

---

## ✨ Features

| Module | Description | Status |
|---|---|---|
| Authentication | Register, login, logout, hashed passwords, session management | 🔧 In Progress |
| Dashboard | Wallet balance, portfolio value, today's P/L, top gainers/losers, recent transactions | 📝 Planned (UI done, static data) |
| Stocks | Search, filter, company details, historical price charts | 📝 Planned |
| Trading Engine | Buy / sell stocks with brokerage & tax calculation | 📝 Planned |
| Portfolio | Holdings, average buy price, current value, profit/loss | 📝 Planned |
| Wallet | Deposit, withdraw, full wallet transaction history | 📝 Planned |
| Watchlist | Add, remove, and view tracked stocks | 📝 Planned |
| Notifications | Buy/sell confirmations, wallet alerts, system messages | 📝 Planned |
| Admin Panel | Manage users, stocks, news, and market data | 📝 Planned |
| Analytics | Portfolio growth, asset allocation, sector distribution charts | 📝 Planned |

---

## 🛠️ Tech Stack

**Frontend**
- JSP, HTML5, CSS3, JavaScript
- Bootstrap 5

**Backend**
- Java 17
- Java Servlets (no Spring Framework — by design)
- JDBC

**Database**
- MySQL

**Tooling**
- Eclipse IDE (Dynamic Web Project)
- Apache Tomcat 10
- MySQL Workbench
- MySQL Connector/J

---

## 🏗️ Architecture

TradeX follows a layered **MVC + DAO** architecture. JSP pages never talk to the database directly — every request flows down through a controller, an optional service layer for business logic, and a DAO layer that owns all SQL:

```
JSP (View)
   ↓
Servlet (Controller)
   ↓
Service (Business Logic)
   ↓
DAO (Data Access)
   ↓
DBConnection (Utility)
   ↓
MySQL
```

**Design principles followed throughout:**
- Strict MVC separation — no business logic inside JSP pages
- DAO pattern — one DAO per table/entity
- `PreparedStatement` for all SQL — no string-concatenated queries
- Passwords are hashed, never stored in plain text
- Session-based authentication, validated on every protected page
- Incremental development — each module is tested before the next begins

---

## 📁 Project Structure

```
TradeX/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/tradex/
│       │       ├── controller/     # Servlets — handle HTTP requests
│       │       ├── service/        # Business logic layer
│       │       ├── dao/            # Database access (one DAO per table)
│       │       ├── model/          # JavaBeans mapped to DB tables
│       │       ├── utility/        # DBConnection, PasswordUtil, helpers
│       │       ├── filter/         # Session / auth filters
│       │       └── listener/       # Application & session listeners
│       │
│       └── webapp/
│           ├── assets/
│           │   ├── css/
│           │   ├── js/
│           │   └── images/
│           ├── components/
│           │   ├── navbar.jsp
│           │   ├── sidebar.jsp
│           │   └── footer.jsp
│           ├── login.jsp
│           ├── register.jsp
│           ├── dashboard.jsp
│           ├── portfolio.jsp
│           ├── watchlist.jsp
│           ├── market.jsp
│           ├── analytics.jsp
│           ├── profile.jsp
│           ├── settings.jsp
│           ├── transactions.jsp
│           └── WEB-INF/
│               └── web.xml
│
├── database/
│   ├── tradex_schema.sql       # CREATE TABLE statements, constraints, FKs
│   └── tradex_dummy_data.sql   # Sample/seed data
│
├── README.md
└── .gitignore
```

---

## 🗄️ Database Design

The schema is fully normalized across **16 tables**, connected through primary/foreign keys, `UNIQUE` and `CHECK` constraints, indexes, and `ON DELETE` / `ON UPDATE CASCADE` rules where appropriate.

| # | Table | Purpose |
|---|---|---|
| 1 | `users` | User accounts, wallet balance, profile, status |
| 2 | `admin` | Admin accounts and roles |
| 3 | `stocks` | Stock master data (price, sector, exchange, market cap, etc.) |
| 4 | `stock_categories` | Sector/industry categorization for stocks |
| 5 | `stock_price_history` | Historical price points, used for charts |
| 6 | `technical_indicators` | Moving average, RSI, MACD, EMA, trend, recommendation |
| 7 | `portfolio` | Per-user holdings — quantity, avg. buy price, current value, P/L |
| 8 | `transactions` | Buy/sell records — quantity, price, brokerage, tax, status |
| 9 | `wallet` | Current wallet balance per user |
| 10 | `wallet_transactions` | Full ledger of deposits, withdrawals, buys, sells, bonuses, refunds |
| 11 | `watchlist` | User-tracked stocks |
| 12 | `notifications` | In-app alerts (welcome, buy/sell confirmation, wallet updates) |
| 13 | `news` | Market news articles shown on the dashboard |
| 14 | `market_indices` | NIFTY, BANK NIFTY, SENSEX, NASDAQ values & % change |
| 15 | `user_activity_log` | Login/logout/buy/sell audit trail — IP, timestamp, browser |
| 16 | `feedback` | User ratings and comments |

> An ER diagram documenting all relationships (1:1, 1:N, M:N) will be added to `/database` as the schema is finalized.

**Key relationships:**
- `users (1) → (N) portfolio → (1) stocks`
- `users (1) → (N) transactions → (1) stocks`
- `users (1) → (N) wallet_transactions`
- `users (1) → (N) watchlist → (1) stocks`
- `stocks (1) → (N) stock_price_history`
- `stocks (1) → (1) technical_indicators`

---

## 🚦 Project Status

**✅ Completed**
- All frontend JSP pages designed (login, register, dashboard, portfolio, watchlist, market, analytics, profile, settings, transactions) with responsive Bootstrap UI, sidebar, navbar and footer components
- Complete `style.css` and `script.js`
- Eclipse Dynamic Web Project set up with full package structure (`controller`, `dao`, `model`, `service`, `utility`, `filter`, `listener`)
- MySQL database `tradex` created
- Full 16-table schema designed with keys, constraints, and relationships
- `DBConnection.java` implemented and verified
- `User.java` model class (constructors, getters, setters)
- Initial `UserDAO.java` with the registration method
- `TestConnection.java` utility for verifying JDBC connectivity

**🔧 In Progress — Authentication Module**
- [ ] `PasswordUtil.java` (SHA-256 hashing, with BCrypt planned as a future upgrade)
- [ ] `RegisterServlet.java`
- [ ] Wire `register.jsp` to the registration servlet
- [ ] `LoginServlet.java`
- [ ] `LogoutServlet.java`
- [ ] Session validation filter on all protected pages
- [ ] End-to-end test: Register → Login → Dashboard → Logout

**📝 Not Started**
- Dynamic dashboard data (wallet, portfolio, watchlist, transactions all currently hardcoded)
- Stocks module (search, details, charts)
- Trading engine (buy/sell logic)
- Wallet module
- Watchlist module
- Notifications
- Admin panel
- Analytics/charts

---

## 🗺️ Roadmap

- [x] **Phase 1** — Project setup, database schema, JDBC connectivity
- [ ] **Phase 2** — Authentication (register, login, logout, sessions) *(current)*
- [ ] **Phase 3** — Dashboard (dynamic data) & user profile
- [ ] **Phase 4** — Stocks module
- [ ] **Phase 5** — Portfolio module
- [ ] **Phase 6** — Wallet module
- [ ] **Phase 7** — Trading engine (buy/sell)
- [ ] **Phase 8** — Watchlist module
- [ ] **Phase 9** — Notifications & news
- [ ] **Phase 10** — Admin panel
- [ ] **Phase 11** — Analytics dashboard & final documentation

---

## ⚙️ Getting Started

### Prerequisites
- JDK 17
- Eclipse IDE (Enterprise / Java EE edition)
- Apache Tomcat 10
- MySQL Server + MySQL Workbench
- MySQL Connector/J (`mysql-connector-j.jar`)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/tradex.git
   ```

2. **Import into Eclipse**
   - `File → Import → Existing WAR / Dynamic Web Project`
   - Set the target runtime to Apache Tomcat 10

3. **Add the MySQL JDBC driver**
   - Right-click project → `Build Path → Configure Build Path`
   - `Add External JARs` → select `mysql-connector-j.jar` → Apply

4. **Create the database**
   ```bash
   mysql -u root -p < database/tradex_schema.sql
   mysql -u root -p < database/tradex_dummy_data.sql
   ```

5. **Configure database credentials**
   - Update the connection URL, username, and password in
     `src/main/java/com/tradex/utility/DBConnection.java`

6. **Run the project**
   - Right-click project → `Run As → Run on Server`
   - Open `http://localhost:8080/TradeX/` in your browser

---

## 📄 License

This project is intended for educational use. Add a license of your choice (e.g. MIT) before making the repository public.

---

## 👥 Author

**Sneha** — [GitHub](https://github.com/Sneha-RU) · [LinkedIn](https://www.linkedin.com/in/sneha-ru/)

*Built as a third-year engineering capstone project.*
