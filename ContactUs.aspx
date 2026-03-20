<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="StrayCare6._0.ContactUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Contact Us</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
            color: #222;
        }

        .page-wrapper {
            max-width: 1100px;
            margin: 35px auto;
            padding: 0 20px;
            box-sizing: border-box;
        }

        .top-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .page-title {
            font-size: 40px;
            font-weight: 800;
        }

        .back-link a {
            text-decoration: none;
            color: #222;
            font-weight: 700;
        }

        .main-card {
            background-color: #D3D3FF;
            border-radius: 22px;
            padding: 28px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .intro-box {
            background-color: #fffef6;
            border-radius: 16px;
            padding: 18px 20px;
            margin-bottom: 24px;
            line-height: 1.6;
            color: #444;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
        }

        .info-card,
        .form-card {
            background-color: #fffef6;
            border-radius: 18px;
            padding: 22px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.06);
        }

        .section-title {
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 16px;
        }

        .info-line {
            margin-bottom: 14px;
            line-height: 1.5;
            font-size: 16px;
        }

        .info-line b {
            display: inline-block;
            min-width: 90px;
        }

        .message-label {
            display: block;
            min-height: 24px;
            margin-bottom: 12px;
            color: green;
            font-weight: 700;
        }

        .textbox, .textarea-box {
            width: 100%;
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 14px;
            background-color: #fff;
            margin-bottom: 12px;
        }

        .textarea-box {
            min-height: 130px;
            resize: vertical;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 12px;
            border: 1px solid #8f8f8f;
            background-color: #D3D3FF;
            font-weight: 800;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #c2c2ff;
        }

        @media screen and (max-width: 900px) {
            .content-grid {
                grid-template-columns: 1fr;
            }

            .top-row {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="page-wrapper">

            <div class="top-row">
                <div class="page-title">Contact Us</div>
                <div class="back-link">
                    <a href="Dashboard.aspx">← Back to Dashboard</a>
                </div>
            </div>

            <div class="main-card">
                <div class="intro-box">
                    We'd love to hear from you. If you have questions, concerns, or want to reach out to the shelter, you may use the contact details below or send us a message through this page.
                </div>

                <div class="content-grid">
                    <div class="info-card">
                        <div class="section-title">Shelter Contact Information</div>

                        <div class="info-line">
                            <b>Shelter:</b> Second Chance Aspin Shelter Philippines Inc. (SECASPI)
                        </div>

                        <div class="info-line">
                            <b>Phone:</b> 09953636950
                        </div>

                        <div class="info-line">
                            <b>Email:</b> secaspi@example.com
                        </div>

                        <div class="info-line">
                            <b>Location:</b> Calamba City, Laguna
                        </div>

                        <div class="info-line">
                            <b>Hours:</b> Monday to Sunday, 8:00 AM - 6:00 PM
                        </div>
                    </div>

                    <div class="form-card">
                        <div class="section-title">Send Us a Message</div>

                        <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" placeholder="Your Name"></asp:TextBox>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="textbox" placeholder="Subject"></asp:TextBox>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="textarea-box" placeholder="Type your message here"></asp:TextBox>

                        <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn" OnClick="btnSend_Click" />
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>