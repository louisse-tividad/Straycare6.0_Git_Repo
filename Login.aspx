<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StrayCare6._0.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Login</title>
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
            padding-top: 50px;
            box-sizing: border-box;
        }

        .login-box {
            width: 420px;
            text-align: center;
        }

        .title-btn {
            display: inline-block;
            border: 1px solid #8a8a8a;
            background-color: #f8f7f2;
            box-shadow: 0 2px 4px rgba(0,0,0,0.12);
            border-radius: 16px;
            padding: 10px 28px;
            font-weight: 700;
            font-size: 20px;
            color: #111;
            margin-bottom: 24px;
        }

        .input-box {
            width: 100%;
            margin-bottom: 14px;
        }

        .input-field {
            width: 100%;
            padding: 14px 16px;
            border-radius: 14px;
            border: 1px solid #9b9b9b;
            background-color: #f8f7f2;
            outline: none;
            font-size: 15px;
            box-sizing: border-box;
            box-shadow: 0 2px 4px rgba(0,0,0,0.08);
        }

        .input-field:focus {
            border-color: #7c7cff;
        }

        .small-link {
            text-align: left;
            margin: -2px 0 18px 8px;
        }

        .small-link a {
            font-size: 12px;
            font-style: italic;
            font-weight: 600;
            color: #111;
            text-decoration: none;
        }

        .submit-btn {
            min-width: 175px;
            padding: 12px 24px;
            border-radius: 14px;
            border: 1px solid #8f8f8f;
            background-color: #f8f7f2;
            font-size: 24px;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0,0,0,0.12);
            transition: 0.2s ease;
        }

        .submit-btn:hover {
            background-color: #D3D3FF;
        }

        .message-label {
            display: block;
            min-height: 22px;
            margin-bottom: 10px;
            color: red;
            font-size: 14px;
            font-weight: 600;
        }

        .bottom-link {
            margin-top: 18px;
            font-size: 14px;
        }

        .bottom-link a {
            color: #111;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link {
            margin-top: 12px;
        }

        .back-link a {
            color: #111;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="login-box">
                <div class="title-btn">LOG IN</div>

                <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

                <div class="input-box">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Please enter email*"></asp:TextBox>
                </div>

                <div class="input-box">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password*"></asp:TextBox>
                </div>

                <div class="small-link">
                    <a href="ForgotPassword.aspx">Forgot password?</a>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="LOG IN" CssClass="submit-btn" OnClick="btnLogin_Click" />

                <div class="bottom-link">
                    Don’t have an account? <a href="Signup.aspx">Sign Up</a>
                </div>

                <div class="back-link">
                    <a href="LandingPage.aspx">Back to Home</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>