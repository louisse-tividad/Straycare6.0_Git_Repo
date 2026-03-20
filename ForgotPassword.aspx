<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="StrayCare6._0.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Forgot Password</title>
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

        .forgot-box {
            width: 450px;
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
            margin-bottom: 20px;
        }

        .description {
            font-size: 15px;
            color: #444;
            margin-bottom: 20px;
            line-height: 1.6;
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

        .submit-btn {
            min-width: 220px;
            padding: 12px 24px;
            border-radius: 14px;
            border: 1px solid #8f8f8f;
            background-color: #f8f7f2;
            font-size: 22px;
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
            margin-bottom: 12px;
            color: red;
            font-size: 14px;
            font-weight: 600;
        }

        .success-label {
            color: green;
        }

        .back-link {
            margin-top: 18px;
            font-size: 14px;
        }

        .back-link a {
            color: #111;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="main-wrapper">
            <div class="forgot-box">
                <div class="title-btn">FORGOT PASSWORD</div>

                <div class="description">
                    Forgot your password? Enter your email below and we’ll give instructions
                    for setting a new one.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

                <div class="input-box">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                        CssClass="input-field" placeholder="Enter email*"></asp:TextBox>
                </div>

                <asp:Button ID="btnSend" runat="server" Text="SEND INSTRUCTIONS"
                    CssClass="submit-btn" OnClick="btnSend_Click" />

                <div class="back-link">
                    <a href="Login.aspx">Back to Login</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>