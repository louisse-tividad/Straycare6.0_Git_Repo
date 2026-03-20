<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donations.aspx.cs" Inherits="StrayCare6._0.Donations" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Make a Donation</title>
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

        .choice-row {
            display: flex;
            gap: 14px;
            margin-bottom: 24px;
            flex-wrap: wrap;
        }

        .choice-btn {
            padding: 14px 22px;
            border-radius: 12px;
            border: 1px solid #8f8f8f;
            background-color: #D3D3FF;
            font-weight: 800;
            cursor: pointer;
            min-width: 180px;
        }

        .choice-btn:hover {
            background-color: #c2c2ff;
        }

        .panel {
            background: #f8f7f2;
            border: 1px solid #ddd;
            border-radius: 14px;
            padding: 20px;
            margin-top: 16px;
        }

        .message-label {
            display: block;
            min-height: 24px;
            margin-bottom: 14px;
            color: red;
            font-weight: 700;
        }

        .success {
            color: green;
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
            background-color: #fff;
            font-size: 14px;
        }

        .textarea-box {
            min-height: 90px;
            resize: vertical;
        }

        .info-box {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 14px;
            line-height: 1.7;
        }

        .checklist {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 12px 14px;
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

    <script type="text/javascript">
        function showDonationPanel(type) {
            var cashPanel = document.getElementById("cashPanel");
            var inKindPanel = document.getElementById("inKindPanel");
            var hiddenField = document.getElementById("<%= hfDonationType.ClientID %>");

            if (type === "Cash") {
                cashPanel.style.display = "block";
                inKindPanel.style.display = "none";
                hiddenField.value = "Cash";
            } else if (type === "In-Kind") {
                cashPanel.style.display = "none";
                inKindPanel.style.display = "block";
                hiddenField.value = "In-Kind";
            }
        }

        window.onload = function () {
            var selected = document.getElementById("<%= hfDonationType.ClientID %>").value;
            if (selected === "Cash") {
                showDonationPanel("Cash");
            } else if (selected === "In-Kind") {
                showDonationPanel("In-Kind");
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="topbar">
            <div class="brand">StrayCare - Make a Donation</div>
            <div class="back-link">
                <a href="Dashboard.aspx">← Back to Dashboard</a>
            </div>
        </div>

        <div class="container">
            <h1>Make a Donation</h1>

            <div class="note-box">
                You may choose to donate through <b>Cash Donation</b> or <b>In-Kind Donation</b>.
            </div>

            <asp:HiddenField ID="hfDonationType" runat="server" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <div class="choice-row">
                <button type="button" class="choice-btn" onclick="showDonationPanel('Cash')">Cash Donation</button>
                <button type="button" class="choice-btn" onclick="showDonationPanel('In-Kind')">In-Kind Donation</button>
            </div>

            <!-- CASH DONATION PANEL -->
            <div id="cashPanel" class="panel" style="display:none;">
                <div class="grid">
                    <div class="label">Shelter Details</div>
                    <div class="info-box">
                        <b>Shelter Name:</b> Second Change Aspin Shelter Philippines Inc. (SECASPI)<br />
                        <b>GCASH Number:</b> 09953636950
                    </div>

                    <div class="label">Donor Name *</div>
                    <div>
                        <asp:TextBox ID="txtDonorName" runat="server" CssClass="textbox"></asp:TextBox>
                    </div>

                    <div class="label">Amount *</div>
                    <div>
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="textbox" placeholder="Enter amount"></asp:TextBox>
                    </div>

                    <div class="label">Reference Number *</div>
                    <div>
                        <asp:TextBox ID="txtReferenceNumber" runat="server" CssClass="textbox"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- IN-KIND DONATION PANEL -->
            <div id="inKindPanel" class="panel" style="display:none;">
                <div class="grid">
                    <div class="label">What are you donating? *</div>
                    <div class="checklist">
                        <asp:CheckBoxList ID="cblItems" runat="server">
                            <asp:ListItem Text="Dog Treats" Value="Dog Treats"></asp:ListItem>
                            <asp:ListItem Text="Dog/Puppy Food (wet and dry)" Value="Dog/Puppy Food (wet and dry)"></asp:ListItem>
                            <asp:ListItem Text="Toys (new and gently used)" Value="Toys (new and gently used)"></asp:ListItem>
                            <asp:ListItem Text="Dog Shampoo" Value="Dog Shampoo"></asp:ListItem>
                            <asp:ListItem Text="Cat Treats" Value="Cat Treats"></asp:ListItem>
                            <asp:ListItem Text="Cat/Puppy Food (wet and dry)" Value="Cat/Puppy Food (wet and dry)"></asp:ListItem>
                            <asp:ListItem Text="Cat Shampoo" Value="Cat Shampoo"></asp:ListItem>
                        </asp:CheckBoxList>
                    </div>

                    <div class="label">How will you send it? *</div>
                    <div>
                        <asp:DropDownList ID="ddlDeliveryMethod" runat="server" CssClass="dropdownlist">
                            <asp:ListItem Text="-- Select Delivery Method --" Value=""></asp:ListItem>
                            <asp:ListItem Text="Lalamove" Value="Lalamove"></asp:ListItem>
                            <asp:ListItem Text="Drop-Off" Value="Drop-Off"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="btn-row">
                <asp:Button ID="btnDone" runat="server" Text="Done" CssClass="btn" OnClick="btnDone_Click" />
            </div>
        </div>
    </form>
</body>
</html>