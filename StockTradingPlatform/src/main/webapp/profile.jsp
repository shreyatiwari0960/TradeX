<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tradex.model.User"%>
<%@ page import="java.lang.reflect.Method"%>

<%
    /*
     * ============================
     * AUTHENTICATION
     * ============================
     */

    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }


    /*
     * ============================
     * SAFELY GET USER DETAILS
     * ============================
     *
     * This avoids the old getName()
     * compilation error.
     */

    String userName = "Trader";
    String userEmail = "Not Available";

    try {

        Method usernameMethod = null;

        try {
            usernameMethod = user.getClass()
                    .getMethod("getUsername");
        } catch (Exception e) {

            try {
                usernameMethod = user.getClass()
                        .getMethod("getName");
            } catch (Exception ignored) {
            }
        }

        if (usernameMethod != null) {

            Object value =
                    usernameMethod.invoke(user);

            if (value != null &&
                !value.toString().trim().isEmpty()) {

                userName = value.toString();
            }
        }

    } catch (Exception e) {
        userName = "Trader";
    }


    try {

        Method emailMethod =
                user.getClass().getMethod("getEmail");

        Object value =
                emailMethod.invoke(user);

        if (value != null &&
            !value.toString().trim().isEmpty()) {

            userEmail = value.toString();
        }

    } catch (Exception e) {
        userEmail = "Not Available";
    }


    /*
     * ============================
     * SESSION PROFILE DATA
     * ============================
     */

    String savedName =
            (String) session.getAttribute("profileDisplayName");

    if (savedName != null &&
        !savedName.trim().isEmpty()) {

        userName = savedName;
    }

    String profilePicture =
            (String) session.getAttribute("profilePicture");

    String profileMessage =
            (String) session.getAttribute("profileMessage");

    if (profileMessage != null) {
        session.removeAttribute("profileMessage");
    }


    /*
     * FIRST LETTER AVATAR
     */

    String firstLetter = "T";

    if (userName != null &&
        !userName.trim().isEmpty()) {

        firstLetter =
                userName.trim()
                       .substring(0, 1)
                       .toUpperCase();
    }

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile | TradeX</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">


<!-- Bootstrap -->

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<!-- Font Awesome -->

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


<!-- TradeX CSS -->

<link
rel="stylesheet"
href="css/style.css">


<style>

/* =========================================================
   PROFILE PAGE
========================================================= */

.profile-page {

    padding: 42px;

    background: #f4f7fc;

    min-height: calc(100vh - 80px);

}


/* =========================================================
   HEADER
========================================================= */

.profile-header {

    display: flex;

    align-items: center;

    justify-content: space-between;

    margin-bottom: 32px;

}

.profile-title {

    display: flex;

    align-items: center;

    gap: 20px;

}

.profile-title-icon {

    width: 64px;

    height: 64px;

    border-radius: 18px;

    background: #eaf1ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 27px;

}

.profile-title h1 {

    margin: 0;

    font-size: 42px;

    font-weight: 800;

    color: #111b35;

}

.profile-title p {

    margin: 7px 0 0;

    color: #6980a4;

    font-size: 17px;

}

.profile-dashboard-btn {

    background: #2864e8;

    color: white;

    text-decoration: none;

    padding: 17px 26px;

    border-radius: 15px;

    font-weight: 700;

    display: flex;

    align-items: center;

    gap: 10px;

    box-shadow: 0 10px 25px rgba(40,100,232,0.18);

    transition: 0.2s ease;

}

.profile-dashboard-btn:hover {

    color: white;

    transform: translateY(-2px);

}


/* =========================================================
   MAIN GRID
========================================================= */

.profile-grid {

    display: grid;

    grid-template-columns: 0.85fr 1.6fr;

    gap: 24px;

    margin-bottom: 24px;

}

.profile-card {

    background: white;

    border-radius: 22px;

    padding: 30px;

    box-shadow: 0 10px 30px rgba(24,43,75,0.07);

}


/* =========================================================
   PROFILE MAIN CARD
========================================================= */

.profile-main-card {

    text-align: center;

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;

    min-height: 430px;

}

.profile-avatar-wrapper {

    position: relative;

    margin-bottom: 20px;

}

.profile-avatar {

    width: 115px;

    height: 115px;

    border-radius: 50%;

    background: #2864e8;

    color: white;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 43px;

    font-weight: 800;

    overflow: hidden;

    box-shadow: 0 12px 28px rgba(40,100,232,0.22);

}

.profile-avatar img {

    width: 100%;

    height: 100%;

    object-fit: cover;

}

.profile-camera {

    position: absolute;

    right: 0;

    bottom: 2px;

    width: 38px;

    height: 38px;

    border-radius: 50%;

    background: #2864e8;

    color: white;

    border: 4px solid white;

    display: flex;

    align-items: center;

    justify-content: center;

}

.profile-main-card h2 {

    margin: 0;

    color: #111b35;

    font-size: 28px;

    font-weight: 800;

}

.profile-role {

    margin: 6px 0 14px;

    color: #7285a4;

    font-size: 16px;

}

.profile-status {

    display: inline-flex;

    align-items: center;

    gap: 8px;

    background: #eafaf1;

    color: #0c9d4f;

    padding: 8px 14px;

    border-radius: 30px;

    font-size: 14px;

    font-weight: 700;

}

.status-dot {

    width: 8px;

    height: 8px;

    background: #14b866;

    border-radius: 50%;

}

.profile-divider {

    width: 80%;

    height: 1px;

    background: #e7edf5;

    margin: 28px 0 20px;

}


/* =========================================================
   PHOTO UPLOAD
========================================================= */

.profile-upload {

    width: 100%;

    text-align: left;

}

.profile-upload label {

    font-size: 14px;

    font-weight: 800;

    color: #17223c;

    display: block;

    margin-bottom: 7px;

}

.profile-upload input[type="file"] {

    width: 100%;

    padding: 10px;

    border: 1px solid #dfe6f0;

    border-radius: 11px;

    background: #f7f9fd;

    font-size: 12px;

}

.profile-upload small {

    display: block;

    margin-top: 7px;

    color: #7b8da9;

}


/* =========================================================
   EDIT PROFILE
========================================================= */

.edit-profile-card {

    background: white;

    border-radius: 22px;

    padding: 30px;

    box-shadow: 0 10px 30px rgba(24,43,75,0.07);

}

.profile-card-heading {

    display: flex;

    align-items: center;

    gap: 15px;

    margin-bottom: 25px;

}

.profile-heading-icon {

    width: 52px;

    height: 52px;

    border-radius: 14px;

    background: #edf3ff;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 22px;

}

.profile-card-heading h2 {

    margin: 0;

    color: #17223c;

    font-size: 23px;

    font-weight: 800;

}

.profile-card-heading p {

    margin: 4px 0 0;

    color: #7b8da9;

    font-size: 14px;

}

.edit-form {

    display: grid;

    gap: 18px;

}

.form-group {

    display: flex;

    flex-direction: column;

    gap: 7px;

}

.form-group label {

    color: #17223c;

    font-size: 13px;

    font-weight: 700;

}

.form-group input {

    width: 100%;

    padding: 13px 15px;

    border: 1px solid #dfe6f0;

    border-radius: 12px;

    font-size: 14px;

    color: #17223c;

    outline: none;

    background: white;

}

.form-group input:focus {

    border-color: #2864e8;

    box-shadow: 0 0 0 3px rgba(40,100,232,0.08);

}

.form-group input:disabled {

    background: #f3f6fa;

    color: #8291a9;

}

.form-help {

    color: #8998ad;

    font-size: 12px;

}

.edit-buttons {

    display: flex;

    gap: 12px;

    margin-top: 5px;

}

.save-profile-btn {

    border: none;

    background: #2864e8;

    color: white;

    padding: 13px 22px;

    border-radius: 11px;

    font-weight: 700;

    cursor: pointer;

}

.cancel-profile-btn {

    border: 1px solid #dfe6f0;

    background: white;

    color: #63738d;

    padding: 13px 22px;

    border-radius: 11px;

    font-weight: 700;

    text-decoration: none;

}

.cancel-profile-btn:hover {

    color: #2864e8;

}


/* =========================================================
   ACCOUNT INFORMATION
========================================================= */

.profile-info-list {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 18px;

}

.profile-info-item {

    display: flex;

    align-items: center;

    gap: 13px;

    padding: 17px;

    background: #f7f9fd;

    border-radius: 14px;

}

.profile-info-icon {

    width: 42px;

    height: 42px;

    border-radius: 11px;

    background: white;

    color: #2864e8;

    display: flex;

    align-items: center;

    justify-content: center;

    flex-shrink: 0;

}

.profile-info-item span {

    display: block;

    color: #7b8da9;

    font-size: 12px;

    margin-bottom: 4px;

}

.profile-info-item strong {

    display: block;

    color: #17223c;

    font-size: 14px;

    word-break: break-word;

}

.active-text {

    color: #0da653 !important;

}


/* =========================================================
   BOTTOM CARDS
========================================================= */

.profile-bottom-grid {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 24px;

    margin-bottom: 24px;

}

.profile-small-card {

    background: white;

    border-radius: 20px;

    padding: 24px;

    box-shadow: 0 10px 30px rgba(24,43,75,0.06);

}

.small-card-header {

    display: flex;

    align-items: center;

    gap: 16px;

    margin-bottom: 18px;

}

.profile-small-icon {

    min-width: 52px;

    width: 52px;

    height: 52px;

    border-radius: 14px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 21px;

}

.security-icon {

    background: #eafaf1;

    color: #10a957;

}

.trading-icon {

    background: #edf3ff;

    color: #2864e8;

}

.profile-small-card h3 {

    margin: 0 0 5px;

    color: #17223c;

    font-size: 17px;

    font-weight: 800;

}

.profile-small-card p {

    margin: 0;

    color: #7b8da9;

    font-size: 13px;

    line-height: 1.5;

}

.secure-badge {

    margin-left: auto;

    background: #eafaf1;

    color: #0c9d4f;

    padding: 7px 12px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: 700;

}

.constraint-list {

    display: grid;

    gap: 13px;

}

.constraint-item {

    display: flex;

    align-items: flex-start;

    gap: 11px;

}

.constraint-item i {

    color: #2864e8;

    margin-top: 3px;

}

.constraint-item strong {

    display: block;

    color: #17223c;

    font-size: 13px;

}

.constraint-item span {

    display: block;

    color: #7b8da9;

    font-size: 12px;

    margin-top: 2px;

}


/* =========================================================
   QUICK ACTIONS
========================================================= */

.profile-actions-card {

    background: white;

    border-radius: 22px;

    padding: 28px;

    box-shadow: 0 10px 30px rgba(24,43,75,0.06);

    margin-bottom: 24px;

}

.profile-actions-card h2 {

    margin: 0;

    color: #17223c;

    font-size: 22px;

    font-weight: 800;

}

.profile-actions-card > p {

    margin: 5px 0 22px;

    color: #7b8da9;

    font-size: 14px;

}

.profile-actions {

    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 14px;

}

.quick-action {

    padding: 18px;

    border: 1px solid #e5ebf4;

    border-radius: 14px;

    text-decoration: none;

    color: #17223c;

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 9px;

    font-size: 14px;

    font-weight: 700;

    transition: 0.2s ease;

}

.quick-action i {

    color: #2864e8;

}

.quick-action:hover {

    background: #f4f7ff;

    border-color: #2864e8;

    color: #2864e8;

}

.logout-action i {

    color: #e5484d;

}

.logout-action:hover {

    border-color: #e5484d;

    color: #e5484d;

}


/* =========================================================
   SUCCESS MESSAGE
========================================================= */

.profile-success {

    background: #eafaf1;

    color: #0c9d4f;

    border: 1px solid #c9efd9;

    border-radius: 12px;

    padding: 13px 16px;

    margin-bottom: 22px;

    font-size: 14px;

    font-weight: 700;

}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 1200px) {

    .profile-grid {

        grid-template-columns: 1fr;

    }

}

@media (max-width: 1000px) {

    .profile-page {

        padding: 28px;

    }

    .profile-bottom-grid {

        grid-template-columns: 1fr;

    }

    .profile-actions {

        grid-template-columns: 1fr 1fr;

    }

}

@media (max-width: 700px) {

    .profile-header {

        align-items: flex-start;

        gap: 20px;

        flex-direction: column;

    }

    .profile-title h1 {

        font-size: 32px;

    }

    .profile-info-list {

        grid-template-columns: 1fr;

    }

    .profile-actions {

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


        <main class="profile-page">


            <!-- =========================
                 HEADER
            ========================== -->

            <div class="profile-header">

                <div class="profile-title">

                    <div class="profile-title-icon">

                        <i class="fa-solid fa-user"></i>

                    </div>

                    <div>

                        <h1>My Profile</h1>

                        <p>
                            Manage your account information
                            and TradeX profile.
                        </p>

                    </div>

                </div>


                <a
                    href="MarketServlet"
                    class="profile-dashboard-btn">

                    <i class="fa-solid fa-house"></i>

                    Dashboard

                </a>

            </div>


            <!-- SUCCESS MESSAGE -->

            <% if (profileMessage != null) { %>

                <div class="profile-success">

                    <i class="fa-solid fa-circle-check"></i>

                    <%= profileMessage %>

                </div>

            <% } %>


            <!-- =========================
                 PROFILE GRID
            ========================== -->

            <div class="profile-grid">


                <!-- =========================
                     PROFILE CARD
                ========================== -->

                <div class="profile-card profile-main-card">


                    <div class="profile-avatar-wrapper">

                        <div class="profile-avatar">

                            <% if (profilePicture != null) { %>

                                <img
                                    src="<%= profilePicture %>"
                                    alt="Profile Picture">

                            <% } else { %>

                                <%= firstLetter %>

                            <% } %>

                        </div>


                        <div class="profile-camera">

                            <i class="fa-solid fa-camera"></i>

                        </div>

                    </div>


                    <h2>
                        <%= userName %>
                    </h2>


                    <p class="profile-role">

                        TradeX Trader

                    </p>


                    <div class="profile-status">

                        <span class="status-dot"></span>

                        Account Active

                    </div>


                    <div class="profile-divider"></div>


                    <!-- PHOTO UPLOAD -->

                    <div class="profile-upload">

                        <label>

                            <i class="fa-solid fa-camera"></i>

                            Change Profile Picture

                        </label>

                        <input
                            form="profileForm"
                            type="file"
                            name="profilePicture"
                            accept="image/png,image/jpeg,image/gif">

                        <small>

                            JPG, PNG or GIF · Maximum 2 MB

                        </small>

                    </div>

                </div>


                <!-- =========================
                     EDIT PROFILE
                ========================== -->

                <div class="edit-profile-card">


                    <div class="profile-card-heading">

                        <div class="profile-heading-icon">

                            <i class="fa-solid fa-pen-to-square"></i>

                        </div>

                        <div>

                            <h2>Edit Profile</h2>

                            <p>
                                Update your personal information.
                            </p>

                        </div>

                    </div>


                    <form
                        id="profileForm"
                        class="edit-form"
                        action="ProfileServlet"
                        method="post"
                        enctype="multipart/form-data">


                        <div class="form-group">

                            <label>

                                Full Name

                            </label>

                            <input
                                type="text"
                                name="displayName"
                                value="<%= userName %>"
                                required
                                maxlength="50">

                        </div>


                        <div class="form-group">

                            <label>

                                Email Address

                            </label>

                            <input
                                type="email"
                                value="<%= userEmail %>"
                                disabled>

                            <span class="form-help">

                                Email address cannot be changed.

                            </span>

                        </div>


                        <div class="form-group">

                            <label>

                                Account Type

                            </label>

                            <input
                                type="text"
                                value="Virtual Trading Account"
                                disabled>

                        </div>


                        <div class="edit-buttons">

                            <button
                                type="submit"
                                class="save-profile-btn">

                                <i class="fa-solid fa-floppy-disk"></i>

                                Save Changes

                            </button>


                            <a
                                href="ProfileServlet"
                                class="cancel-profile-btn">

                                Cancel

                            </a>

                        </div>

                    </form>

                </div>


                <!-- =========================
                     ACCOUNT INFORMATION
                ========================== -->

                <div class="profile-card">


                    <div class="profile-card-heading">

                        <div class="profile-heading-icon">

                            <i class="fa-solid fa-id-card"></i>

                        </div>

                        <div>

                            <h2>Account Information</h2>

                            <p>
                                Your registered account details.
                            </p>

                        </div>

                    </div>


                    <div class="profile-info-list">


                        <div class="profile-info-item">

                            <div class="profile-info-icon">

                                <i class="fa-solid fa-user"></i>

                            </div>

                            <div>

                                <span>Full Name</span>

                                <strong>
                                    <%= userName %>
                                </strong>

                            </div>

                        </div>


                        <div class="profile-info-item">

                            <div class="profile-info-icon">

                                <i class="fa-solid fa-envelope"></i>

                            </div>

                            <div>

                                <span>Email Address</span>

                                <strong>
                                    <%= userEmail %>
                                </strong>

                            </div>

                        </div>


                        <div class="profile-info-item">

                            <div class="profile-info-icon">

                                <i class="fa-solid fa-users"></i>

                            </div>

                            <div>

                                <span>Account Type</span>

                                <strong>
                                    Virtual Trading Account
                                </strong>

                            </div>

                        </div>


                        <div class="profile-info-item">

                            <div class="profile-info-icon">

                                <i class="fa-solid fa-circle-check"></i>

                            </div>

                            <div>

                                <span>Account Status</span>

                                <strong class="active-text">
                                    Active
                                </strong>

                            </div>

                        </div>


                    </div>

                </div>


            </div>


            <!-- =========================
                 SECURITY + CONSTRAINTS
            ========================== -->

            <div class="profile-bottom-grid">


                <!-- SECURITY -->

                <div class="profile-small-card">


                    <div class="small-card-header">

                        <div class="profile-small-icon security-icon">

                            <i class="fa-solid fa-lock"></i>

                        </div>

                        <div>

                            <h3>Account Security</h3>

                            <p>
                                Your account is protected
                                with secure authentication.
                            </p>

                        </div>

                        <span class="secure-badge">

                            Secure

                        </span>

                    </div>


                    <div class="constraint-list">

                        <div class="constraint-item">

                            <i class="fa-solid fa-circle-check"></i>

                            <div>

                                <strong>Password Protection</strong>

                                <span>
                                    Your password is protected.
                                </span>

                            </div>

                        </div>


                        <div class="constraint-item">

                            <i class="fa-solid fa-circle-check"></i>

                            <div>

                                <strong>Session Authentication</strong>

                                <span>
                                    Login session is verified.
                                </span>

                            </div>

                        </div>


                        <div class="constraint-item">

                            <i class="fa-solid fa-shield-halved"></i>

                            <div>

                                <strong>Secure Trading</strong>

                                <span>
                                    Trading actions require authentication.
                                </span>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- TRADING CONSTRAINTS -->

                <div class="profile-small-card">


                    <div class="small-card-header">

                        <div class="profile-small-icon trading-icon">

                            <i class="fa-solid fa-shield-halved"></i>

                        </div>

                        <div>

                            <h3>Trading Account Constraints</h3>

                            <p>
                                Important limits and rules
                                for your account.
                            </p>

                        </div>

                    </div>


                    <div class="constraint-list">


                        <div class="constraint-item">

                            <i class="fa-solid fa-laptop"></i>

                            <div>

                                <strong>Virtual Trading Only</strong>

                                <span>
                                    No real money is involved.
                                </span>

                            </div>

                        </div>


                        <div class="constraint-item">

                            <i class="fa-solid fa-wallet"></i>

                            <div>

                                <strong>Virtual Balance</strong>

                                <span>
                                    Practice using your virtual wallet.
                                </span>

                            </div>

                        </div>


                        <div class="constraint-item">

                            <i class="fa-solid fa-clock"></i>

                            <div>

                                <strong>Market Hours</strong>

                                <span>
                                    Orders are simulated during market hours.
                                </span>

                            </div>

                        </div>


                    </div>

                </div>


            </div>


            <!-- =========================
                 QUICK ACTIONS
            ========================== -->

            <div class="profile-actions-card">


                <h2>

                    Quick Actions

                </h2>


                <p>

                    Manage your account and trading activity.

                </p>


                <div class="profile-actions">


                    <a
                        href="PortfolioServlet"
                        class="quick-action">

                        <i class="fa-solid fa-wallet"></i>

                        View Portfolio

                    </a>


                    <a
                        href="TransactionServlet"
                        class="quick-action">

                        <i class="fa-solid fa-clock-rotate-left"></i>

                        Transactions

                    </a>


                    <a
                        href="MarketServlet"
                        class="quick-action">

                        <i class="fa-solid fa-chart-column"></i>

                        Explore Market

                    </a>


                    <a
                        href="LogoutServlet"
                        class="quick-action logout-action">

                        <i class="fa-solid fa-right-from-bracket"></i>

                        Logout

                    </a>


                </div>

            </div>


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