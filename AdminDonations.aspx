<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDonations.aspx.cs" Inherits="StrayCare6._0.AdminDonations" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Donations</title>
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
        <h1>Donations</h1>

        <asp:GridView ID="gvDonations" runat="server" AutoGenerateColumns="False" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="DonationId" HeaderText="Donation ID" />
                <asp:BoundField DataField="Username" HeaderText="User" />
                <asp:BoundField DataField="DonationType" HeaderText="Type" />
                <asp:BoundField DataField="DonorName" HeaderText="Donor Name" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference Number" />
                <asp:BoundField DataField="InKindItems" HeaderText="In-Kind Items" />
                <asp:BoundField DataField="DeliveryMethod" HeaderText="Delivery Method" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:MMMM dd, yyyy hh:mm tt}" />
            </Columns>
        </asp:GridView>
    </div>
</form>
</body>
</html>