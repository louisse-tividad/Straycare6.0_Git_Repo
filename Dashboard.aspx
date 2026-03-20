<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StrayCare6._0.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Dashboard</title>
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
            background-color: #FFFEF6;
        }

        .sidebar {
            width: 250px;
            background-color: #D3D3FF;
            padding: 25px 20px;
            box-sizing: border-box;
            border-radius: 0 18px 18px 0;
        }

        .logo-box {
            text-align: center;
            margin-bottom: 20px;
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
            margin-bottom: 10px;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 14px;
        }

        .header-left h1 {
            margin: 0;
            font-size: 54px;
            font-weight: 900;
            font-family: Georgia, serif;
        }

        .welcome-user {
            margin-top: 8px;
            font-size: 18px;
            font-weight: 700;
        }

        .header-right {
            font-size: 90px;
            line-height: 1;
        }

        .intro-box {
            background-color: #D3D3FF;
            padding: 14px 20px;
            border-radius: 12px;
            font-style: italic;
            color: #444;
            margin-bottom: 16px;
        }

        .success-box {
            background-color: #e7f8e7;
            border: 1px solid #7ac77a;
            color: #1d6b1d;
            padding: 14px 18px;
            border-radius: 12px;
            margin-bottom: 16px;
            font-weight: bold;
            display: block;
        }

        .dashboard-panel {
            background-color: #D3D3FF;
            border-radius: 18px;
            padding: 20px 24px 40px 24px;
            position: relative;
            overflow: hidden;
            min-height: 520px;
        }

        .dashboard-panel h2 {
            margin-top: 0;
            font-size: 36px;
            font-weight: 900;
            font-family: Georgia, serif;
        }

        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 28px 38px;
            position: relative;
            z-index: 2;
        }

        .feature-card {
            width: 220px;
            background-color: #fff;
            border-radius: 18px;
            box-shadow: 0 8px 14px rgba(0,0,0,0.18);
            overflow: hidden;
            text-align: center;
            text-decoration: none;
            color: #111;
            transition: transform 0.2s ease;
        }

        .feature-card:hover {
            transform: translateY(-4px);
        }

        .feature-card img {
            width: 100%;
            height: 145px;
            object-fit: cover;
            display: block;
        }

        .feature-card .card-text {
            padding: 14px 12px 18px 12px;
            font-size: 14px;
            font-weight: 800;
            min-height: 72px;
        }

        .paw-bg {
            position: absolute;
            font-size: 180px;
            color: rgba(120, 120, 160, 0.20);
            z-index: 1;
            user-select: none;
        }

        .paw1 {
            bottom: 10px;
            left: 230px;
        }

        .paw2 {
            bottom: -10px;
            right: 30px;
        }

        .divider {
            border-top: 1px solid rgba(255,255,255,0.8);
            margin: 16px 0;
        }

        @media screen and (max-width: 1100px) {
            .wrapper {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                border-radius: 0;
            }

            .header-section {
                flex-direction: column;
                align-items: flex-start;
            }

            .card-grid {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">

            <div class="sidebar">
                <div class="logo-box">
                    <div class="logo-circle">🐾</div>
                    <div class="brand-name">StrayCare</div>
                </div>

                <div class="divider"></div>

                <div class="menu-title">Navigation</div>
                <div class="menu">
                    <a href="Dashboard.aspx">📋 Dashboard</a>
                    <a href="ReportStray.aspx">🐾 Report Stray</a>
                    <a href="Adopt.aspx">🏠 Adopt</a>
                    <a href="Volunteer.aspx">🙋 Volunteer</a>
                    <a href="Donations.aspx">🎁 Donations</a>
                </div>

                <div class="divider"></div>

                <div class="menu-title">Others</div>
                <div class="menu">
                    <a href="ContactUs.aspx">✉️ Contact Us</a>
                    <asp:Button ID="btnLogout" runat="server" Text="⛔ Sign Out" CssClass="signout-btn" OnClick="btnLogout_Click" />
                </div>
            </div>

            <div class="main-content">
                <div class="top-strip"></div>

                <div class="header-section">
                    <div class="header-left">
                        <h1>Dashboard</h1>
                        <div class="welcome-user">
                            Welcome, <asp:Label ID="lblUsername" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="header-right">🐱🐶🐱🐶</div>
                </div>

                <asp:Label ID="lblSuccessMessage" runat="server" CssClass="success-box"></asp:Label>

                <div class="intro-box">
                    StrayCare is here to connect communities, volunteers, and shelters to give stray animals a better chance at life.
                </div>

                <div class="dashboard-panel">
                    <h2>Hi, Why Are You Here?</h2>

                    <div class="card-grid">
                        <a href="ReportStray.aspx" class="feature-card">
                            <img src="https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=600&q=80" alt="Report Stray" />
                            <div class="card-text">
                                Are you a concerned citizen who wants to report a stray dog or cat?
                            </div>
                        </a>

                        <a href="Adopt.aspx" class="feature-card">
                            <img src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=600&q=80" alt="Adopt" />
                            <div class="card-text">
                                Are you here to adopt a pet?
                            </div>
                        </a>

                        <a href="Volunteer.aspx" class="feature-card">
                            <img src="https://images.unsplash.com/photo-1559027615-cd4628902d4a?auto=format&fit=crop&w=600&q=80" alt="Volunteer" />
                            <div class="card-text">
                                Do you want to join as a volunteer in our events?
                            </div>
                        </a>

                        <a href="Donations.aspx" class="feature-card">
                            <img src="https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=600&q=80" alt="Donations" />
                            <div class="card-text">
                                Are you here to make a donation?
                            </div>
                        </a>
                    </div>

                    <div class="paw-bg paw1">🐾</div>
                    <div class="paw-bg paw2">🐾</div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>