<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="StrayCare6._0.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
        }

        .wrapper {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 260px;
            background-color: #D3D3FF;
            padding: 25px 20px;
            box-sizing: border-box;
            border-radius: 0 18px 18px 0;
        }

        .logo-box {
            text-align: center;
            margin-bottom: 18px;
        }

        .logo-circle {
            width: 110px;
            height: 110px;
            border: 5px solid #000;
            border-radius: 50%;
            margin: 0 auto 12px auto;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            font-size: 42px;
        }

        .brand-name {
            font-size: 18px;
            font-weight: 800;
        }

        .admin-tag {
            margin-top: 6px;
            font-size: 14px;
            font-weight: 700;
            color: #333;
        }

        .menu-title {
            margin-top: 22px;
            font-size: 18px;
            font-weight: 800;
            text-decoration: underline;
        }

        .menu {
            margin-top: 10px;
        }

        .menu a {
            display: block;
            text-decoration: none;
            color: #222;
            padding: 7px 0;
            font-size: 16px;
        }

        .menu a:hover {
            font-weight: bold;
        }

        .signout-btn {
            background: none;
            border: none;
            padding: 7px 0;
            font-size: 16px;
            cursor: pointer;
            color: #222;
            text-align: left;
            width: 100%;
        }

        .signout-btn:hover {
            font-weight: bold;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }

        .top-strip {
            height: 18px;
            background-color: #D3D3FF;
            border-radius: 0 0 12px 12px;
            margin-bottom: 14px;
        }

        .header-section h1 {
            margin: 0;
            font-size: 48px;
            font-weight: 900;
            font-family: Georgia, serif;
        }

        .welcome-user {
            margin-top: 8px;
            font-size: 18px;
            font-weight: 700;
        }

        .intro-box {
            background-color: #D3D3FF;
            padding: 14px 20px;
            border-radius: 12px;
            color: #444;
            margin: 18px 0;
        }

        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 22px;
        }

        .card {
            width: 250px;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 6px 14px rgba(0,0,0,0.10);
            padding: 22px;
        }

        .card h3 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 22px;
        }

        .card p {
            color: #555;
            line-height: 1.5;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 16px;
            border-radius: 10px;
            background-color: #D3D3FF;
            color: #222;
            text-decoration: none;
            font-weight: 700;
        }

        .card a:hover {
            background-color: #c2c2ff;
        }

        @media screen and (max-width: 1000px) {
            .wrapper {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                border-radius: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="wrapper">

            <div class="sidebar">
                <div class="logo-box">
                    <div class="logo-circle">🛠</div>
                    <div class="brand-name">StrayCare</div>
                    <div class="admin-tag">Admin Panel</div>
                </div>

                <div class="menu-title">Management</div>
                <div class="menu">
                    <a href="AdminDashboard.aspx">📊 Dashboard</a>
                    <a href="AdminUsers.aspx">👤 Users</a>
                    <a href="AdminReports.aspx">🐾 Reports</a>
                    <a href="AdminAdoptions.aspx">🏠 Adoptions</a>
                    <a href="AdminVolunteers.aspx">🙋 Volunteers</a>
                    <a href="AdminDonations.aspx">🎁 Donations</a>
                </div>

                <div class="menu-title">Others</div>
                <div class="menu">
                    <asp:Button ID="btnLogout" runat="server" Text="⛔ Sign Out" CssClass="signout-btn" OnClick="btnLogout_Click" />
                </div>
            </div>

            <div class="main-content">
                <div class="top-strip"></div>

                <div class="header-section">
                    <h1>Admin Dashboard</h1>
                    <div class="welcome-user">
                        Welcome, <asp:Label ID="lblUsername" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="intro-box">
                    This admin dashboard is the frontend side for managing the system database. You can review users, stray reports, adoption applications, volunteer events, and donations here.
                </div>

                <div class="card-grid">
                    <div class="card">
                        <h3>Users</h3>
                        <p>View registered user accounts and monitor account roles.</p>
                        <a href="AdminUsers.aspx">Open</a>
                    </div>

                    <div class="card">
                        <h3>Reports</h3>
                        <p>Review stray animal reports and approve or disapprove requests.</p>
                        <a href="AdminReports.aspx">Open</a>
                    </div>

                    <div class="card">
                        <h3>Adoptions</h3>
                        <p>Manage pet adoption listings and user applications.</p>
                        <a href="AdminAdoptions.aspx">Open</a>
                    </div>

                    <div class="card">
                        <h3>Volunteer Events</h3>
                        <p>Create and manage volunteer events and participant limits.</p>
                        <a href="AdminVolunteers.aspx">Open</a>
                    </div>

                    <div class="card">
                        <h3>Donations</h3>
                        <p>Review cash and in-kind donations submitted by users.</p>
                        <a href="AdminDonations.aspx">Open</a>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>