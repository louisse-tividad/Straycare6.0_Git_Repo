<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdoptionApply.aspx.cs" Inherits="StrayCare6._0.AdoptionApply" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Adoption Application</title>
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
            max-width: 900px;
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

        .message-label {
            display: block;
            min-height: 24px;
            margin-bottom: 14px;
            color: red;
            font-weight: 700;
        }

        .grid {
            display: grid;
            grid-template-columns: 220px 1fr;
            gap: 14px 18px;
            align-items: start;
        }

        .label {
            font-weight: 700;
            padding-top: 10px;
        }

        .textbox, .dropdownlist, .textarea-box {
            width: 100%;
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background-color: #f8f7f2;
            font-size: 14px;
        }

        .textarea-box {
            min-height: 100px;
            resize: vertical;
        }

        .pet-box {
            background: #f8f7f2;
            border: 1px solid #ddd;
            border-radius: 14px;
            padding: 14px;
            margin-bottom: 20px;
        }

        .warning-box {
            background: #fff3cd;
            border: 1px solid #ffe69c;
            border-radius: 12px;
            padding: 14px;
            margin-top: 20px;
            font-weight: 700;
        }

        .btn-row {
            margin-top: 24px;
            text-align: right;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 12px;
            border: 1px solid #8f8f8f;
            background-color: #D3D3FF;
            font-weight: 800;
            cursor: pointer;
            margin-left: 10px;
        }

        .btn:hover {
            background-color: #c2c2ff;
        }

        @media screen and (max-width: 768px) {
            .grid {
                grid-template-columns: 1fr;
            }

            .label {
                padding-top: 0;
            }

            .btn-row {
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="topbar">
            <div class="brand">StrayCare - Adoption Application</div>
            <div class="back-link">
                <a href="Adopt.aspx">← Back to Adoption List</a>
            </div>
        </div>

        <div class="container">
            <h1>Adoption Application</h1>

            <div class="note-box">
                Please fill in the form honestly. Shelter Admin will review your application before approval.
            </div>

            <div class="pet-box">
                <b>Selected Pet:</b>
                <asp:Label ID="lblPetInfo" runat="server"></asp:Label>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <div class="grid">
                <div class="label">Full Name *</div>
                <div>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="textbox"></asp:TextBox>
                </div>

                <div class="label">Full Address *</div>
                <div>
                    <asp:TextBox ID="txtFullAddress" runat="server" TextMode="MultiLine" CssClass="textarea-box"></asp:TextBox>
                </div>

                <div class="label">Housing Information *</div>
                <div>
                    <asp:TextBox ID="txtHousingInfo" runat="server" TextMode="MultiLine" CssClass="textarea-box"
                        placeholder="Describe your home environment for the pet"></asp:TextBox>
                </div>

                <div class="label">House Type *</div>
                <div>
                    <asp:DropDownList ID="ddlHouseType" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Text="-- Select House Type --" Value=""></asp:ListItem>
                        <asp:ListItem Text="House" Value="House"></asp:ListItem>
                        <asp:ListItem Text="Apartment" Value="Apartment"></asp:ListItem>
                        <asp:ListItem Text="Condo" Value="Condo"></asp:ListItem>
                        <asp:ListItem Text="Townhouse" Value="Townhouse"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="label">Do you own or rent? *</div>
                <div>
                    <asp:DropDownList ID="ddlOwnOrRent" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Own" Value="Own"></asp:ListItem>
                        <asp:ListItem Text="Rent" Value="Rent"></asp:ListItem>
                    </asp:DropDownList>
                    <div style="font-size:12px; color:#666; margin-top:6px;">
                        If renting, landlord permission is required.
                    </div>
                </div>

                <div class="label">Employment Status *</div>
                <div>
                    <asp:DropDownList ID="ddlEmploymentStatus" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Text="-- Select Status --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Employed Full-Time" Value="Employed Full-Time"></asp:ListItem>
                        <asp:ListItem Text="Employed Part-Time" Value="Employed Part-Time"></asp:ListItem>
                        <asp:ListItem Text="Self-Employed" Value="Self-Employed"></asp:ListItem>
                        <asp:ListItem Text="Retired" Value="Retired"></asp:ListItem>
                        <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="label">Other Details *</div>
                <div>
                    <asp:TextBox ID="txtOtherDetails" runat="server" TextMode="MultiLine" CssClass="textarea-box"
                        placeholder="Why do you want to adopt?"></asp:TextBox>
                </div>
            </div>

            <div class="warning-box">
                Important Notice: Submitting false details will result in account restrictions or permanent bans.
            </div>

            <div class="btn-row">
                <asp:Button ID="btnSubmit" runat="server" Text="Done" CssClass="btn" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>