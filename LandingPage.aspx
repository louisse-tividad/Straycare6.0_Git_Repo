<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="StrayCare6._0.LandingPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Landing Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
        }

        .main-wrapper {
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 60px;
            box-sizing: border-box;
        }

        .landing-box {
            width: 500px;
            text-align: center;
        }

        .title {
            font-size: 42px;
            font-weight: 800;
            margin-bottom: 15px;
            color: #222;
        }

        .subtitle {
            font-size: 17px;
            color: #444;
            margin-bottom: 35px;
            line-height: 1.6;
        }

        .btn {
            min-width: 190px;
            padding: 14px 24px;
            border-radius: 14px;
            border: 1px solid #8f8f8f;
            background-color: #D3D3FF;
            font-size: 22px;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0,0,0,0.12);
            margin: 8px;
        }

        .btn:hover {
            background-color: #c4c4ff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="landing-box">
                <div class="title">Welcome to StrayCare</div>

                <div class="subtitle">
                    StrayCare is a web-based system designed to support stray animals
                    through better care, reporting, and community coordination.
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="LOG IN" CssClass="btn" OnClick="btnLogin_Click" />
                <asp:Button ID="btnSignup" runat="server" Text="SIGN UP" CssClass="btn" OnClick="btnSignup_Click" />
            </div>
        </div>
    </form>
</body>
</html>