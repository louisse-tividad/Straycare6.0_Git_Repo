<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VolunteerApply.aspx.cs" Inherits="StrayCare6._0.VolunteerApply" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Volunteer Application</title>
    <style>
        body {
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 18px;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border-radius: 10px;
        }

        .btn {
            padding: 12px 20px;
            background-color: #D3D3FF;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
        }

        .message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="container">
        <h1>Volunteer Application</h1>

        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br /><br />

       <asp:Label ID="lblEventTitle" runat="server"></asp:Label>
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        
        <asp:TextBox ID="txtFullName" runat="server" CssClass="textbox" placeholder="Full Name"></asp:TextBox>
        <asp:TextBox ID="txtFullAddress" runat="server" CssClass="textbox" placeholder="Full Address"></asp:TextBox>
        
        <asp:Button ID="btnSubmit" runat="server" Text="Join Event" CssClass="btn" OnClick="btnSubmit_Click" />
    </div>
</form>
</body>
</html>

