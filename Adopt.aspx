<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adopt.aspx.cs" Inherits="StrayCare6._0.Adopt" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Adopt</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
            color: #222;
        }

        .topbar {
            background-color: #D3D3FF;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 28px;
            font-weight: 800;
        }

        .back-link a {
            text-decoration: none;
            color: #222;
            font-weight: 700;
        }

        .container {
            max-width: 1100px;
            margin: 30px auto;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            padding: 30px;
            box-sizing: border-box;
        }

        h1 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 34px;
        }

        .note-box {
            background-color: #D3D3FF;
            border-radius: 12px;
            padding: 14px 18px;
            margin-bottom: 22px;
            line-height: 1.6;
        }

        .filter-row {
            margin-bottom: 24px;
            display: flex;
            gap: 12px;
            align-items: center;
            flex-wrap: wrap;
        }

        .dropdownlist, .btn {
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn {
            background-color: #D3D3FF;
            font-weight: 800;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #c2c2ff;
        }

        .message-label {
            display: block;
            min-height: 24px;
            margin-bottom: 14px;
            color: red;
            font-weight: 700;
        }

        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 24px;
        }

        .pet-card {
            width: 250px;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 6px 14px rgba(0,0,0,0.12);
            overflow: hidden;
            text-align: center;
        }

        .pet-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            display: block;
        }

        .pet-info {
            padding: 16px;
        }

        .pet-info h3 {
            margin: 0 0 8px 0;
        }

        .pet-info p {
            margin: 6px 0;
        }

        .empty-box {
            background: #f8f7f2;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="topbar">
            <div class="brand">StrayCare - Adoption Page</div>
            <div class="back-link">
                <a href="Dashboard.aspx">← Back to Dashboard</a>
            </div>
        </div>

        <div class="container">
            <h1>Adopt a Stray</h1>

            <div class="note-box">
                Choose whether you want to adopt a <b>Dog</b> or a <b>Cat</b>.  
                The list below is handled by the Shelter Admin. Once you apply, your request will be reviewed before approval.
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <div class="filter-row">
                <asp:DropDownList ID="ddlAnimalType" runat="server" CssClass="dropdownlist">
                    <asp:ListItem Text="-- Select Type --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Dog" Value="Dog"></asp:ListItem>
                    <asp:ListItem Text="Cat" Value="Cat"></asp:ListItem>
                </asp:DropDownList>

                <asp:Button ID="btnFilter" runat="server" Text="Show Available Pets" CssClass="btn" OnClick="btnFilter_Click" />
            </div>

            <asp:Repeater ID="rptPets" runat="server">
                <HeaderTemplate>
                    <div class="card-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="pet-card">
                        <img src='<%# ResolveUrl(Eval("PhotoPath").ToString()) %>' alt="Pet Photo" />
                        <div class="pet-info">
                            <h3><%# Eval("AnimalType") %></h3>
                            <p><b>Gender:</b> <%# Eval("Gender") %></p>
                            <p>
                                <a href='AdoptionApply.aspx?petId=<%# Eval("PetId") %>' class="btn" style="text-decoration:none; display:inline-block;">
                                    Ready to Adopt
                                </a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="empty-box">
                No available pets found for the selected type.
            </asp:Panel>
        </div>
    </form>
</body>
</html>