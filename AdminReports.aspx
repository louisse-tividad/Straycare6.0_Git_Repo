<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="StrayCare6._0.AdminReports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Reports</title>
    <style>
        body { font-family: Arial, 'Segoe UI', sans-serif; background:#FFFEF6; margin:0; }
        .container { max-width:1300px; margin:30px auto; background:white; padding:25px; border-radius:18px; }
        h1 { margin-top:0; }
        .back a { text-decoration:none; font-weight:bold; color:#222; }
        .grid { width:100%; border-collapse:collapse; margin-top:20px; }
        .grid th, .grid td { border:1px solid #ddd; padding:10px; text-align:left; vertical-align:top; }
        .grid th { background:#D3D3FF; }
    </style>
</head>
<body>
<form id="form2" runat="server">
    <div class="container">
        <div class="back"><a href="AdminDashboard.aspx">← Back to Admin Dashboard</a></div>
        <h1>Stray Reports</h1>

        <asp:GridView ID="gvReports" runat="server" AutoGenerateColumns="False" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="ReportId" HeaderText="Report ID" />
                <asp:BoundField DataField="Username" HeaderText="Reporter" />
                <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:BoundField DataField="AnimalCondition" HeaderText="Condition" />
                <asp:BoundField DataField="KeepStatus" HeaderText="Kept/Reported" />
                <asp:BoundField DataField="ReportStatus" HeaderText="Status" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:MMMM dd, yyyy hh:mm tt}" />
            </Columns>
        </asp:GridView>
    </div>
</form>
</body>
</html>