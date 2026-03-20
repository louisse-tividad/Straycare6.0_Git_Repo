<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="StrayCare6._0.AdminUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Users</title>
    <style>
        body { font-family: Arial, 'Segoe UI', sans-serif; background:#FFFEF6; margin:0; }
        .container { max-width:1200px; margin:30px auto; background:white; padding:25px; border-radius:18px; }
        h1 { margin-top:0; }
        .back a { text-decoration:none; font-weight:bold; color:#222; }
        .grid { width:100%; border-collapse:collapse; margin-top:20px; }
        .grid th, .grid td { border:1px solid #ddd; padding:10px; text-align:left; }
        .grid th { background:#D3D3FF; }
    </style>
</head>
<body>
<form id="form2" runat="server">
    <div class="container">
        <div class="back"><a href="AdminDashboard.aspx">← Back to Admin Dashboard</a></div>
        <h1>Registered Users</h1>

        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="User ID" />
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                <asp:BoundField DataField="Birthday" HeaderText="Birthday" DataFormatString="{0:MMMM dd, yyyy}" />
                <asp:CheckBoxField DataField="IsAdmin" HeaderText="Admin" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:MMMM dd, yyyy hh:mm tt}" />
            </Columns>
        </asp:GridView>
    </div>
</form>
</body>
</html>
