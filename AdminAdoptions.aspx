<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAdoptions.aspx.cs" Inherits="StrayCare6._0.AdminAdoptions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Adoptions</title>
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
        <h1>Adoption Applications</h1>

        <asp:GridView ID="gvAdoptions" runat="server" AutoGenerateColumns="False" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="ApplicationId" HeaderText="Application ID" />
                <asp:BoundField DataField="Username" HeaderText="Applicant" />
                <asp:BoundField DataField="AnimalType" HeaderText="Pet Type" />
                <asp:BoundField DataField="Gender" HeaderText="Pet Gender" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="HouseType" HeaderText="House Type" />
                <asp:BoundField DataField="OwnOrRent" HeaderText="Own/Rent" />
                <asp:BoundField DataField="EmploymentStatus" HeaderText="Employment" />
                <asp:BoundField DataField="ApplicationStatus" HeaderText="Status" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:MMMM dd, yyyy hh:mm tt}" />
            </Columns>
        </asp:GridView>
    </div>
</form>
</body>
</html>
